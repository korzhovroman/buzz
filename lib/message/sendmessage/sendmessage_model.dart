import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sendmessage_widget.dart' show SendmessageWidget;
import 'package:flutter/material.dart';

class SendmessageModel extends FlutterFlowModel<SendmessageWidget> {
  ///  Local state fields for this component.

  String? attachmentId;

  bool? hasAttachment = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadFILE = false;
  FFUploadedFile uploadedLocalFile_uploadFILE =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFileToAllegro)] action in file widget.
  ApiCallResponse? apiResultFile;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (postMessage)] action in send widget.
  ApiCallResponse? apiResultpost;
  // Stores action output result for [Backend Call - API (postMessage)] action in send widget.
  ApiCallResponse? apiResultpost2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
