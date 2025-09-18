import '/allegro/allegro_accounts_list/allegro_accounts_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/playments/subscription_card/subscription_card_widget.dart';
import '/profile/danedorozliczen/danedorozliczen_widget.dart';
import '/teams/team_member_list/team_member_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    String? namepage,
  }) : this.namepage = namepage ?? 'konto';

  final String namepage;

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            color: FlutterFlowTheme.of(context).primaryBackground,
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
                              page: 'Profile',
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 40.0, 20.0, 20.0),
                                      child: Wrap(
                                        spacing: 24.0,
                                        runSpacing: 20.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          if (FFAppState().isOwner == true)
                                            wrapWithModel(
                                              model:
                                                  _model.subscriptionCardModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: SubscriptionCardWidget(
                                                subscriptionStatus: FFAppState()
                                                    .subscriptionStatus,
                                                endsAt: FFAppState()
                                                    .subscriptionEndsAt,
                                                usedAccounts:
                                                    FFAppState().usedAccounts,
                                                limit:
                                                    FFAppState().accountLimit,
                                                isOwner: FFAppState().isOwner,
                                              ),
                                            ),
                                          if (FFAppState().isOwner == true)
                                            wrapWithModel(
                                              model:
                                                  _model.danedorozliczenModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DanedorozliczenWidget(
                                                name: FFAppState().name,
                                                nazwafirmy:
                                                    FFAppState().namefirmy,
                                                adresfirmy:
                                                    FFAppState().adresfirmy,
                                                nip: FFAppState().nip,
                                                telefon: FFAppState().telefon,
                                                isowen: FFAppState().isOwner,
                                              ),
                                            ),
                                          if ((FFAppState().isOwner == true) &&
                                              (FFAppState()
                                                      .issubscriptionactive ==
                                                  true))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .allegroAccountsListModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    AllegroAccountsListWidget(
                                                  isOwner: FFAppState().isOwner,
                                                  accountListJson: FFAppState()
                                                      .allegroAccounts,
                                                  onListUpdated: () async {},
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().isOwner == true) &&
                                              (FFAppState()
                                                      .subscriptionStatus !=
                                                  'Pro'))
                                            wrapWithModel(
                                              model:
                                                  _model.teamMemberListModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TeamMemberListWidget(
                                                memberData:
                                                    FFAppState().teamMembers,
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
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          wrapWithModel(
                            model: _model.appbarDriwerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AppbarDriwerWidget(),
                          ),
                          Expanded(
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 4.0, 15.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 34.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (FFAppState().isOwner == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .subscriptionCardModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        SubscriptionCardWidget(
                                                      subscriptionStatus:
                                                          FFAppState()
                                                              .subscriptionStatus,
                                                      endsAt: FFAppState()
                                                          .subscriptionEndsAt,
                                                      usedAccounts: FFAppState()
                                                          .usedAccounts,
                                                      limit: FFAppState()
                                                          .accountLimit,
                                                      isOwner:
                                                          FFAppState().isOwner,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState().isOwner == true)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .danedorozliczenModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        DanedorozliczenWidget(
                                                      name: FFAppState().name,
                                                      nazwafirmy: FFAppState()
                                                          .namefirmy,
                                                      adresfirmy: FFAppState()
                                                          .adresfirmy,
                                                      nip: FFAppState().nip,
                                                      telefon:
                                                          FFAppState().telefon,
                                                      isowen:
                                                          FFAppState().isOwner,
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().isOwner ==
                                                      true) &&
                                                  (FFAppState()
                                                          .issubscriptionactive ==
                                                      true))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .allegroAccountsListModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child:
                                                        AllegroAccountsListWidget(
                                                      isOwner:
                                                          FFAppState().isOwner,
                                                      accountListJson:
                                                          FFAppState()
                                                              .allegroAccounts,
                                                      onListUpdated:
                                                          () async {},
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().isOwner ==
                                                      true) &&
                                                  (FFAppState()
                                                          .subscriptionStatus !=
                                                      'Pro'))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .teamMemberListModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    updateOnChange: true,
                                                    child: TeamMemberListWidget(
                                                      memberData: FFAppState()
                                                          .teamMembers,
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
