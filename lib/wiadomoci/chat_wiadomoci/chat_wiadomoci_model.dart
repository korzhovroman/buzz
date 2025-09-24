import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbarmob/appbarmob_widget.dart';
import '/message/headerchat/headerchat_widget.dart';
import '/message/messageitem/messageitem_widget.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import '/message/sendmessage/sendmessage_widget.dart';
import '/index.dart';
import 'chat_wiadomoci_widget.dart' show ChatWiadomociWidget;
import 'package:flutter/material.dart';

class ChatWiadomociModel extends FlutterFlowModel<ChatWiadomociWidget> {
  ///  Local state fields for this page.

  String? uploadedAttachmentId;

  List<dynamic> messagesList = [];
  void addToMessagesList(dynamic item) => messagesList.add(item);
  void removeFromMessagesList(dynamic item) => messagesList.remove(item);
  void removeAtIndexFromMessagesList(int index) => messagesList.removeAt(index);
  void insertAtIndexInMessagesList(int index, dynamic item) =>
      messagesList.insert(index, item);
  void updateMessagesListAtIndex(int index, Function(dynamic) updateFn) =>
      messagesList[index] = updateFn(messagesList[index]);

  dynamic firstMessage;

  bool isLoading = true;

  bool isOfferCardExpanded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getThreadMessages)] action in ChatWiadomoci widget.
  ApiCallResponse? apiResultGETMessage1;
  // Stores action output result for [Backend Call - API (getOrderDetails)] action in ChatWiadomoci widget.
  ApiCallResponse? apiResultORDER;
  // Stores action output result for [Backend Call - API (getOfferDetails)] action in ChatWiadomoci widget.
  ApiCallResponse? apiResultOffer;
  // Stores action output result for [Backend Call - API (markChatAsRead)] action in ChatWiadomoci widget.
  ApiCallResponse? apiResultjqq;
  // Model for appbarmob component.
  late AppbarmobModel appbarmobModel;
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
  ApiCallResponse? apiResultGETMessag2;

  @override
  void initState(BuildContext context) {
    appbarmobModel = createModel(context, () => AppbarmobModel());
    headerchatModel = createModel(context, () => HeaderchatModel());
    offerCardModel = createModel(context, () => OfferCardModel());
    orderCardModel = createModel(context, () => OrderCardModel());
    messageitemModels = FlutterFlowDynamicModels(() => MessageitemModel());
    sendmessageModel = createModel(context, () => SendmessageModel());
  }

  @override
  void dispose() {
    appbarmobModel.dispose();
    headerchatModel.dispose();
    offerCardModel.dispose();
    orderCardModel.dispose();
    messageitemModels.dispose();
    sendmessageModel.dispose();
  }
}
