import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/playments/pricing_plan_card/pricing_plan_card_widget.dart';
import 'pricing_list_m_o_b_widget.dart' show PricingListMOBWidget;
import 'package:flutter/material.dart';

class PricingListMOBModel extends FlutterFlowModel<PricingListMOBWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for PricingPlanCard dynamic component.
  late FlutterFlowDynamicModels<PricingPlanCardModel> pricingPlanCardModels;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in PricingPlanCard widget.
  ApiCallResponse? checkoutResponse;
  // Stores action output result for [RevenueCat - Purchase] action in PricingPlanCard widget.
  bool? purchaseResult;

  @override
  void initState(BuildContext context) {
    pricingPlanCardModels =
        FlutterFlowDynamicModels(() => PricingPlanCardModel());
  }

  @override
  void dispose() {
    pricingPlanCardModels.dispose();
  }
}
