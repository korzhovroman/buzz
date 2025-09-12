import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/message/messageitem/messageitem_widget.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatstiem_model.dart';
export 'chatstiem_model.dart';

class ChatstiemWidget extends StatefulWidget {
  const ChatstiemWidget({
    super.key,
    required this.login,
    required this.date,
    required this.lastMessage,
    required this.isRead,
    required this.avatar,
    required this.threadId,
    required this.accountId,
  });

  final String? login;
  final String? date;
  final String? lastMessage;
  final bool? isRead;
  final String? avatar;
  final String? threadId;
  final int? accountId;

  @override
  State<ChatstiemWidget> createState() => _ChatstiemWidgetState();
}

class _ChatstiemWidgetState extends State<ChatstiemWidget> {
  late ChatstiemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatstiemModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryText,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (MediaQuery.sizeOf(context).width < 400.0)
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 0),
                              fadeOutDuration: Duration(milliseconds: 0),
                              imageUrl: widget.avatar!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.login,
                                  'login',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: FutureBuilder<ApiCallResponse>(
              future: ConversationsGroup.getThreadMessagesCall.call(
                accountId: widget.accountId,
                threadId: widget.threadId,
                authToken: FFAppState().authToken,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitChasingDots(
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                final columnGetThreadMessagesResponse = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 14.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (getJsonField(
                                      columnGetThreadMessagesResponse.jsonBody,
                                      r'''$.data.messages[0].offer''',
                                    ) !=
                                    null) {
                                  return wrapWithModel(
                                    model: _model.offerCardModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: OfferCardWidget(
                                      oferta: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.title''',
                                      ).toString(),
                                      cena: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.price.amount''',
                                      ).toString(),
                                      imege: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.images[0].url''',
                                      ).toString(),
                                      valuta: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.price.currency''',
                                      ).toString(),
                                      rynek: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.marketplace.id''',
                                      ).toString(),
                                      offerUrl: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.offer.url''',
                                      ).toString(),
                                    ),
                                  );
                                } else if (getJsonField(
                                      columnGetThreadMessagesResponse.jsonBody,
                                      r'''$.data.messages[0].relatesTo''',
                                    ) !=
                                    null) {
                                  return wrapWithModel(
                                    model: _model.orderCardModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: OrderCardWidget(
                                      orderId: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.order.id''',
                                      ).toString(),
                                      cena: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.order.totalCost.amount''',
                                      ).toString(),
                                      imege: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.offer.images[0].url''',
                                      ).toString(),
                                      valuta: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.order.totalCost.currency''',
                                      ).toString(),
                                      rynek: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.offer.marketplace.id''',
                                      ).toString(),
                                      orderStatus: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.order.status''',
                                      ).toString(),
                                      orderUrl: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.order.url''',
                                      ).toString(),
                                      offerUrl: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.offer.url''',
                                      ).toString(),
                                      oferta: getJsonField(
                                        columnGetThreadMessagesResponse
                                            .jsonBody,
                                        r'''$.data.messages[0].relatesTo.offer.title''',
                                      ).toString(),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E7EB),
                      ),
                      child: Builder(
                        builder: (context) {
                          final messageItem = getJsonField(
                            columnGetThreadMessagesResponse.jsonBody,
                            r'''$.data.messages''',
                          ).toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: messageItem.length,
                            itemBuilder: (context, messageItemIndex) {
                              final messageItemItem =
                                  messageItem[messageItemIndex];
                              return wrapWithModel(
                                model: _model.messageitemModels.getModel(
                                  getJsonField(
                                    messageItemItem,
                                    r'''$.id''',
                                  ).toString(),
                                  messageItemIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: MessageitemWidget(
                                  key: Key(
                                    'Keyp5h_${getJsonField(
                                      messageItemItem,
                                      r'''$.id''',
                                    ).toString()}',
                                  ),
                                  messageText: getJsonField(
                                    messageItemItem,
                                    r'''$.text''',
                                  ).toString(),
                                  messageTime:
                                      functions.formatDateString(getJsonField(
                                    messageItemItem,
                                    r'''$.createdAt''',
                                  ).toString()),
                                  isMyMessage:
                                      functions.isMyMessage(getJsonField(
                                    messageItemItem,
                                    r'''$.author.role''',
                                  ).toString())!,
                                  attachmentUrl: getJsonField(
                                    messageItemItem,
                                    r'''$.attachments[0].url''',
                                  ).toString(),
                                  attachmentFileName: getJsonField(
                                    messageItemItem,
                                    r'''$.attachments[0].fileName''',
                                  ).toString(),
                                  authorName: getJsonField(
                                    messageItemItem,
                                    r'''$.author.login''',
                                  ).toString(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadFILE =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading_uploadFILE =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadFILE =
                                                  selectedUploadedFiles.first;
                                            });
                                            showUploadMessage(
                                              context,
                                              'Success!',
                                            );
                                          } else {
                                            safeSetState(() {});
                                            showUploadMessage(
                                              context,
                                              'Failed to upload file',
                                            );
                                            return;
                                          }
                                        }

                                        _model.apiResultDeclareFile =
                                            await ConversationsGroup
                                                .declareAttachmentCall
                                                .call(
                                          accountId: widget.accountId,
                                          authToken: FFAppState().authToken,
                                          fileName: functions.getFileName(_model
                                              .uploadedLocalFile_uploadFILE),
                                          fileSize: functions.getFileSize(_model
                                              .uploadedLocalFile_uploadFILE),
                                        );

                                        await actions.uploadFileToUrl(
                                          getJsonField(
                                            (_model.apiResultDeclareFile
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.uploadUrl''',
                                          ).toString(),
                                          FFAppState().authToken,
                                          _model.uploadedLocalFile_uploadFILE,
                                        );
                                        _model.declareFile = getJsonField(
                                          (_model.apiResultDeclareFile
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.id''',
                                        ).toString();
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Stack(
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (_model.declareFile !=
                                                        null &&
                                                    _model.declareFile != '') {
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.check_outlined,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                  );
                                                } else {
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: 'TextField',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.send_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              if (_model.declareFile != null &&
                                  _model.declareFile != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getFileName(_model
                                              .uploadedLocalFile_uploadFILE),
                                          'file',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 9.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
