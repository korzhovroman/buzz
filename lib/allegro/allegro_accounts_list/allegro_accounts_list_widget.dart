import '/allegro/allegro_account_item/allegro_account_item_widget.dart';
import '/allegro/button_connect_allegro_copy/button_connect_allegro_copy_widget.dart';
import '/allegro/listempty/listempty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allegro_accounts_list_model.dart';
export 'allegro_accounts_list_model.dart';

class AllegroAccountsListWidget extends StatefulWidget {
  const AllegroAccountsListWidget({
    super.key,
    this.accountListJson,
    required this.isOwner,
    required this.onListUpdated,
  });

  final List<dynamic>? accountListJson;
  final bool? isOwner;
  final Future Function()? onListUpdated;

  @override
  State<AllegroAccountsListWidget> createState() =>
      _AllegroAccountsListWidgetState();
}

class _AllegroAccountsListWidgetState extends State<AllegroAccountsListWidget> {
  late AllegroAccountsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllegroAccountsListModel());

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

    return Visibility(
      visible: widget.isOwner == true,
      child: Container(
        width: 330.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Moje konta',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Builder(
                      builder: (context) {
                        final accountItem =
                            FFAppState().allegroAccounts.toList();
                        if (accountItem.isEmpty) {
                          return ListemptyWidget();
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: accountItem.length,
                          itemBuilder: (context, accountItemIndex) {
                            final accountItemItem =
                                accountItem[accountItemIndex];
                            return wrapWithModel(
                              model: _model.allegroAccountItemModels.getModel(
                                getJsonField(
                                  accountItemItem,
                                  r'''$.id''',
                                ).toString(),
                                accountItemIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: AllegroAccountItemWidget(
                                key: Key(
                                  'Keyjr9_${getJsonField(
                                    accountItemItem,
                                    r'''$.id''',
                                  ).toString()}',
                                ),
                                accountJson: accountItemItem,
                                deleteAction: () async {
                                  await widget.onListUpdated?.call();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  if ((FFAppState().accountLimit > FFAppState().usedAccounts) &&
                      (widget.accountListJson!.length > 0))
                    wrapWithModel(
                      model: _model.buttonConnectAllegroCopyModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonConnectAllegroCopyWidget(),
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
