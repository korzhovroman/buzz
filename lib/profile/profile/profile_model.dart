import '/allegro/allegro_accounts_list/allegro_accounts_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/playments/subscription_card/subscription_card_widget.dart';
import '/profile/danedorozliczen/danedorozliczen_widget.dart';
import '/teams/team_member_list/team_member_list_widget.dart';
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
  // Model for appbarDriwer component.
  late AppbarDriwerModel appbarDriwerModel;
  // Model for SubscriptionCard component.
  late SubscriptionCardModel subscriptionCardModel2;
  // Model for Danedorozliczen component.
  late DanedorozliczenModel danedorozliczenModel2;
  // Model for AllegroAccountsList component.
  late AllegroAccountsListModel allegroAccountsListModel2;
  // Model for TeamMemberList component.
  late TeamMemberListModel teamMemberListModel2;
  // Model for driwer component.
  late DriwerModel driwerModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    subscriptionCardModel1 =
        createModel(context, () => SubscriptionCardModel());
    danedorozliczenModel1 = createModel(context, () => DanedorozliczenModel());
    allegroAccountsListModel1 =
        createModel(context, () => AllegroAccountsListModel());
    teamMemberListModel1 = createModel(context, () => TeamMemberListModel());
    appbarDriwerModel = createModel(context, () => AppbarDriwerModel());
    subscriptionCardModel2 =
        createModel(context, () => SubscriptionCardModel());
    danedorozliczenModel2 = createModel(context, () => DanedorozliczenModel());
    allegroAccountsListModel2 =
        createModel(context, () => AllegroAccountsListModel());
    teamMemberListModel2 = createModel(context, () => TeamMemberListModel());
    driwerModel = createModel(context, () => DriwerModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    subscriptionCardModel1.dispose();
    danedorozliczenModel1.dispose();
    allegroAccountsListModel1.dispose();
    teamMemberListModel1.dispose();
    appbarDriwerModel.dispose();
    subscriptionCardModel2.dispose();
    danedorozliczenModel2.dispose();
    allegroAccountsListModel2.dispose();
    teamMemberListModel2.dispose();
    driwerModel.dispose();
  }
}
