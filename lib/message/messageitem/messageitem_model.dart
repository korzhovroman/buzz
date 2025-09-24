import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'messageitem_widget.dart' show MessageitemWidget;
import 'package:flutter/material.dart';

class MessageitemModel extends FlutterFlowModel<MessageitemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (markChatAsRead)] action in messageitem widget.
  ApiCallResponse? apiResultb;
  // Stores action output result for [Custom Action - downloadAttachmentUniversal] action in Icon widget.
  bool? downloadAttachmentFile;
  // Stores action output result for [Custom Action - downloadAttachmentUniversal] action in Icon widget.
  bool? downloadAttachmentFileCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
