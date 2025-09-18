import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        await Future.delayed(
          Duration(
            milliseconds: 200,
          ),
        );
        _model.apiResultTOKEN = await UserSyncCallCall.call(
          authToken: currentJwtToken,
        );

        FFAppState().authToken = getJsonField(
          (_model.apiResultTOKEN?.jsonBody ?? ''),
          r'''$.data.access_token''',
        ).toString();
        safeSetState(() {});
        await Future.wait([
          Future(() async {
            _model.apiResultSUB =
                await AllegroConnectAPIGroup.getSubscriptionCall.call(
              token: FFAppState().authToken,
            );

            if ((_model.apiResultSUB?.succeeded ?? true)) {
              FFAppState().subscriptionEndsAt =
                  functions.formatDateString(getJsonField(
                (_model.apiResultSUB?.jsonBody ?? ''),
                r'''$.data.ends_at''',
              ).toString());
              FFAppState().subscriptionStatus = getJsonField(
                (_model.apiResultSUB?.jsonBody ?? ''),
                r'''$.data.status''',
              ).toString();
              FFAppState().usedAccounts = getJsonField(
                (_model.apiResultSUB?.jsonBody ?? ''),
                r'''$.data.used_accounts''',
              );
              FFAppState().accountLimit = getJsonField(
                (_model.apiResultSUB?.jsonBody ?? ''),
                r'''$.data.limit''',
              );
              FFAppState().update(() {});
            }
          }),
          Future(() async {
            _model.apiResulAccountsAllegro =
                await AllegroConnectAPIGroup.getAllegroAccountsCall.call(
              token: FFAppState().authToken,
            );

            if ((_model.apiResulAccountsAllegro?.succeeded ?? true)) {
              if (getJsonField(
                    (_model.apiResulAccountsAllegro?.jsonBody ?? ''),
                    r'''$.data''',
                  ) !=
                  null) {
                FFAppState().allegroAccounts = getJsonField(
                  (_model.apiResulAccountsAllegro?.jsonBody ?? ''),
                  r'''$.data''',
                );
              } else {
                FFAppState().allegroAccounts = [];
                safeSetState(() {});
              }
            } else {
              FFAppState().allegroAccounts = [];
              safeSetState(() {});
            }
          }),
          Future(() async {
            _model.apiResultTeam =
                await TeamConnectApiGroup.getTeamMembersCall.call(
              token: FFAppState().authToken,
            );

            if ((_model.apiResultTeam?.succeeded ?? true)) {
              FFAppState().teamMembers = functions
                  .filterOwnerFromList(functions
                      .filterOwnerFromList(getJsonField(
                        (_model.apiResultTeam?.jsonBody ?? ''),
                        r'''$.data''',
                        true,
                      )!)
                      .toList())
                  .toList()
                  .cast<dynamic>();
            } else {
              FFAppState().teamMembers = [].toList().cast<dynamic>();
              safeSetState(() {});
            }
          }),
        ]);
      }
      _model.apiResultOwner = await AllegroConnectAPIGroup.getOwnerCall.call(
        token: FFAppState().authToken,
      );

      if ((_model.apiResultOwner?.succeeded ?? true)) {
        FFAppState().isOwner = getJsonField(
              (_model.apiResultOwner?.jsonBody ?? ''),
              r'''$.data.owned_team''',
            ) !=
            null;
        FFAppState().issubscriptionactive = getJsonField(
          (_model.apiResultOwner?.jsonBody ?? ''),
          r'''$.data.is_subscription_active''',
        );
        FFAppState().name = valueOrDefault<String>(
          getJsonField(
            (_model.apiResultOwner?.jsonBody ?? ''),
            r'''$.data.name''',
          )?.toString(),
          'Imię i nazwisko',
        );
        FFAppState().namefirmy = valueOrDefault<String>(
          getJsonField(
            (_model.apiResultOwner?.jsonBody ?? ''),
            r'''$.data.company_name''',
          )?.toString(),
          'Nazwa firmy',
        );
        FFAppState().nip = valueOrDefault<String>(
          getJsonField(
            (_model.apiResultOwner?.jsonBody ?? ''),
            r'''$.data.nip''',
          )?.toString(),
          'NIP',
        );
        FFAppState().adresfirmy = valueOrDefault<String>(
          getJsonField(
            (_model.apiResultOwner?.jsonBody ?? ''),
            r'''$.data.address''',
          )?.toString(),
          'Adres firmy',
        );
        FFAppState().telefon = valueOrDefault<String>(
          getJsonField(
            (_model.apiResultOwner?.jsonBody ?? ''),
            r'''$.data.phone_number''',
          )?.toString(),
          'Telefon',
        );
      }
      if (FFAppState().issubscriptionactive == false) {
        context.goNamed(IsSubscriptionNotactivWidget.routeName);

        return;
      }

      context.pushNamed(DashbordWidget.routeName);
    });

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
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
          ),
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                  'assets/images/Bees_&_Bombs.gif',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
