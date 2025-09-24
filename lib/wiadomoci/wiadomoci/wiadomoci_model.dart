import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/message/headerchat/headerchat_widget.dart';
import '/message/lastmessage_item/lastmessage_item_widget.dart';
import '/message/messageitem/messageitem_widget.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import '/message/sendmessage/sendmessage_widget.dart';
import '/index.dart';
import 'wiadomoci_widget.dart' show WiadomociWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WiadomociModel extends FlutterFlowModel<WiadomociWidget> {
  ///  Local state fields for this page.

  String? selectedThreadId;

  String? selectedThreadLogin;

  String? selectedThreadAvatar;

  bool? selectedThreadIsRead;

  String? selectedThreadDate;

  String? selectedThreadLastMessage;

  List<dynamic> messagesList = [];
  void addToMessagesList(dynamic item) => messagesList.add(item);
  void removeFromMessagesList(dynamic item) => messagesList.remove(item);
  void removeAtIndexFromMessagesList(int index) => messagesList.removeAt(index);
  void insertAtIndexInMessagesList(int index, dynamic item) =>
      messagesList.insert(index, item);
  void updateMessagesListAtIndex(int index, Function(dynamic) updateFn) =>
      messagesList[index] = updateFn(messagesList[index]);

  dynamic firstMessage;

  bool isOfferCardExpanded = false;

  bool isLoad = true;

  int? allegroAccountId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllChats)] action in Wiadomoci widget.
  ApiCallResponse? getALLChats;
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Models for lastmessageItem dynamic component.
  late FlutterFlowDynamicModels<LastmessageItemModel> lastmessageItemModels1;
  // Stores action output result for [Backend Call - API (getThreadMessages)] action in lastmessageItem widget.
  ApiCallResponse? apiResultGETMessageWEB;
  // Stores action output result for [Backend Call - API (getOrderDetails)] action in lastmessageItem widget.
  ApiCallResponse? apiResultORDERWEB;
  // Stores action output result for [Backend Call - API (getOfferDetails)] action in lastmessageItem widget.
  ApiCallResponse? apiResultOfferWEB;
  // Model for headerchat component.
  late HeaderchatModel headerchatModel;
  // Model for OfferCard component.
  late OfferCardModel offerCardModel;
  // Model for OrderCard component.
  late OrderCardModel orderCardModel;
  // Models for messageitem dynamic component.
  late FlutterFlowDynamicModels<MessageitemModel> messageitemModels;
  // Model for sendmessage component.
  late SendmessageModel sendmessageModel;
  // Stores action output result for [Backend Call - API (getThreadMessages)] action in sendmessage widget.
  ApiCallResponse? apiResultGETMessag;
  // Model for appbarDriwer component.
  late AppbarDriwerModel appbarDriwerModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  // Models for lastmessageItem dynamic component.
  late FlutterFlowDynamicModels<LastmessageItemModel> lastmessageItemModels2;
  // Model for driwer component.
  late DriwerModel driwerModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    lastmessageItemModels1 =
        FlutterFlowDynamicModels(() => LastmessageItemModel());
    headerchatModel = createModel(context, () => HeaderchatModel());
    offerCardModel = createModel(context, () => OfferCardModel());
    orderCardModel = createModel(context, () => OrderCardModel());
    messageitemModels = FlutterFlowDynamicModels(() => MessageitemModel());
    sendmessageModel = createModel(context, () => SendmessageModel());
    appbarDriwerModel = createModel(context, () => AppbarDriwerModel());
    lastmessageItemModels2 =
        FlutterFlowDynamicModels(() => LastmessageItemModel());
    driwerModel = createModel(context, () => DriwerModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    lastmessageItemModels1.dispose();
    headerchatModel.dispose();
    offerCardModel.dispose();
    orderCardModel.dispose();
    messageitemModels.dispose();
    sendmessageModel.dispose();
    appbarDriwerModel.dispose();
    listViewPagingController3?.dispose();
    lastmessageItemModels2.dispose();
    driwerModel.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController3(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall3 = apiCall;
    return listViewPagingController3 ??= _createListViewController3(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController3(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAccountThreadsPage3);
  }

  void listViewGetAccountThreadsPage3(ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker)
          .then((listViewGetAccountThreadsResponse) {
        final pageItems = (getJsonField(
                  listViewGetAccountThreadsResponse.jsonBody,
                  r'''$.data.threads''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController3?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetAccountThreadsResponse,
                )
              : null,
        );
      });
}
