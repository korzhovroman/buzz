import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/message/lastmessage_item/lastmessage_item_widget.dart';
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

  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // Models for lastmessageItem dynamic component.
  late FlutterFlowDynamicModels<LastmessageItemModel> lastmessageItemModels1;
  // Stores action output result for [Backend Call - API (getThreadMessages)] action in lastmessageItem widget.
  ApiCallResponse? apiResultGETMessage;
  // Model for appbarDriwer component.
  late AppbarDriwerModel appbarDriwerModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  // Models for lastmessageItem dynamic component.
  late FlutterFlowDynamicModels<LastmessageItemModel> lastmessageItemModels2;
  // Model for driwer component.
  late DriwerModel driwerModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    lastmessageItemModels1 =
        FlutterFlowDynamicModels(() => LastmessageItemModel());
    appbarDriwerModel = createModel(context, () => AppbarDriwerModel());
    lastmessageItemModels2 =
        FlutterFlowDynamicModels(() => LastmessageItemModel());
    driwerModel = createModel(context, () => DriwerModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    listViewPagingController1?.dispose();
    lastmessageItemModels1.dispose();
    appbarDriwerModel.dispose();
    listViewPagingController2?.dispose();
    lastmessageItemModels2.dispose();
    driwerModel.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAccountThreadsPage1);
  }

  void listViewGetAccountThreadsPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewGetAccountThreadsResponse) {
        final pageItems = (getJsonField(
                  listViewGetAccountThreadsResponse.jsonBody,
                  r'''$.data.threads''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
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

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAccountThreadsPage2);
  }

  void listViewGetAccountThreadsPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewGetAccountThreadsResponse) {
        final pageItems = (getJsonField(
                  listViewGetAccountThreadsResponse.jsonBody,
                  r'''$.data.threads''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
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
