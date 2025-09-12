import '/allegro/button_connect_allegro/button_connect_allegro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listempty_widget.dart' show ListemptyWidget;
import 'package:flutter/material.dart';

class ListemptyModel extends FlutterFlowModel<ListemptyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ButtonConnectAllegro component.
  late ButtonConnectAllegroModel buttonConnectAllegroModel;

  @override
  void initState(BuildContext context) {
    buttonConnectAllegroModel =
        createModel(context, () => ButtonConnectAllegroModel());
  }

  @override
  void dispose() {
    buttonConnectAllegroModel.dispose();
  }
}
