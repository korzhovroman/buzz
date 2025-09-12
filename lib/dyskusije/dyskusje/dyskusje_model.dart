import '/flutter_flow/flutter_flow_util.dart';
import '/menu/nawbar_mob/nawbar_mob_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import 'dyskusje_widget.dart' show DyskusjeWidget;
import 'package:flutter/material.dart';

class DyskusjeModel extends FlutterFlowModel<DyskusjeWidget> {
  ///  Local state fields for this page.

  String? tempToken;

  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Model for NawbarMob component.
  late NawbarMobModel nawbarMobModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    nawbarMobModel = createModel(context, () => NawbarMobModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    nawbarMobModel.dispose();
  }
}
