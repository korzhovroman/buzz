import '/allegro/allegro_accounts_list/allegro_accounts_list_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/nawbar_mob/nawbar_mob_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/playments/subscription_card/subscription_card_widget.dart';
import '/profile/danedorozliczen/danedorozliczen_widget.dart';
import '/teams/team_member_list/team_member_list_widget.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Model for SubscriptionCard component.
  late SubscriptionCardModel subscriptionCardModel1;
  // Model for Danedorozliczen component.
  late DanedorozliczenModel danedorozliczenModel1;
  // Model for AllegroAccountsList component.
  late AllegroAccountsListModel allegroAccountsListModel1;
  // Model for TeamMemberList component.
  late TeamMemberListModel teamMemberListModel1;
  // Model for SubscriptionCard component.
  late SubscriptionCardModel subscriptionCardModel2;
  // Model for Danedorozliczen component.
  late DanedorozliczenModel danedorozliczenModel2;
  // Model for AllegroAccountsList component.
  late AllegroAccountsListModel allegroAccountsListModel2;
  // Model for TeamMemberList component.
  late TeamMemberListModel teamMemberListModel2;
  // Stores action output result for [Backend Call - API (deleteAccount)] action in Button widget.
  ApiCallResponse? apiResultDELET;
  // Model for NawbarMob component.
  late NawbarMobModel nawbarMobModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    subscriptionCardModel1 =
        createModel(context, () => SubscriptionCardModel());
    danedorozliczenModel1 = createModel(context, () => DanedorozliczenModel());
    allegroAccountsListModel1 =
        createModel(context, () => AllegroAccountsListModel());
    teamMemberListModel1 = createModel(context, () => TeamMemberListModel());
    subscriptionCardModel2 =
        createModel(context, () => SubscriptionCardModel());
    danedorozliczenModel2 = createModel(context, () => DanedorozliczenModel());
    allegroAccountsListModel2 =
        createModel(context, () => AllegroAccountsListModel());
    teamMemberListModel2 = createModel(context, () => TeamMemberListModel());
    nawbarMobModel = createModel(context, () => NawbarMobModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    subscriptionCardModel1.dispose();
    danedorozliczenModel1.dispose();
    allegroAccountsListModel1.dispose();
    teamMemberListModel1.dispose();
    subscriptionCardModel2.dispose();
    danedorozliczenModel2.dispose();
    allegroAccountsListModel2.dispose();
    teamMemberListModel2.dispose();
    nawbarMobModel.dispose();
  }
}
