import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/appbar_driwer/appbar_driwer_widget.dart';
import '/menu/driwer/driwer_widget.dart';
import '/menu/side_nav_web/side_nav_web_widget.dart';
import '/pages/message_home/message_home_widget.dart';
import 'dashbord_widget.dart' show DashbordWidget;
import 'package:flutter/material.dart';

class DashbordModel extends FlutterFlowModel<DashbordWidget> {
  ///  Local state fields for this page.

  List<dynamic> summaryData = [];
  void addToSummaryData(dynamic item) => summaryData.add(item);
  void removeFromSummaryData(dynamic item) => summaryData.remove(item);
  void removeAtIndexFromSummaryData(int index) => summaryData.removeAt(index);
  void insertAtIndexInSummaryData(int index, dynamic item) =>
      summaryData.insert(index, item);
  void updateSummaryDataAtIndex(int index, Function(dynamic) updateFn) =>
      summaryData[index] = updateFn(summaryData[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getSummary)] action in Dashbord widget.
  ApiCallResponse? apiResultSummary;
  // Model for SideNavWeb component.
  late SideNavWebModel sideNavWebModel;
  // Models for messageHome dynamic component.
  late FlutterFlowDynamicModels<MessageHomeModel> messageHomeModels1;
  // Model for appbarDriwer component.
  late AppbarDriwerModel appbarDriwerModel;
  // Models for messageHome dynamic component.
  late FlutterFlowDynamicModels<MessageHomeModel> messageHomeModels2;
  // Model for driwer component.
  late DriwerModel driwerModel;

  @override
  void initState(BuildContext context) {
    sideNavWebModel = createModel(context, () => SideNavWebModel());
    messageHomeModels1 = FlutterFlowDynamicModels(() => MessageHomeModel());
    appbarDriwerModel = createModel(context, () => AppbarDriwerModel());
    messageHomeModels2 = FlutterFlowDynamicModels(() => MessageHomeModel());
    driwerModel = createModel(context, () => DriwerModel());
  }

  @override
  void dispose() {
    sideNavWebModel.dispose();
    messageHomeModels1.dispose();
    appbarDriwerModel.dispose();
    messageHomeModels2.dispose();
    driwerModel.dispose();
  }
}
