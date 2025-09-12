import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'permission_switch_tile_widget.dart' show PermissionSwitchTileWidget;
import 'package:flutter/material.dart';

class PermissionSwitchTileModel
    extends FlutterFlowModel<PermissionSwitchTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Backend Call - API (grantPermission)] action in SwitchListTile widget.
  ApiCallResponse? grantPermission;
  // Stores action output result for [Backend Call - API (revokePermission)] action in SwitchListTile widget.
  ApiCallResponse? apiResulrevokePermission;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
