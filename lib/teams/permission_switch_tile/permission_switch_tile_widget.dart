import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'permission_switch_tile_model.dart';
export 'permission_switch_tile_model.dart';

class PermissionSwitchTileWidget extends StatefulWidget {
  const PermissionSwitchTileWidget({
    super.key,
    required this.allegroAccountItemt,
    required this.employeePermissionIds,
    required this.memberId,
    required this.onPermissionChange,
  });

  final dynamic allegroAccountItemt;
  final List<int>? employeePermissionIds;
  final int? memberId;
  final Future Function()? onPermissionChange;

  @override
  State<PermissionSwitchTileWidget> createState() =>
      _PermissionSwitchTileWidgetState();
}

class _PermissionSwitchTileWidgetState
    extends State<PermissionSwitchTileWidget> {
  late PermissionSwitchTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PermissionSwitchTileModel());

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

    return Material(
      color: Colors.transparent,
      child: SwitchListTile.adaptive(
        value: _model.switchListTileValue ??= functions.isIdInList(
            widget.employeePermissionIds?.toList(),
            getJsonField(
              widget.allegroAccountItemt,
              r'''$.id''',
            ))!,
        onChanged: (newValue) async {
          safeSetState(() => _model.switchListTileValue = newValue);
          if (newValue) {
            _model.grantPermission =
                await TeamConnectApiGroup.grantPermissionCall.call(
              token: FFAppState().authToken,
              memberId: widget.memberId,
              allegroAccountId: getJsonField(
                widget.allegroAccountItemt,
                r'''$.id''',
              ),
            );

            await widget.onPermissionChange?.call();

            safeSetState(() {});
          } else {
            _model.apiResulrevokePermission =
                await TeamConnectApiGroup.revokePermissionCall.call(
              token: FFAppState().authToken,
              memberId: widget.memberId,
              allegroAccountId: getJsonField(
                widget.allegroAccountItemt,
                r'''$.id''',
              ),
            );

            await widget.onPermissionChange?.call();

            safeSetState(() {});
          }
        },
        title: Text(
          getJsonField(
            widget.allegroAccountItemt,
            r'''$.allegro_login''',
          ).toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.poppins(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
        ),
        tileColor: FlutterFlowTheme.of(context).secondaryBackground,
        activeColor: FlutterFlowTheme.of(context).alternate,
        activeTrackColor: FlutterFlowTheme.of(context).primary,
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
