import '/flutter_flow/flutter_flow_util.dart';
import '/message/chatstiem/chatstiem_widget.dart';
import 'chatitem_m_o_b_widget.dart' show ChatitemMOBWidget;
import 'package:flutter/material.dart';

class ChatitemMOBModel extends FlutterFlowModel<ChatitemMOBWidget> {
  ///  Local state fields for this page.

  String? uploadedAttachmentId;

  ///  State fields for stateful widgets in this page.

  // Model for chatstiem component.
  late ChatstiemModel chatstiemModel;

  @override
  void initState(BuildContext context) {
    chatstiemModel = createModel(context, () => ChatstiemModel());
  }

  @override
  void dispose() {
    chatstiemModel.dispose();
  }
}
