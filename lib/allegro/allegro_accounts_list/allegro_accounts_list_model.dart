import '/allegro/allegro_account_item/allegro_account_item_widget.dart';
import '/allegro/button_connect_allegro_copy/button_connect_allegro_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'allegro_accounts_list_widget.dart' show AllegroAccountsListWidget;
import 'package:flutter/material.dart';

class AllegroAccountsListModel
    extends FlutterFlowModel<AllegroAccountsListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for AllegroAccountItem dynamic component.
  late FlutterFlowDynamicModels<AllegroAccountItemModel>
      allegroAccountItemModels;
  // Model for ButtonConnectAllegroCopy component.
  late ButtonConnectAllegroCopyModel buttonConnectAllegroCopyModel;

  @override
  void initState(BuildContext context) {
    allegroAccountItemModels =
        FlutterFlowDynamicModels(() => AllegroAccountItemModel());
    buttonConnectAllegroCopyModel =
        createModel(context, () => ButtonConnectAllegroCopyModel());
  }

  @override
  void dispose() {
    allegroAccountItemModels.dispose();
    buttonConnectAllegroCopyModel.dispose();
  }
}
