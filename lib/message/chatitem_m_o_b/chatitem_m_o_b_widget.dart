import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/message/chatstiem/chatstiem_widget.dart';
import 'package:flutter/material.dart';
import 'chatitem_m_o_b_model.dart';
export 'chatitem_m_o_b_model.dart';

///
///
class ChatitemMOBWidget extends StatefulWidget {
  const ChatitemMOBWidget({
    super.key,
    required this.threadId,
    required this.accountId,
    required this.avatar,
    required this.name,
    required this.date,
    required this.lastMessage,
    required this.isRead,
  });

  final String? threadId;
  final int? accountId;
  final String? avatar;
  final String? name;
  final String? date;
  final String? lastMessage;
  final bool? isRead;

  static String routeName = 'chatitemMOB';
  static String routePath = '/chatitemMOB';

  @override
  State<ChatitemMOBWidget> createState() => _ChatitemMOBWidgetState();
}

class _ChatitemMOBWidgetState extends State<ChatitemMOBWidget> {
  late ChatitemMOBModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatitemMOBModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            child: wrapWithModel(
              model: _model.chatstiemModel,
              updateCallback: () => safeSetState(() {}),
              child: ChatstiemWidget(
                login: widget.name!,
                date: widget.date!,
                lastMessage: widget.lastMessage!,
                isRead: widget.isRead!,
                avatar: widget.avatar!,
                threadId: widget.threadId!,
                accountId: widget.accountId!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
