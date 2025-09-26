import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbarmob/appbarmob_widget.dart';
import '/message/headerchat/headerchat_widget.dart';
import '/message/messageitem/messageitem_widget.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import '/message/sendmessage/sendmessage_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'chat_wiadomoci_model.dart';
export 'chat_wiadomoci_model.dart';

///
///
class ChatWiadomociWidget extends StatefulWidget {
  const ChatWiadomociWidget({
    super.key,
    required this.threadId,
    required this.accountId,
    required this.login,
    required this.avatar,
    required this.isThreadRead,
  });

  final String? threadId;
  final int? accountId;
  final String? login;
  final String? avatar;
  final bool? isThreadRead;

  static String routeName = 'ChatWiadomoci';
  static String routePath = '/chatWiadomoci';

  @override
  State<ChatWiadomociWidget> createState() => _ChatWiadomociWidgetState();
}

class _ChatWiadomociWidgetState extends State<ChatWiadomociWidget> {
  late ChatWiadomociModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWiadomociModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultGETMessage1 =
          await ConversationsGroup.getThreadMessagesCall.call(
        accountId: widget.accountId,
        threadId: widget.threadId,
        authToken: FFAppState().authToken,
      );

      _model.messagesList = getJsonField(
        (_model.apiResultGETMessage1?.jsonBody ?? ''),
        r'''$.data.messages''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.firstMessage =
          functions.findMessageWithContext(_model.messagesList.toList());
      await Future.wait([
        Future(() async {
          if ((getJsonField(
                    _model.firstMessage,
                    r'''$.relatesTo.order''',
                  ) !=
                  null) &&
              (getJsonField(
                    _model.firstMessage,
                    r'''$.relatesTo.offer''',
                  ) ==
                  null)) {
            _model.apiResultORDER =
                await ConversationsGroup.getOrderDetailsCall.call(
              orderId: getJsonField(
                _model.firstMessage,
                r'''$.relatesTo.order.id''',
              ).toString(),
              allegroAccountId: widget.accountId?.toString(),
              authToken: FFAppState().authToken,
            );

            _model.firstMessage = (_model.apiResultORDER?.jsonBody ?? '');
            _model.messagesList = functions
                .parseMessages((_model.apiResultGETMessage1?.jsonBody ?? ''))
                .toList()
                .cast<dynamic>();
          } else {
            _model.messagesList = functions
                .parseMessages((_model.apiResultGETMessage1?.jsonBody ?? ''))
                .toList()
                .cast<dynamic>();
            _model.isLoading = false;
            safeSetState(() {});
            return;
          }
        }),
        Future(() async {
          if ((getJsonField(
                    _model.firstMessage,
                    r'''$.relatesTo.offer''',
                  ) !=
                  null) &&
              (getJsonField(
                    _model.firstMessage,
                    r'''$.relatesTo.order''',
                  ) ==
                  null)) {
            _model.apiResultOffer =
                await ConversationsGroup.getOfferDetailsCall.call(
              offerId: getJsonField(
                _model.firstMessage,
                r'''$.relatesTo.offer.id''',
              ).toString(),
              allegroAccountId: widget.accountId?.toString(),
              authToken: FFAppState().authToken,
            );

            _model.firstMessage = (_model.apiResultOffer?.jsonBody ?? '');
            _model.messagesList = functions
                .parseMessages((_model.apiResultGETMessage1?.jsonBody ?? ''))
                .toList()
                .cast<dynamic>();
          } else {
            _model.messagesList = functions
                .parseMessages((_model.apiResultGETMessage1?.jsonBody ?? ''))
                .toList()
                .cast<dynamic>();
            _model.isLoading = false;
            safeSetState(() {});
            return;
          }
        }),
      ]);
      safeSetState(() {});
      _model.isLoading = false;
      safeSetState(() {});
      if (widget.isThreadRead == false) {
        _model.apiResultjqq = await ConversationsGroup.markChatAsReadCall.call(
          accountId: widget.accountId,
          threadId: widget.threadId,
          authToken: FFAppState().authToken,
        );
      }
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
        body: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.appbarmobModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AppbarmobWidget(
                          onTap: () async {
                            context.pushNamed(
                              WiadomociAccountWidget.routeName,
                              queryParameters: {
                                'accountId': serializeParam(
                                  widget.accountId,
                                  ParamType.int,
                                ),
                                'namepage': serializeParam(
                                  '',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.headerchatModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderchatWidget(
                            avatar: widget.avatar!,
                            loginkupuecego: widget.login!,
                            isOfferCardExpanded: _model.isOfferCardExpanded,
                            isOfferCardShow: _model.firstMessage?.toString(),
                            rozwin: () async {
                              _model.isOfferCardExpanded = true;
                              safeSetState(() {});
                            },
                            ukryj: () async {
                              _model.isOfferCardExpanded = false;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                      if ((_model.firstMessage != null) &&
                          (_model.isLoading == false))
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 14.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (getJsonField(
                                        _model.firstMessage,
                                        r'''$.data.sellingMode''',
                                      ) !=
                                      null) {
                                    return Visibility(
                                      visible:
                                          _model.isOfferCardExpanded == true,
                                      child: Container(
                                        height: 150.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.offerCardModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: OfferCardWidget(
                                            offerName: getJsonField(
                                              _model.firstMessage,
                                              r'''$.data.name''',
                                            ).toString(),
                                            cena: getJsonField(
                                              _model.firstMessage,
                                              r'''$.data.sellingMode.price.amount''',
                                            ).toString(),
                                            valuta: getJsonField(
                                              _model.firstMessage,
                                              r'''$.data.sellingMode.price.currency''',
                                            ).toString(),
                                            rynek: getJsonField(
                                              _model.firstMessage,
                                              r'''$.data.publication.marketplaces.base.id''',
                                            ).toString(),
                                            image: getJsonField(
                                              _model.firstMessage,
                                              r'''$.data.primaryImage.url''',
                                            ).toString(),
                                            offertaURL: () async {
                                              await launchURL(
                                                  functions.buildOfferUrl(
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
                                        _model.firstMessage,
                                        r'''$.data.buyer''',
                                      ) !=
                                      null) {
                                    return Visibility(
                                      visible:
                                          _model.isOfferCardExpanded == true,
                                      child: wrapWithModel(
                                        model: _model.orderCardModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: OrderCardWidget(
                                          nameOrder: getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.lineItems[0].offer.name''',
                                          ).toString(),
                                          cena: getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.summary.totalToPay.amount''',
                                          ).toString(),
                                          valuta: getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.summary.totalToPay.currency''',
                                          ).toString(),
                                          data: functions
                                              .formatDateString(getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.lineItems[0].boughtAt''',
                                          ).toString()),
                                          rynek: getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.marketplace.id''',
                                          ).toString(),
                                          status:
                                              functions.translateStatusToPolish(
                                                  getJsonField(
                                            _model.firstMessage,
                                            r'''$.data.fulfillment.status''',
                                          ).toString()),
                                          orderURL: () async {},
                                        ),
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 14.0, 4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: _model.isLoading == false,
                                      child: Builder(
                                        builder: (context) {
                                          final chatsitem =
                                              _model.messagesList.toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            reverse: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: chatsitem.length,
                                            itemBuilder:
                                                (context, chatsitemIndex) {
                                              final chatsitemItem =
                                                  chatsitem[chatsitemIndex];
                                              return wrapWithModel(
                                                model: _model.messageitemModels
                                                    .getModel(
                                                  getJsonField(
                                                    chatsitemItem,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  chatsitemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: MessageitemWidget(
                                                  key: Key(
                                                    'Keyro0_${getJsonField(
                                                      chatsitemItem,
                                                      r'''$.id''',
                                                    ).toString()}',
                                                  ),
                                                  messageText: getJsonField(
                                                    chatsitemItem,
                                                    r'''$.text''',
                                                  ).toString(),
                                                  messageTime: functions
                                                      .formatDateStringAnswer(
                                                          getJsonField(
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
                                                  attachmentFileName:
                                                      getJsonField(
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
                                                  allegroAccountId:
                                                      widget.accountId!,
                                                  treadId: widget.threadId!,
                                                  shouldMarkAsRead:
                                                      widget.isThreadRead ==
                                                          false,
                                                  mimeType: getJsonField(
                                                    chatsitemItem,
                                                    r'''$.attachments[0].mimeType''',
                                                  ).toString(),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.sendmessageModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SendmessageWidget(
                      accountid: widget.accountId!,
                      threadId: widget.threadId!,
                      onSendTapped: () async {
                        _model.apiResultGETMessag2 =
                            await ConversationsGroup.getThreadMessagesCall.call(
                          accountId: widget.accountId,
                          threadId: widget.threadId,
                          authToken: FFAppState().authToken,
                        );

                        _model.messagesList = getJsonField(
                          (_model.apiResultGETMessag2?.jsonBody ?? ''),
                          r'''$.data.messages''',
                          true,
                        )!
                            .toList()
                            .cast<dynamic>();
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
