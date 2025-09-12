import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'allegro_model.dart';
export 'allegro_model.dart';

class AllegroWidget extends StatefulWidget {
  const AllegroWidget({
    super.key,
    bool? success,
  }) : this.success = success ?? true;

  final bool success;

  static String routeName = 'allegro';
  static String routePath = '/allegro';

  @override
  State<AllegroWidget> createState() => _AllegroWidgetState();
}

class _AllegroWidgetState extends State<AllegroWidget> {
  late AllegroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllegroModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.success == true) {
        context.pushNamed(AllegroSuccessWidget.routeName);
      } else {
        context.pushNamed(AllegroCancelledWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondary,
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(1.0, -0.87),
              end: AlignmentDirectional(-1.0, 0.87),
            ),
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
        ),
      ),
    );
  }
}
