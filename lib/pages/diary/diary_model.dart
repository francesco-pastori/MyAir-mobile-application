import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diary_widget.dart' show DiaryWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DiaryModel extends FlutterFlowModel<DiaryWidget> {
  ///  Local state fields for this page.

  String? city;

  DateTime? date;

  String? aqi;

  bool visibility = false;

  String? pm25;

  String? pm10;

  String? co;

  String? o3;

  String? so2;

  String? no2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for searchCityField widget.
  final searchCityFieldKey1 = GlobalKey();
  FocusNode? searchCityFieldFocusNode1;
  TextEditingController? searchCityFieldController1;
  String? searchCityFieldSelectedOption1;
  String? Function(BuildContext, String?)? searchCityFieldController1Validator;
  // Stores action output result for [Backend Call - API (placeAutocomplete)] action in searchCityField widget.
  ApiCallResponse? apiResulttsMonth;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for searchCityField widget.
  final searchCityFieldKey2 = GlobalKey();
  FocusNode? searchCityFieldFocusNode2;
  TextEditingController? searchCityFieldController2;
  String? searchCityFieldSelectedOption2;
  String? Function(BuildContext, String?)? searchCityFieldController2Validator;
  // Stores action output result for [Backend Call - API (placeAutocomplete)] action in searchCityField widget.
  ApiCallResponse? apiResulttsWeek;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    expandableController1.dispose();
    searchCityFieldFocusNode1?.dispose();

    expandableController2.dispose();
    searchCityFieldFocusNode2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
