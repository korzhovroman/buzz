import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/message/headerchat/headerchat_widget.dart';
import '/message/lastmessage_item/lastmessage_item_widget.dart';
import '/message/messageitem/messageitem_widget.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import '/message/sendmessage/sendmessage_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'wiadomoci_model.dart';
export 'wiadomoci_model.dart';

class WiadomociWidget extends StatefulWidget {
  const WiadomociWidget({
    super.key,
    String? namepage,
  }) : this.namepage = namepage ?? 'wiadomoci';

  final String namepage;

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
                              page: 'Wiadomoci',
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
                                          offset: 0,
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
                                            (_) => Image.asset(
                                          'assets/images/Bees_&_Bombs.gif',
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Image.asset(
                                          'assets/images/Bees_&_Bombs.gif',
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
                          Expanded(
                            flex: 1,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 24.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.isLoad == false) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model:
                                                        _model.headerchatModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: HeaderchatWidget(
                                                      avatar: _model
                                                          .selectedThreadAvatar!,
                                                      loginkupuecego: _model
                                                          .selectedThreadLogin!,
                                                      isOfferCardExpanded: _model
                                                          .isOfferCardExpanded,
                                                      isOfferCardShow: _model
                                                          .firstMessage
                                                          ?.toString(),
                                                      rozwin: () async {
                                                        _model.isOfferCardExpanded =
                                                            true;
                                                        safeSetState(() {});
                                                        safeSetState(() {});
                                                      },
                                                      ukryj: () async {
                                                        _model.isOfferCardExpanded =
                                                            false;
                                                        safeSetState(() {});
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  if ((_model.firstMessage !=
                                                          null) &&
                                                      (_model.isLoad == false))
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (getJsonField(
                                                                _model
                                                                    .firstMessage,
                                                                r'''$.data.sellingMode''',
                                                              ) !=
                                                              null) {
                                                            return Visibility(
                                                              visible: _model
                                                                      .isOfferCardExpanded ==
                                                                  true,
                                                              child: Container(
                                                                height: 150.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .offerCardModel,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      OfferCardWidget(
                                                                    offerName:
                                                                        getJsonField(
                                                                      _model
                                                                          .firstMessage,
                                                                      r'''$.data.name''',
                                                                    ).toString(),
                                                                    cena:
                                                                        getJsonField(
                                                                      _model
                                                                          .firstMessage,
                                                                      r'''$.data.sellingMode.price.amount''',
                                                                    ).toString(),
                                                                    valuta:
                                                                        getJsonField(
                                                                      _model
                                                                          .firstMessage,
                                                                      r'''$.data.sellingMode.price.currency''',
                                                                    ).toString(),
                                                                    rynek:
                                                                        getJsonField(
                                                                      _model
                                                                          .firstMessage,
                                                                      r'''$.data.publication.marketplaces.base.id''',
                                                                    ).toString(),
                                                                    image:
                                                                        getJsonField(
                                                                      _model
                                                                          .firstMessage,
                                                                      r'''$.data.primaryImage.url''',
                                                                    ).toString(),
                                                                    offertaURL:
                                                                        () async {
                                                                      await launchURL(functions.buildOfferUrl(
                                                                          getJsonField(
                                                                            _model.firstMessage,
                                                                            r'''$.data.publication.marketplaces.base.id''',
                                                                          ).toString(),
                                                                          getJsonField(
                                                                            _model.firstMessage,
                                                                            r'''$.data.id''',
                                                                          ).toString())!);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (getJsonField(
                                                                _model
                                                                    .firstMessage,
                                                                r'''$.data.buyer''',
                                                              ) !=
                                                              null) {
                                                            return Visibility(
                                                              visible: _model
                                                                      .isOfferCardExpanded ==
                                                                  true,
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .orderCardModel,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    OrderCardWidget(
                                                                  nameOrder:
                                                                      getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.lineItems[0].offer.name''',
                                                                  ).toString(),
                                                                  cena:
                                                                      getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.summary.totalToPay.amount''',
                                                                  ).toString(),
                                                                  valuta:
                                                                      getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.summary.totalToPay.currency''',
                                                                  ).toString(),
                                                                  data: functions
                                                                      .formatDateString(
                                                                          getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.lineItems[0].boughtAt''',
                                                                  ).toString()),
                                                                  rynek:
                                                                      getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.marketplace.id''',
                                                                  ).toString(),
                                                                  status: functions
                                                                      .translateStatusToPolish(
                                                                          getJsonField(
                                                                    _model
                                                                        .firstMessage,
                                                                    r'''$.data.fulfillment.status''',
                                                                  ).toString()),
                                                                  orderURL:
                                                                      () async {},
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    14.0,
                                                                    0.0,
                                                                    14.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Visibility(
                                                                  visible: _model
                                                                          .isLoad ==
                                                                      false,
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final chatsitem = _model
                                                                          .messagesList
                                                                          .toList();

                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        reverse:
                                                                            true,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            chatsitem.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                chatsitemIndex) {
                                                                          final chatsitemItem =
                                                                              chatsitem[chatsitemIndex];
                                                                          return wrapWithModel(
                                                                            model:
                                                                                _model.messageitemModels.getModel(
                                                                              getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              chatsitemIndex,
                                                                            ),
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            updateOnChange:
                                                                                true,
                                                                            child:
                                                                                MessageitemWidget(
                                                                              key: Key(
                                                                                'Key43l_${getJsonField(
                                                                                  chatsitemItem,
                                                                                  r'''$.id''',
                                                                                ).toString()}',
                                                                              ),
                                                                              messageText: getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.text''',
                                                                              ).toString(),
                                                                              messageTime: functions.formatDateStringAnswer(getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.createdAt''',
                                                                              ).toString())!,
                                                                              isMyMessage: getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.author.isInterlocutor''',
                                                                              ),
                                                                              attachmentUrl: getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.attachments[0].url''',
                                                                              ).toString(),
                                                                              attachmentFileName: getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.attachments[0].fileName''',
                                                                              ).toString(),
                                                                              authorName: getJsonField(
                                                                                        chatsitemItem,
                                                                                        r'''$.authorName''',
                                                                                      ) !=
                                                                                      null
                                                                                  ? getJsonField(
                                                                                      chatsitemItem,
                                                                                      r'''$.authorName''',
                                                                                    ).toString()
                                                                                  : getJsonField(
                                                                                      chatsitemItem,
                                                                                      r'''$.author.login''',
                                                                                    ).toString(),
                                                                              attachments: getJsonField(
                                                                                chatsitemItem,
                                                                                r'''$.attachments''',
                                                                              ).toString(),
                                                                              allegroAccountId: _model.allegroAccountId!,
                                                                              treadId: _model.selectedThreadId!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 14.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .sendmessageModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            SendmessageWidget(
                                                          accountid: _model
                                                              .allegroAccountId!,
                                                          threadId: _model
                                                              .selectedThreadId!,
                                                          onSendTapped:
                                                              () async {
                                                            _model.apiResultGETMessag =
                                                                await ConversationsGroup
                                                                    .getThreadMessagesCall
                                                                    .call(
                                                              accountId: _model
                                                                  .allegroAccountId,
                                                              threadId: _model
                                                                  .selectedThreadId,
                                                              authToken:
                                                                  FFAppState()
                                                                      .authToken,
                                                            );

                                                            _model.messagesList =
                                                                getJsonField(
                                                              (_model.apiResultGETMessag
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.messages''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                Visibility(
                                  visible: _model.isLoad == false,
                                  child: Expanded(
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
                                            child: PagedListView<
                                                ApiPagingParams, dynamic>(
                                              pagingController:
                                                  _model.setListViewController3(
                                                (nextPageMarker) =>
                                                    ConversationsGroup
                                                        .getAllChatsCall
                                                        .call(
                                                  offset: 0,
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
                                                    (_) => Image.asset(
                                                  'assets/images/Bees_&_Bombs.gif',
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Image.asset(
                                                  'assets/images/Bees_&_Bombs.gif',
                                                ),

                                                itemBuilder: (context, _,
                                                    chatItemIndex) {
                                                  final chatItemItem = _model
                                                      .listViewPagingController3!
                                                      .itemList![chatItemIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
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
                                                        lastmessage:
                                                            getJsonField(
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
                                                        loadingMessage:
                                                            () async {
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
                                                                ParamType
                                                                    .String,
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
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'avatar':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  chatItemItem,
                                                                  r'''$.interlocutor.avatarUrl''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
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
