import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/playments/pricing_plan_card/pricing_plan_card_widget.dart';
import 'pricing_list_w_e_b_widget.dart' show PricingListWEBWidget;
import 'package:flutter/material.dart';

class PricingListWEBModel extends FlutterFlowModel<PricingListWEBWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PricingPlanCard component.
  late PricingPlanCardModel pricingPlanCardModel1;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in PricingPlanCard widget.
  ApiCallResponse? apiResultPAY;
  // Model for PricingPlanCard component.
  late PricingPlanCardModel pricingPlanCardModel2;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in PricingPlanCard widget.
  ApiCallResponse? apiResultPay;
  // Model for PricingPlanCard component.
  late PricingPlanCardModel pricingPlanCardModel3;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in PricingPlanCard widget.
  ApiCallResponse? apiResultPayMaxi;
  // Model for PricingPlanCard component.
  late PricingPlanCardModel pricingPlanCardModel4;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in PricingPlanCard widget.
  ApiCallResponse? apiResultMaxiYaer;

  @override
  void initState(BuildContext context) {
    pricingPlanCardModel1 = createModel(context, () => PricingPlanCardModel());
    pricingPlanCardModel2 = createModel(context, () => PricingPlanCardModel());
    pricingPlanCardModel3 = createModel(context, () => PricingPlanCardModel());
    pricingPlanCardModel4 = createModel(context, () => PricingPlanCardModel());
  }

  @override
  void dispose() {
    pricingPlanCardModel1.dispose();
    pricingPlanCardModel2.dispose();
    pricingPlanCardModel3.dispose();
    pricingPlanCardModel4.dispose();
  }
}
