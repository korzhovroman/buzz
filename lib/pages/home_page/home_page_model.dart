import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? tempToken;

  List<dynamic> accountSummaries = [];
  void addToAccountSummaries(dynamic item) => accountSummaries.add(item);
  void removeFromAccountSummaries(dynamic item) =>
      accountSummaries.remove(item);
  void removeAtIndexFromAccountSummaries(int index) =>
      accountSummaries.removeAt(index);
  void insertAtIndexInAccountSummaries(int index, dynamic item) =>
      accountSummaries.insert(index, item);
  void updateAccountSummariesAtIndex(int index, Function(dynamic) updateFn) =>
      accountSummaries[index] = updateFn(accountSummaries[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (UserSyncCall)] action in HomePage widget.
  ApiCallResponse? apiResultTOKEN;
  // Stores action output result for [Backend Call - API (getSubscription)] action in HomePage widget.
  ApiCallResponse? apiResultSUB;
  // Stores action output result for [Backend Call - API (getAllegroAccounts)] action in HomePage widget.
  ApiCallResponse? apiResulAccountsAllegro;
  // Stores action output result for [Backend Call - API (getTeamMembers)] action in HomePage widget.
  ApiCallResponse? apiResultTeam;
  // Stores action output result for [Backend Call - API (getOwner)] action in HomePage widget.
  ApiCallResponse? apiResultOwner;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
