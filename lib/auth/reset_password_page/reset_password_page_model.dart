import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_page_widget.dart' show ResetPasswordPageWidget;
import 'package:flutter/material.dart';

class ResetPasswordPageModel extends FlutterFlowModel<ResetPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordNew widget.
  FocusNode? passwordNewFocusNode;
  TextEditingController? passwordNewTextController;
  late bool passwordNewVisibility;
  String? Function(BuildContext, String?)? passwordNewTextControllerValidator;
  // State field(s) for passwordNewRepet widget.
  FocusNode? passwordNewRepetFocusNode;
  TextEditingController? passwordNewRepetTextController;
  late bool passwordNewRepetVisibility;
  String? Function(BuildContext, String?)?
      passwordNewRepetTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordNewVisibility = false;
    passwordNewRepetVisibility = false;
  }

  @override
  void dispose() {
    passwordNewFocusNode?.dispose();
    passwordNewTextController?.dispose();

    passwordNewRepetFocusNode?.dispose();
    passwordNewRepetTextController?.dispose();
  }
}
