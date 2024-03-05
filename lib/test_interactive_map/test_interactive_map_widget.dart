import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'test_interactive_map_model.dart';
export 'test_interactive_map_model.dart';

class TestInteractiveMapWidget extends StatefulWidget {
  const TestInteractiveMapWidget({super.key});

  @override
  State<TestInteractiveMapWidget> createState() =>
      _TestInteractiveMapWidgetState();
}

class _TestInteractiveMapWidgetState extends State<TestInteractiveMapWidget> {
  late TestInteractiveMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestInteractiveMapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowWebView(
                content:
                    'https://api.mapbox.com/styles/v1/ismaelevilla/cltdfck4a002n01nrge994dfd.html?title=view&access_token=pk.eyJ1IjoiaXNtYWVsZXZpbGxhIiwiYSI6ImNsdGFiMWZ2MTE5MmYybW8xc3hpZG1uMjMifQ.bZnOW7ae8-NuDIDYJuxeTQ&zoomwheel=true&fresh=true#3.1/47.75/17.5/14.7/29',
                bypass: false,
                height: 500.0,
                verticalScroll: false,
                horizontalScroll: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
