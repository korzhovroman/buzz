import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'payment_cancelled_model.dart';
export 'payment_cancelled_model.dart';

class PaymentCancelledWidget extends StatefulWidget {
  const PaymentCancelledWidget({super.key});

  static String routeName = 'payment-cancelled';
  static String routePath = '/payment-cancelled';

  @override
  State<PaymentCancelledWidget> createState() => _PaymentCancelledWidgetState();
}

class _PaymentCancelledWidgetState extends State<PaymentCancelledWidget> {
  late PaymentCancelledModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentCancelledModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondary,
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(1.0, -0.87),
              end: AlignmentDirectional(-1.0, 0.87),
            ),
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
        ),
      ),
    );
  }
}
