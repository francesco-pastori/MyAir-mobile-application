import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'container_delete_icon_model.dart';
export 'container_delete_icon_model.dart';

class ContainerDeleteIconWidget extends StatefulWidget {
  const ContainerDeleteIconWidget({super.key});

  @override
  State<ContainerDeleteIconWidget> createState() =>
      _ContainerDeleteIconWidgetState();
}

class _ContainerDeleteIconWidgetState extends State<ContainerDeleteIconWidget> {
  late ContainerDeleteIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerDeleteIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        onEnter: ((event) async {
          setState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          setState(() => _model.mouseRegionHovered = false);
        }),
        child: Visibility(
          visible: valueOrDefault<bool>(
            _model.mouseRegionHovered,
            false,
          ),
          child: Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Icon(
                Icons.cancel,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
