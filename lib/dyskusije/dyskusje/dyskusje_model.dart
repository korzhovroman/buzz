import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import 'dyskusje_widget.dart' show DyskusjeWidget;
import 'package:flutter/material.dart';

class DyskusjeModel extends FlutterFlowModel<DyskusjeWidget> {
  ///  Local state fields for this page.

  String? tempToken;

  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Model for appbarDriwer component.
  late AppbarDriwerModel appbarDriwerModel;
  // Model for driwer component.
  late DriwerModel driwerModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    appbarDriwerModel = createModel(context, () => AppbarDriwerModel());
    driwerModel = createModel(context, () => DriwerModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    appbarDriwerModel.dispose();
    driwerModel.dispose();
  }
}
