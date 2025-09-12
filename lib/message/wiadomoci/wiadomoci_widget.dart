import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/nawbar_mob/nawbar_mob_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/message/chatstiem/chatstiem_widget.dart';
import '/message/lastmessage_item/lastmessage_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'wiadomoci_model.dart';
export 'wiadomoci_model.dart';

class WiadomociWidget extends StatefulWidget {
  const WiadomociWidget({
    super.key,
    required this.accountId,
  });

  final int? accountId;

  static String routeName = 'Wiadomoci';
  static String routePath = '/wiadomoci';

  @override
  State<WiadomociWidget> createState() => _WiadomociWidgetState();
}

class _WiadomociWidgetState extends State<WiadomociWidget> {
  late WiadomociModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WiadomociModel());

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
                              page: 'Wiadomoci',
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 0.0),
                              child: Container(
                                width: 400.0,
                                decoration: BoxDecoration(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child:
                                        PagedListView<ApiPagingParams, dynamic>(
                                      pagingController:
                                          _model.setListViewController1(
                                        (nextPageMarker) => ConversationsGroup
                                            .getAccountThreadsCall
                                            .call(
                                          authToken: FFAppState().authToken,
                                          limit: 20,
                                          offset: nextPageMarker.numItems,
                                          accountId: widget.accountId,
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<dynamic>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitChasingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitChasingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, chatItemIndex) {
                                          final chatItemItem = _model
                                              .listViewPagingController1!
                                              .itemList![chatItemIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .lastmessageItemModels1
                                                  .getModel(
                                                getJsonField(
                                                  chatItemItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                chatItemIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: LastmessageItemWidget(
                                                key: Key(
                                                  'Key8gh_${getJsonField(
                                                    chatItemItem,
                                                    r'''$.id''',
                                                  ).toString()}',
                                                ),
                                                login: getJsonField(
                                                  chatItemItem,
                                                  r'''$.interlocutor.login''',
                                                ).toString(),
                                                date:
                                                    functions.formatDateString(
                                                        getJsonField(
                                                  chatItemItem,
                                                  r'''$.lastMessageDateTime''',
                                                ).toString()),
                                                konto: getJsonField(
                                                  chatItemItem,
                                                  r'''$.allegroAccountLogin''',
                                                ).toString(),
                                                author: getJsonField(
                                                  chatItemItem,
                                                  r'''$.lastMessageAuthor''',
                                                ).toString(),
                                                lastmessage: getJsonField(
                                                  chatItemItem,
                                                  r'''$.lastMessageText''',
                                                ).toString(),
                                                isread: !getJsonField(
                                                  chatItemItem,
                                                  r'''$.read''',
                                                ),
                                                avatar: getJsonField(
                                                  chatItemItem,
                                                  r'''$.interlocutor.avatarUrl''',
                                                ).toString(),
                                                threadId: getJsonField(
                                                  chatItemItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                accountId: widget.accountId!,
                                                loadingMessage: () async {
                                                  _model.selectedThreadId =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.id''',
                                                  ).toString();
                                                  _model.selectedThreadLogin =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.interlocutor.login''',
                                                  ).toString();
                                                  _model.selectedThreadAvatar =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.interlocutor.avatarUrl''',
                                                  ).toString();
                                                  _model.selectedThreadIsRead =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.read''',
                                                  );
                                                  _model.selectedThreadDate =
                                                      functions
                                                          .formatDateString(
                                                              getJsonField(
                                                    chatItemItem,
                                                    r'''$.lastMessageDateTime''',
                                                  ).toString());
                                                  _model.selectedThreadLastMessage =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.lastMessageText''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 24.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.selectedThreadId == '') {
                                          return wrapWithModel(
                                            model: _model.chatstiemModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ChatstiemWidget(
                                              login:
                                                  _model.selectedThreadLogin!,
                                              date: _model.selectedThreadDate!,
                                              lastMessage: _model
                                                  .selectedThreadLastMessage!,
                                              isRead:
                                                  _model.selectedThreadIsRead!,
                                              avatar:
                                                  _model.selectedThreadAvatar!,
                                              threadId:
                                                  _model.selectedThreadId!,
                                              accountId: widget.accountId!,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: PagedListView<ApiPagingParams,
                                              dynamic>(
                                            pagingController:
                                                _model.setListViewController2(
                                              (nextPageMarker) =>
                                                  ConversationsGroup
                                                      .getAccountThreadsCall
                                                      .call(
                                                authToken:
                                                    FFAppState().authToken,
                                                limit: 20,
                                                offset: nextPageMarker.numItems,
                                                accountId: widget.accountId,
                                              ),
                                            ),
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            reverse: false,
                                            scrollDirection: Axis.vertical,
                                            builderDelegate:
                                                PagedChildBuilderDelegate<
                                                    dynamic>(
                                              // Customize what your widget looks like when it's loading the first page.
                                              firstPageProgressIndicatorBuilder:
                                                  (_) => Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitChasingDots(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              ),
                                              // Customize what your widget looks like when it's loading another page.
                                              newPageProgressIndicatorBuilder:
                                                  (_) => Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitChasingDots(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              ),

                                              itemBuilder:
                                                  (context, _, chatItemIndex) {
                                                final chatItemItem = _model
                                                    .listViewPagingController2!
                                                    .itemList![chatItemIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .lastmessageItemModels2
                                                        .getModel(
                                                      getJsonField(
                                                        chatItemItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      chatItemIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child:
                                                        LastmessageItemWidget(
                                                      key: Key(
                                                        'Keyzwg_${getJsonField(
                                                          chatItemItem,
                                                          r'''$.id''',
                                                        ).toString()}',
                                                      ),
                                                      login: getJsonField(
                                                        chatItemItem,
                                                        r'''$.interlocutor.login''',
                                                      ).toString(),
                                                      date: functions
                                                          .formatDateString(
                                                              getJsonField(
                                                        chatItemItem,
                                                        r'''$.lastMessageDateTime''',
                                                      ).toString()),
                                                      konto: getJsonField(
                                                        chatItemItem,
                                                        r'''$.allegroAccountLogin''',
                                                      ).toString(),
                                                      author: getJsonField(
                                                        chatItemItem,
                                                        r'''$.lastMessageAuthor''',
                                                      ).toString(),
                                                      lastmessage: getJsonField(
                                                        chatItemItem,
                                                        r'''$.lastMessageText''',
                                                      ).toString(),
                                                      isread: !getJsonField(
                                                        chatItemItem,
                                                        r'''$.read''',
                                                      ),
                                                      avatar: getJsonField(
                                                        chatItemItem,
                                                        r'''$.interlocutor.avatarUrl''',
                                                      ).toString(),
                                                      threadId: getJsonField(
                                                        chatItemItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      accountId:
                                                          widget.accountId!,
                                                      loadingMessage: () async {
                                                        context.goNamed(
                                                          ChatitemMOBWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'threadId':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'accountId':
                                                                serializeParam(
                                                              widget.accountId,
                                                              ParamType.int,
                                                            ),
                                                            'avatar':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.interlocutor.avatarUrl''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'name':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.interlocutor.login''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'date':
                                                                serializeParam(
                                                              functions
                                                                  .formatDateString(
                                                                      getJsonField(
                                                                chatItemItem,
                                                                r'''$.lastMessageDateTime''',
                                                              ).toString()),
                                                              ParamType.String,
                                                            ),
                                                            'lastMessage':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.lastMessageText''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'isRead':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.read''',
                                                              ),
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.nawbarMobModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NawbarMobWidget(
                                page: 'Wiadomoci',
                              ),
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
