import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressRessetPassword widget.
  FocusNode? emailAddressRessetPasswordFocusNode;
  TextEditingController? emailAddressRessetPasswordTextController;
  String? Function(BuildContext, String?)?
      emailAddressRessetPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressRessetPasswordFocusNode?.dispose();
    emailAddressRessetPasswordTextController?.dispose();
  }
}
