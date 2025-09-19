import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allegro_account_item_model.dart';
export 'allegro_account_item_model.dart';

class AllegroAccountItemWidget extends StatefulWidget {
  const AllegroAccountItemWidget({
    super.key,
    required this.accountJson,
    this.deleteAction,
  });

  final dynamic accountJson;
  final Future Function()? deleteAction;

  @override
  State<AllegroAccountItemWidget> createState() =>
      _AllegroAccountItemWidgetState();
}

class _AllegroAccountItemWidgetState extends State<AllegroAccountItemWidget> {
  late AllegroAccountItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllegroAccountItemModel());

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

    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 0.0),
              child: Text(
                'Konto:',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.robotoSerif(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              getJsonField(
                widget.accountJson,
                r'''$.allegro_login''',
              ).toString(),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.robotoSerif(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).alternate,
              icon: Icon(
                Icons.delete_forever,
                color: FlutterFlowTheme.of(context).primary,
                size: 20.0,
              ),
              onPressed: () async {
                // isConfirmed
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Potwierdź usunięcie'),
                          content: Text(
                              'Czy na pewno chcesz usunąć konto ${getJsonField(
                            widget.accountJson,
                            r'''$.allegro_login''',
                          ).toString()}?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Anuluj'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Usuń'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  _model.apiResultt0r = await AllegroConnectAPIGroup
                      .deleteAllegroAccountCall
                      .call(
                    token: FFAppState().authToken,
                    accountId: getJsonField(
                      widget.accountJson,
                      r'''$.id''',
                    ),
                  );

                  _model.apiResutUpdait =
                      await AllegroConnectAPIGroup.getAllegroAccountsCall.call(
                    token: FFAppState().authToken,
                  );

                  FFAppState().allegroAccounts = getJsonField(
                    (_model.apiResutUpdait?.jsonBody ?? ''),
                    r'''$.data''',
                  );
                  safeSetState(() {});
                  await widget.deleteAction?.call();
                }

                safeSetState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
