import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressLog widget.
  FocusNode? emailAddressLogFocusNode;
  TextEditingController? emailAddressLogTextController;
  String? Function(BuildContext, String?)?
      emailAddressLogTextControllerValidator;
  // State field(s) for passwordLog widget.
  FocusNode? passwordLogFocusNode;
  TextEditingController? passwordLogTextController;
  late bool passwordLogVisibility;
  String? Function(BuildContext, String?)? passwordLogTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordLogVisibility = false;
  }

  @override
  void dispose() {
    emailAddressLogFocusNode?.dispose();
    emailAddressLogTextController?.dispose();

    passwordLogFocusNode?.dispose();
    passwordLogTextController?.dispose();
  }
}
