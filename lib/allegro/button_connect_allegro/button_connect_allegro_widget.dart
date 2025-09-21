import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_connect_allegro_model.dart';
export 'button_connect_allegro_model.dart';

class ButtonConnectAllegroWidget extends StatefulWidget {
  const ButtonConnectAllegroWidget({super.key});

  @override
  State<ButtonConnectAllegroWidget> createState() =>
      _ButtonConnectAllegroWidgetState();
}

class _ButtonConnectAllegroWidgetState
    extends State<ButtonConnectAllegroWidget> {
  late ButtonConnectAllegroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonConnectAllegroModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          _model.authUrlResponse =
              await AllegroConnectAPIGroup.getAllegroAuthUrlCall.call(
            token: FFAppState().authToken,
          );

          if ((_model.authUrlResponse?.succeeded ?? true)) {
            await launchURL(getJsonField(
              (_model.authUrlResponse?.jsonBody ?? ''),
              r'''$.data.authorization_url''',
            ).toString());
          }

          safeSetState(() {});
        },
        text: 'Podłączyć konto Allegro',
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).tertiary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.notoSans(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: Colors.white,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
