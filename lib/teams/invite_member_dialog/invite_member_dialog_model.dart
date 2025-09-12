import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_member_dialog_widget.dart' show InviteMemberDialogWidget;
import 'package:flutter/material.dart';

class InviteMemberDialogModel
    extends FlutterFlowModel<InviteMemberDialogWidget> {
  ///  Local state fields for this component.

  String? enteredName;

  String? enteredEmail;

  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  // Stores action output result for [Backend Call - API (inviteTeamMember)] action in Button widget.
  ApiCallResponse? apiResultINVAIT;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();
  }
}
