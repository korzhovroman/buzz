import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'appbar_driwer_model.dart';
export 'appbar_driwer_model.dart';

class AppbarDriwerWidget extends StatefulWidget {
  const AppbarDriwerWidget({super.key});

  @override
  State<AppbarDriwerWidget> createState() => _AppbarDriwerWidgetState();
}

class _AppbarDriwerWidgetState extends State<AppbarDriwerWidget> {
  late AppbarDriwerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarDriwerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 8.0,
            icon: Icon(
              Icons.dehaze_sharp,
              color: FlutterFlowTheme.of(context).primary,
              size: 34.0,
            ),
            onPressed: () async {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
    );
  }
}
