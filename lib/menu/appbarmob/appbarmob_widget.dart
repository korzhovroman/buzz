import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'appbarmob_model.dart';
export 'appbarmob_model.dart';

class AppbarmobWidget extends StatefulWidget {
  const AppbarmobWidget({
    super.key,
    required this.onTap,
  });

  final Future Function()? onTap;

  @override
  State<AppbarmobWidget> createState() => _AppbarmobWidgetState();
}

class _AppbarmobWidgetState extends State<AppbarmobWidget> {
  late AppbarmobModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarmobModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 8.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 34.0,
            ),
            onPressed: () async {
              await widget.onTap?.call();
            },
          ),
        ],
      ),
    );
  }
}
