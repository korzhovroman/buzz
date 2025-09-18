import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import 'package:flutter/material.dart';
import 'dyskusje_model.dart';
export 'dyskusje_model.dart';

class DyskusjeWidget extends StatefulWidget {
  const DyskusjeWidget({
    super.key,
    String? namepage,
  }) : this.namepage = namepage ?? 'dyskusje';

  final String namepage;

  static String routeName = 'Dyskusje';
  static String routePath = '/dyskusje';

  @override
  State<DyskusjeWidget> createState() => _DyskusjeWidgetState();
}

class _DyskusjeWidgetState extends State<DyskusjeWidget> {
  late DyskusjeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DyskusjeModel());

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
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.driwerModel,
            updateCallback: () => safeSetState(() {}),
            child: DriwerWidget(
              namepage: widget.namepage,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (MediaQuery.sizeOf(context).width >= 900.0) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          wrapWithModel(
                            model: _model.sideNavWebModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SideNavWebWidget(
                              page: 'Dyskusje',
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          wrapWithModel(
                            model: _model.appbarDriwerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AppbarDriwerWidget(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
