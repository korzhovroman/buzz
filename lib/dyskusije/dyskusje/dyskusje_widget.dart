import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/message/lastmessage_item/lastmessage_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'dyskusje_model.dart';
export 'dyskusje_model.dart';

class DyskusjeWidget extends StatefulWidget {
  const DyskusjeWidget({
    super.key,
    String? namepage,
  }) : this.namepage = namepage ?? 'wiadomoci';

  final String namepage;

  static String routeName = 'Dyskusje';
  static String routePath = '/dyskusje';

  @override
  State<DyskusjeWidget> createState() => _DyskusjeWidgetState();
}

class _DyskusjeWidgetState extends State<DyskusjeWidget> {
  late DyskusjeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DyskusjeModel());

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
              namepage: 'Dyskusje',
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
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
                              page: 'Dyskusje',
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: 350.0,
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
                                            .getAllChatsCall
                                            .call(
                                          offset: nextPageMarker.numItems,
                                          limit: 20,
                                          authToken: FFAppState().authToken,
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
                                                    0.0, 0.0, 0.0, 4.0),
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
                                                  'Keydcu_${getJsonField(
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
                                                accountId: getJsonField(
                                                  chatItemItem,
                                                  r'''$.allegroAccountId''',
                                                ),
                                                loadingMessage: () async {
                                                  var _shouldSetState = false;
                                                  _model.selectedThreadId =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.id''',
                                                  ).toString();
                                                  _model.allegroAccountId =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.allegroAccountId''',
                                                  );
                                                  _model.selectedThreadIsRead =
                                                      getJsonField(
                                                    chatItemItem,
                                                    r'''$.read''',
                                                  );
                                                  if (MediaQuery.sizeOf(context)
                                                          .width >=
                                                      900.0) {
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
                                                    _model.apiResultGETMessageWEB =
                                                        await ConversationsGroup
                                                            .getThreadMessagesCall
                                                            .call(
                                                      accountId: _model
                                                          .allegroAccountId,
                                                      threadId: _model
                                                          .selectedThreadId,
                                                      authToken: FFAppState()
                                                          .authToken,
                                                    );

                                                    _shouldSetState = true;
                                                    _model.messagesList =
                                                        getJsonField(
                                                      (_model.apiResultGETMessageWEB
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data.messages''',
                                                      true,
                                                    )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    _model.firstMessage = functions
                                                        .findMessageWithContext(
                                                            _model.messagesList
                                                                .toList());
                                                    await Future.wait([
                                                      Future(() async {
                                                        if ((getJsonField(
                                                                  _model
                                                                      .firstMessage,
                                                                  r'''$.relatesTo.order''',
                                                                ) !=
                                                                null) &&
                                                            (getJsonField(
                                                                  _model
                                                                      .firstMessage,
                                                                  r'''$.relatesTo.offer''',
                                                                ) ==
                                                                null)) {
                                                          _model.apiResultORDERWEB =
                                                              await ConversationsGroup
                                                                  .getOrderDetailsCall
                                                                  .call(
                                                            orderId:
                                                                getJsonField(
                                                              _model
                                                                  .firstMessage,
                                                              r'''$.relatesTo.order.id''',
                                                            ).toString(),
                                                            allegroAccountId: _model
                                                                .allegroAccountId
                                                                ?.toString(),
                                                            authToken:
                                                                FFAppState()
                                                                    .authToken,
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          _model
                                                              .firstMessage = (_model
                                                                  .apiResultORDERWEB
                                                                  ?.jsonBody ??
                                                              '');
                                                          _model.messagesList = functions
                                                              .parseMessages((_model
                                                                      .apiResultGETMessageWEB
                                                                      ?.jsonBody ??
                                                                  ''))
                                                              .toList()
                                                              .cast<dynamic>();
                                                        } else {
                                                          _model.messagesList = functions
                                                              .parseMessages((_model
                                                                      .apiResultGETMessageWEB
                                                                      ?.jsonBody ??
                                                                  ''))
                                                              .toList()
                                                              .cast<dynamic>();
                                                          _model.isLoad = false;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }),
                                                      Future(() async {
                                                        if ((getJsonField(
                                                                  _model
                                                                      .firstMessage,
                                                                  r'''$.relatesTo.offer''',
                                                                ) !=
                                                                null) &&
                                                            (getJsonField(
                                                                  _model
                                                                      .firstMessage,
                                                                  r'''$.relatesTo.order''',
                                                                ) ==
                                                                null)) {
                                                          _model.apiResultOfferWEB =
                                                              await ConversationsGroup
                                                                  .getOfferDetailsCall
                                                                  .call(
                                                            offerId:
                                                                getJsonField(
                                                              _model
                                                                  .firstMessage,
                                                              r'''$.relatesTo.offer.id''',
                                                            ).toString(),
                                                            allegroAccountId: _model
                                                                .allegroAccountId
                                                                ?.toString(),
                                                            authToken:
                                                                FFAppState()
                                                                    .authToken,
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          _model
                                                              .firstMessage = (_model
                                                                  .apiResultOfferWEB
                                                                  ?.jsonBody ??
                                                              '');
                                                          _model.messagesList = functions
                                                              .parseMessages((_model
                                                                      .apiResultGETMessageWEB
                                                                      ?.jsonBody ??
                                                                  ''))
                                                              .toList()
                                                              .cast<dynamic>();
                                                        } else {
                                                          _model.messagesList = functions
                                                              .parseMessages((_model
                                                                      .apiResultGETMessageWEB
                                                                      ?.jsonBody ??
                                                                  ''))
                                                              .toList()
                                                              .cast<dynamic>();
                                                          _model.isLoad = false;
                                                          safeSetState(() {});
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }),
                                                    ]);
                                                    _model.isLoad = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      ChatWiadomociWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'threadId':
                                                            serializeParam(
                                                          _model
                                                              .selectedThreadId,
                                                          ParamType.String,
                                                        ),
                                                        'accountId':
                                                            serializeParam(
                                                          _model
                                                              .allegroAccountId,
                                                          ParamType.int,
                                                        ),
                                                        'login': serializeParam(
                                                          getJsonField(
                                                            chatItemItem,
                                                            r'''$.interlocutor.login''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'avatar':
                                                            serializeParam(
                                                          getJsonField(
                                                            chatItemItem,
                                                            r'''$.interlocutor.avatarUrl''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'isThreadRead':
                                                            serializeParam(
                                                          _model
                                                              .selectedThreadIsRead,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_model
                                                          .selectedThreadIsRead ==
                                                      false) {
                                                    _model.apiResultjqq =
                                                        await ConversationsGroup
                                                            .markChatAsReadCall
                                                            .call(
                                                      accountId: _model
                                                          .allegroAccountId,
                                                      threadId: _model
                                                          .selectedThreadId,
                                                      authToken: FFAppState()
                                                          .authToken,
                                                    );

                                                    _shouldSetState = true;
                                                  }
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
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
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          wrapWithModel(
                            model: _model.appbarDriwerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AppbarDriwerWidget(),
                          ),
                          Expanded(
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
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
                                                      .getAllChatsCall
                                                      .call(
                                                offset: nextPageMarker.numItems,
                                                limit: 20,
                                                authToken:
                                                    FFAppState().authToken,
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
                                                        'Key1pm_${getJsonField(
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
                                                      accountId: getJsonField(
                                                        chatItemItem,
                                                        r'''$.allegroAccountId''',
                                                      ),
                                                      loadingMessage: () async {
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          ChatWiadomociWidget
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
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.allegroAccountId''',
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                            'login':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.interlocutor.login''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'avatar':
                                                                serializeParam(
                                                              getJsonField(
                                                                chatItemItem,
                                                                r'''$.interlocutor.avatarUrl''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'isThreadRead':
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
