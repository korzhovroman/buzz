import '/allegro/listempty/listempty_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/pages/message_home/message_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dashbord_model.dart';
export 'dashbord_model.dart';

class DashbordWidget extends StatefulWidget {
  const DashbordWidget({
    super.key,
    String? namepage,
  }) : this.namepage = namepage ?? 'dashbord';

  final String namepage;

  static String routeName = 'Dashbord';
  static String routePath = '/onbording';

  @override
  State<DashbordWidget> createState() => _DashbordWidgetState();
}

class _DashbordWidgetState extends State<DashbordWidget> {
  late DashbordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashbordModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultSummary = await ConversationsGroup.getSummaryCall.call(
        authToken: FFAppState().authToken,
      );

      _model.summaryData = getJsonField(
        (_model.apiResultSummary?.jsonBody ?? ''),
        r'''$.data''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.isLoading = false;
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.driwerModel,
            updateCallback: () => safeSetState(() {}),
            child: DriwerWidget(
              namepage: widget.namepage,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (MediaQuery.sizeOf(context).width >= 900.0) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          wrapWithModel(
                            model: _model.sideNavWebModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SideNavWebWidget(
                              page: 'Dashbord',
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Visibility(
                                    visible: _model.isLoading == false,
                                    child: Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final summaryItemweb =
                                                  _model.summaryData.toList();
                                              if (summaryItemweb.isEmpty) {
                                                return ListemptyWidget();
                                              }

                                              return Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    summaryItemweb.length,
                                                    (summaryItemwebIndex) {
                                                  final summaryItemwebItem =
                                                      summaryItemweb[
                                                          summaryItemwebIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .messageHomeModels1
                                                        .getModel(
                                                      getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      summaryItemwebIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: MessageHomeWidget(
                                                      key: Key(
                                                        'Key63m_${getJsonField(
                                                          summaryItemwebItem,
                                                          r'''$.id''',
                                                        ).toString()}',
                                                      ),
                                                      accountId: getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.id''',
                                                      ),
                                                      allegrologin:
                                                          getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.allegro_login''',
                                                      ).toString(),
                                                      unreadthreads:
                                                          getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.unread_threads''',
                                                      ),
                                                      unreadDiscussions:
                                                          getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.unread_discussions''',
                                                      ),
                                                      unreadClaims:
                                                          getJsonField(
                                                        summaryItemwebItem,
                                                        r'''$.unread_claims''',
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          wrapWithModel(
                            model: _model.appbarDriwerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AppbarDriwerWidget(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: _model.isLoading == false,
                                  child: Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final summaryItem =
                                                _model.summaryData.toList();
                                            if (summaryItem.isEmpty) {
                                              return ListemptyWidget();
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: summaryItem.length,
                                              itemBuilder:
                                                  (context, summaryItemIndex) {
                                                final summaryItemItem =
                                                    summaryItem[
                                                        summaryItemIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .messageHomeModels2
                                                      .getModel(
                                                    getJsonField(
                                                      summaryItemItem,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    summaryItemIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: MessageHomeWidget(
                                                    key: Key(
                                                      'Key80r_${getJsonField(
                                                        summaryItemItem,
                                                        r'''$.id''',
                                                      ).toString()}',
                                                    ),
                                                    accountId: getJsonField(
                                                      summaryItemItem,
                                                      r'''$.id''',
                                                    ),
                                                    allegrologin: getJsonField(
                                                      summaryItemItem,
                                                      r'''$.allegro_login''',
                                                    ).toString(),
                                                    unreadthreads: getJsonField(
                                                      summaryItemItem,
                                                      r'''$.unread_threads''',
                                                    ),
                                                    unreadDiscussions:
                                                        getJsonField(
                                                      summaryItemItem,
                                                      r'''$.unread_discussions''',
                                                    ),
                                                    unreadClaims: getJsonField(
                                                      summaryItemItem,
                                                      r'''$.unread_claims''',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
