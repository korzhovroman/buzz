import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'billing_details_form_widget.dart' show BillingDetailsFormWidget;
import 'package:flutter/material.dart';

class BillingDetailsFormModel
    extends FlutterFlowModel<BillingDetailsFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for namefirm widget.
  FocusNode? namefirmFocusNode;
  TextEditingController? namefirmTextController;
  String? Function(BuildContext, String?)? namefirmTextControllerValidator;
  // State field(s) for adrefirm widget.
  FocusNode? adrefirmFocusNode;
  TextEditingController? adrefirmTextController;
  String? Function(BuildContext, String?)? adrefirmTextControllerValidator;
  // State field(s) for nip widget.
  FocusNode? nipFocusNode;
  TextEditingController? nipTextController;
  String? Function(BuildContext, String?)? nipTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateUserProfile)] action in Button widget.
  ApiCallResponse? apiResultUPDATE;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    namefirmFocusNode?.dispose();
    namefirmTextController?.dispose();

    adrefirmFocusNode?.dispose();
    adrefirmTextController?.dispose();

    nipFocusNode?.dispose();
    nipTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
