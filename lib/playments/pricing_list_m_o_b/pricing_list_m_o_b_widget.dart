import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/playments/pricing_plan_card/pricing_plan_card_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pricing_list_m_o_b_model.dart';
export 'pricing_list_m_o_b_model.dart';

class PricingListMOBWidget extends StatefulWidget {
  const PricingListMOBWidget({super.key});

  @override
  State<PricingListMOBWidget> createState() => _PricingListMOBWidgetState();
}

class _PricingListMOBWidgetState extends State<PricingListMOBWidget> {
  late PricingListMOBModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingListMOBModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 60.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Text(
                      'Plany subskrypcji',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.robotoSerif(
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
                  Builder(
                    builder: (context) {
                      final packageItem = revenue_cat
                          .offerings!.current!.availablePackages
                          .toList();

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(packageItem.length,
                              (packageItemIndex) {
                            final packageItemItem =
                                packageItem[packageItemIndex];
                            return wrapWithModel(
                              model: _model.pricingPlanCardModels.getModel(
                                packageItemItem.storeProduct.identifier,
                                packageItemIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: PricingPlanCardWidget(
                                key: Key(
                                  'Keyf4f_${packageItemItem.storeProduct.identifier}',
                                ),
                                planTitle: packageItemItem.storeProduct.title,
                                priceText: packageItemItem.storeProduct.price
                                    .toString(),
                                planId: packageItemItem.identifier,
                                planDescription:
                                    packageItemItem.storeProduct.description,
                                onBuyPressed: () async {
                                  if (isWeb) {
                                    _model.checkoutResponse = await PaimentGroup
                                        .createCheckoutSessionCall
                                        .call(
                                      authToken: FFAppState().authToken,
                                      planId: packageItemItem.identifier,
                                    );

                                    if ((_model.checkoutResponse?.succeeded ??
                                        true)) {
                                      await launchURL(getJsonField(
                                        (_model.checkoutResponse?.jsonBody ??
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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

                                    context.pushNamed(HomePageWidget.routeName);
                                  } else {
                                    _model.purchaseResult =
                                        await revenue_cat.purchasePackage(
                                            packageItemItem.identifier);
                                    if (_model.purchaseResult!) {
                                      context
                                          .pushNamed(HomePageWidget.routeName);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Coś poszło nie tak',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
