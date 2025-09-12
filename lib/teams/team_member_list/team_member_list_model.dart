import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/teams/button_connect_member/button_connect_member_widget.dart';
import '/teams/team_member_list_item/team_member_list_item_widget.dart';
import 'team_member_list_widget.dart' show TeamMemberListWidget;
import 'package:flutter/material.dart';

class TeamMemberListModel extends FlutterFlowModel<TeamMemberListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for TeamMemberListItem dynamic component.
  late FlutterFlowDynamicModels<TeamMemberListItemModel>
      teamMemberListItemModels;
  // Stores action output result for [Backend Call - API (deleteTeamMember)] action in TeamMemberListItem widget.
  ApiCallResponse? apiResultDELET;
  // Stores action output result for [Backend Call - API (getTeamMembers)] action in TeamMemberListItem widget.
  ApiCallResponse? apiResultUPDAIT;
  // Model for ButtonConnectMember component.
  late ButtonConnectMemberModel buttonConnectMemberModel;

  @override
  void initState(BuildContext context) {
    teamMemberListItemModels =
        FlutterFlowDynamicModels(() => TeamMemberListItemModel());
    buttonConnectMemberModel =
        createModel(context, () => ButtonConnectMemberModel());
  }

  @override
  void dispose() {
    teamMemberListItemModels.dispose();
    buttonConnectMemberModel.dispose();
  }
}
