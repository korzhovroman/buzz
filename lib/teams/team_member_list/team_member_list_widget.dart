import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/teams/button_connect_member/button_connect_member_widget.dart';
import '/teams/team_member_list_item/team_member_list_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_member_list_model.dart';
export 'team_member_list_model.dart';

class TeamMemberListWidget extends StatefulWidget {
  const TeamMemberListWidget({
    super.key,
    this.memberData,
  });

  final List<dynamic>? memberData;

  @override
  State<TeamMemberListWidget> createState() => _TeamMemberListWidgetState();
}

class _TeamMemberListWidgetState extends State<TeamMemberListWidget> {
  late TeamMemberListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamMemberListModel());

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
      width: 330.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
        child: Container(
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Lista pracowników',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ),
                if (widget.memberData != null &&
                    (widget.memberData)!.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Builder(
                      builder: (context) {
                        final memberItem = functions
                            .filterOwnerFromList(
                                FFAppState().teamMembers.toList())
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: memberItem.length,
                          itemBuilder: (context, memberItemIndex) {
                            final memberItemItem = memberItem[memberItemIndex];
                            return wrapWithModel(
                              model: _model.teamMemberListItemModels.getModel(
                                getJsonField(
                                  memberItemItem,
                                  r'''$.member_id''',
                                ).toString(),
                                memberItemIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: TeamMemberListItemWidget(
                                key: Key(
                                  'Keycbo_${getJsonField(
                                    memberItemItem,
                                    r'''$.member_id''',
                                  ).toString()}',
                                ),
                                memberJson: memberItemItem,
                                removeAction: () async {
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                Text('Usunąć tego pracownika '),
                                            content: Text(getJsonField(
                                              memberItemItem,
                                              r'''$.name''',
                                            ).toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Anuluj'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Potwierdź'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    _model.apiResultDELET =
                                        await TeamConnectApiGroup
                                            .deleteTeamMemberCall
                                            .call(
                                      token: FFAppState().authToken,
                                      memberId: getJsonField(
                                        memberItemItem,
                                        r'''$.member_id''',
                                      ),
                                    );

                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 300,
                                      ),
                                    );
                                    _model.apiResultUPDAIT =
                                        await TeamConnectApiGroup
                                            .getTeamMembersCall
                                            .call(
                                      token: FFAppState().authToken,
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pracownik usunięty',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if ((_model.apiResultUPDAIT?.succeeded ??
                                        true)) {
                                      FFAppState().teamMembers = functions
                                          .filterOwnerFromList((_model
                                                  .apiResultUPDAIT?.jsonBody ??
                                              ''))
                                          .toList()
                                          .cast<dynamic>();
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().teamMembers = functions
                                          .filterOwnerFromList(
                                              FFAppState().teamMembers.toList())
                                          .toList()
                                          .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (widget.memberData!.length < 10)
                  wrapWithModel(
                    model: _model.buttonConnectMemberModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ButtonConnectMemberWidget(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
