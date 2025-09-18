import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/playments/pricing_plan_card/pricing_plan_card_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pricing_list_w_e_b_model.dart';
export 'pricing_list_w_e_b_model.dart';

class PricingListWEBWidget extends StatefulWidget {
  const PricingListWEBWidget({super.key});

  @override
  State<PricingListWEBWidget> createState() => _PricingListWEBWidgetState();
}

class _PricingListWEBWidgetState extends State<PricingListWEBWidget> {
  late PricingListWEBModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingListWEBModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await revenue_cat.restorePurchases();
    });

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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 60.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 300.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 330.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 350.0;
                    } else {
                      return 450.0;
                    }
                  }(),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 24.0, 14.0, 24.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  FFIcons.kclose,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              'Plany subskrypcji',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.pricingPlanCardModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PricingPlanCardWidget(
                                      planTitle: 'PRO plan miesięczny',
                                      priceText: '29.99 ',
                                      planId: 'pro_plan_monthly',
                                      planDescription:
                                          'Możliwość podłączenia do 3 kont. Automatyczne odpowiedzi na nowe wiadomości na każdym z kont.  ',
                                      onBuyPressed: () async {
                                        _model.apiResultPAY = await PaimentGroup
                                            .createCheckoutSessionCall
                                            .call(
                                          authToken: FFAppState().authToken,
                                          planId: 'pro_plan_monthly',
                                          userId: currentUserUid,
                                        );

                                        if ((_model.apiResultPAY?.succeeded ??
                                            true)) {
                                          await launchURL(getJsonField(
                                            (_model.apiResultPAY?.jsonBody ??
                                                ''),
                                            r'''$.data.checkoutUrl''',
                                          ).toString());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Coś poszło nie tak',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.pricingPlanCardModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PricingPlanCardWidget(
                                      planTitle: 'PRO plan roczny',
                                      priceText: '299.99 ',
                                      planId: 'pro_plan_yearly',
                                      planDescription:
                                          'Możliwość podłączenia do 3 kont. Automatyczne odpowiedzi na nowe wiadomości na każdym z kont.',
                                      onBuyPressed: () async {
                                        _model.apiResultPay = await PaimentGroup
                                            .createCheckoutSessionCall
                                            .call(
                                          authToken: FFAppState().authToken,
                                          planId: 'pro_plan_yearly',
                                          userId: currentUserUid,
                                        );

                                        if ((_model.apiResultPay?.succeeded ??
                                            true)) {
                                          await launchURL(getJsonField(
                                            (_model.apiResultPay?.jsonBody ??
                                                ''),
                                            r'''$.data.checkoutUrl''',
                                          ).toString());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Coś poszło nie tak',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.pricingPlanCardModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PricingPlanCardWidget(
                                      planTitle: 'MAXI plan miesięczny',
                                      priceText: '99.99 ',
                                      planId: 'maxi_plan_monthly',
                                      planDescription:
                                          'Możliwość podłączenia do 10 kont i do 10 pracowników. Automatyczne odpowiedzi na nowe wiadomości na każdym z kont.',
                                      onBuyPressed: () async {
                                        _model.apiResultPayMaxi =
                                            await PaimentGroup
                                                .createCheckoutSessionCall
                                                .call(
                                          authToken: FFAppState().authToken,
                                          userId: currentUserUid,
                                          planId: 'maxi_plan_monthly',
                                        );

                                        if ((_model
                                                .apiResultPayMaxi?.succeeded ??
                                            true)) {
                                          await launchURL(getJsonField(
                                            (_model.apiResultPayMaxi
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.checkoutUrl''',
                                          ).toString());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Coś poszło nie tak',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.pricingPlanCardModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PricingPlanCardWidget(
                                      planTitle: 'MAXI plan roczny',
                                      priceText: '999.99 ',
                                      planId: 'maxi_plan_yearly',
                                      planDescription:
                                          'Możliwość podłączenia do 10 kont i do 10 pracowników. Automatyczne odpowiedzi na nowe wiadomości na każdym z kont.',
                                      onBuyPressed: () async {
                                        _model.apiResultMaxiYaer =
                                            await PaimentGroup
                                                .createCheckoutSessionCall
                                                .call(
                                          planId: 'maxi_plan_yearly',
                                          userId: currentUserUid,
                                          authToken: FFAppState().authToken,
                                        );

                                        if ((_model
                                                .apiResultMaxiYaer?.succeeded ??
                                            true)) {
                                          await launchURL(getJsonField(
                                            (_model.apiResultMaxiYaer
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.checkoutUrl''',
                                          ).toString());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Coś poszło nie tak',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
