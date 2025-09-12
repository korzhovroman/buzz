import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/teams/permission_switch_tile/permission_switch_tile_widget.dart';
import 'manage_permissions_dialog_widget.dart'
    show ManagePermissionsDialogWidget;
import 'package:flutter/material.dart';

class ManagePermissionsDialogModel
    extends FlutterFlowModel<ManagePermissionsDialogWidget> {
  ///  Local state fields for this component.

  List<int> permissionIds = [];
  void addToPermissionIds(int item) => permissionIds.add(item);
  void removeFromPermissionIds(int item) => permissionIds.remove(item);
  void removeAtIndexFromPermissionIds(int index) =>
      permissionIds.removeAt(index);
  void insertAtIndexInPermissionIds(int index, int item) =>
      permissionIds.insert(index, item);
  void updatePermissionIdsAtIndex(int index, Function(int) updateFn) =>
      permissionIds[index] = updateFn(permissionIds[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getEmployeePermissions)] action in ManagePermissionsDialog widget.
  ApiCallResponse? getemployeePermissions;
  // Models for PermissionSwitchTile dynamic component.
  late FlutterFlowDynamicModels<PermissionSwitchTileModel>
      permissionSwitchTileModels;
  // Stores action output result for [Backend Call - API (getEmployeePermissions)] action in PermissionSwitchTile widget.
  ApiCallResponse? updatedPermissions;

  @override
  void initState(BuildContext context) {
    permissionSwitchTileModels =
        FlutterFlowDynamicModels(() => PermissionSwitchTileModel());
  }

  @override
  void dispose() {
    permissionSwitchTileModels.dispose();
  }
}
