import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reg_in_widget.dart' show RegInWidget;
import 'package:flutter/material.dart';

class RegInModel extends FlutterFlowModel<RegInWidget> {
  ///  Local state fields for this page.

  String? tempToken;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressReg widget.
  FocusNode? emailAddressRegFocusNode;
  TextEditingController? emailAddressRegTextController;
  String? Function(BuildContext, String?)?
      emailAddressRegTextControllerValidator;
  // State field(s) for passwordReg2 widget.
  FocusNode? passwordReg2FocusNode;
  TextEditingController? passwordReg2TextController;
  late bool passwordReg2Visibility;
  String? Function(BuildContext, String?)? passwordReg2TextControllerValidator;
  // State field(s) for passwordReg widget.
  FocusNode? passwordRegFocusNode;
  TextEditingController? passwordRegTextController;
  late bool passwordRegVisibility;
  String? Function(BuildContext, String?)? passwordRegTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordReg2Visibility = false;
    passwordRegVisibility = false;
  }

  @override
  void dispose() {
    emailAddressRegFocusNode?.dispose();
    emailAddressRegTextController?.dispose();

    passwordReg2FocusNode?.dispose();
    passwordReg2TextController?.dispose();

    passwordRegFocusNode?.dispose();
    passwordRegTextController?.dispose();
  }
}
