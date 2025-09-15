import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/message/offer_card/offer_card_widget.dart';
import '/message/order_card/order_card_widget.dart';
import 'chatstiem_widget.dart' show ChatstiemWidget;
import 'package:flutter/material.dart';

class ChatstiemModel extends FlutterFlowModel<ChatstiemWidget> {
  ///  Local state fields for this component.

  String? declareFile;

  ///  State fields for stateful widgets in this component.

  // Model for OfferCard component.
  late OfferCardModel offerCardModel;
  // Model for OrderCard component.
  late OrderCardModel orderCardModel;
  bool isDataUploading_uploadFILE = false;
  FFUploadedFile uploadedLocalFile_uploadFILE =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (declareAttachment)] action in file widget.
  ApiCallResponse? apiResultDeclareFile;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    offerCardModel = createModel(context, () => OfferCardModel());
    orderCardModel = createModel(context, () => OrderCardModel());
  }

  @override
  void dispose() {
    offerCardModel.dispose();
    orderCardModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
