import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'nawbar_mob_model.dart';
export 'nawbar_mob_model.dart';

class NawbarMobWidget extends StatefulWidget {
  const NawbarMobWidget({
    super.key,
    required this.page,
  });

  final String? page;

  @override
  State<NawbarMobWidget> createState() => _NawbarMobWidgetState();
}

class _NawbarMobWidgetState extends State<NawbarMobWidget> {
  late NawbarMobModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NawbarMobModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        FFIcons.khome1,
                        color: widget.page == 'Dashbord'
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: widget.page == 'Dashbord' ? 30.0 : 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(HomePageWidget.routeName);
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                FFIcons.kbubbles,
                                color: widget.page == 'Wiadomoci'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: widget.page == 'Wiadomoci' ? 30.0 : 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              FFIcons.kexclamationTriangle,
                              color: widget.page == 'Reklamacje'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: widget.page == 'Reklamacje' ? 30.0 : 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(ReklamacjeWidget.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              FFIcons.knotification,
                              color: widget.page == 'Dyskusje'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: widget.page == 'Dyskusje' ? 30.0 : 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                DyskusjeWidget.routeName,
                                queryParameters: {
                                  'namepage': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        FFIcons.kuser1,
                        color: widget.page == 'Profile'
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: widget.page == 'Profile' ? 30.0 : 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(ProfileWidget.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
