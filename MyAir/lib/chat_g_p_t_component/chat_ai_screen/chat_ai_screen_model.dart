import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_ai_screen_widget.dart' show ChatAiScreenWidget;
import 'package:flutter/material.dart';

class ChatAiScreenModel extends FlutterFlowModel<ChatAiScreenWidget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool aiResponding = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    aiChatComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
