import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/teams/permission_switch_tile/permission_switch_tile_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manage_permissions_dialog_model.dart';
export 'manage_permissions_dialog_model.dart';

class ManagePermissionsDialogWidget extends StatefulWidget {
  const ManagePermissionsDialogWidget({
    super.key,
    required this.memberData,
    required this.allegroAccounts,
  });

  final dynamic memberData;
  final List<dynamic>? allegroAccounts;

  @override
  State<ManagePermissionsDialogWidget> createState() =>
      _ManagePermissionsDialogWidgetState();
}

class _ManagePermissionsDialogWidgetState
    extends State<ManagePermissionsDialogWidget> {
  late ManagePermissionsDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagePermissionsDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getemployeePermissions =
          await TeamConnectApiGroup.getEmployeePermissionsCall.call(
        token: FFAppState().authToken,
        memberId: getJsonField(
          widget.memberData,
          r'''$.member_id''',
        ),
      );

      if (functions.isPermissionListEmpty(
          (_model.getemployeePermissions?.jsonBody ?? ''))!) {
        _model.permissionIds = [].toList().cast<int>();
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        _model.permissionIds = (getJsonField(
          (_model.getemployeePermissions?.jsonBody ?? ''),
          r'''$.data[*].allegro_account_id''',
          true,
        ) as List?)!
            .cast<int>()
            .toList()
            .cast<int>();
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        _model.isLoading = false;
        safeSetState(() {});
      }
    });

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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 60.0),
              child: Container(
                width: () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return 300.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return 330.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 350.0;
                  } else {
                    return 450.0;
                  }
                }(),
                height: 350.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kclose,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Dać pracownikowi  ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: getJsonField(
                                  widget.memberData,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: '  dostęp do takich kont',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 0.0),
                          child: Text(
                            'Wybierz konta, do których pracownik będzie miał dostęp',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.isLoading == true) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Bees_&_Bombs.gif',
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  final accountItem =
                                      widget.allegroAccounts!.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: accountItem.length,
                                    itemBuilder: (context, accountItemIndex) {
                                      final accountItemItem =
                                          accountItem[accountItemIndex];
                                      return wrapWithModel(
                                        model: _model.permissionSwitchTileModels
                                            .getModel(
                                          getJsonField(
                                            accountItemItem,
                                            r'''$.id''',
                                          ).toString(),
                                          accountItemIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PermissionSwitchTileWidget(
                                          key: Key(
                                            'Key1n6_${getJsonField(
                                              accountItemItem,
                                              r'''$.id''',
                                            ).toString()}',
                                          ),
                                          allegroAccountItemt: accountItemItem,
                                          memberId: getJsonField(
                                            widget.memberData,
                                            r'''$.member_id''',
                                          ),
                                          employeePermissionIds:
                                              _model.permissionIds,
                                          onPermissionChange: () async {
                                            _model.updatedPermissions =
                                                await TeamConnectApiGroup
                                                    .getEmployeePermissionsCall
                                                    .call(
                                              token: FFAppState().authToken,
                                              memberId: getJsonField(
                                                widget.memberData,
                                                r'''$.member_id''',
                                              ),
                                            );

                                            _model.permissionIds =
                                                (getJsonField(
                                              (_model.updatedPermissions
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data[*].allegro_account_id''',
                                              true,
                                            ) as List?)!
                                                    .cast<int>()
                                                    .toList()
                                                    .cast<int>();
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
