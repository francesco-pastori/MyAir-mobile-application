import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'more_details_widget.dart' show MoreDetailsWidget;
import 'package:flutter/material.dart';

class MoreDetailsModel extends FlutterFlowModel<MoreDetailsWidget> {
  ///  Local state fields for this page.

  int daysCounter = 7;

  String? city;

  DateTime? date;

  String? aqi = '';

  bool visibility = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for searchCityField widget.
  final searchCityFieldKey = GlobalKey();
  FocusNode? searchCityFieldFocusNode;
  TextEditingController? searchCityFieldController;
  String? searchCityFieldSelectedOption;
  String? Function(BuildContext, String?)? searchCityFieldControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchCityFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
