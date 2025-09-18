import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sendmessage_widget.dart' show SendmessageWidget;
import 'package:flutter/material.dart';

class SendmessageModel extends FlutterFlowModel<SendmessageWidget> {
  ///  Local state fields for this component.

  String? uploadfile;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadFILE = false;
  FFUploadedFile uploadedLocalFile_uploadFILE =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (declareAttachment)] action in file widget.
  ApiCallResponse? apiResultDeclareFile;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
