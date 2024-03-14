import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/container_delete_icon_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

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

    _model.expandableController = ExpandableController(initialExpanded: false);
    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Visibility(
          visible: FFAppState().floatingChatIcon,
          child: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'chat_ai_Screen',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 500),
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).indigoDye,
            elevation: 8.0,
            child: Icon(
              Icons.wechat_sharp,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.05),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).indigoDye,
            automaticallyImplyLeading: false,
            title: Text(
              'Health Care Dashboard',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('chat_ai_Screen');
                  },
                  child: Icon(
                    Icons.wechat_sharp,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 24.0,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ExpandableNotifier(
                        controller: _model.expandableController,
                        child: ExpandablePanel(
                          header: Text(
                            'Average Air Quality',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          collapsed: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: StreamBuilder<List<UserAQIRecord>>(
                                stream: queryUserAQIRecord(
                                  queryBuilder: (userAQIRecord) =>
                                      userAQIRecord.where(
                                    'uid',
                                    isEqualTo: currentUserReference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .indigoDye,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UserAQIRecord>
                                      containerUserAQIRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                () {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.aQIaverage,
                                                          0) <=
                                                      50) {
                                                    return 'GOOD';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          50) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          100)) {
                                                    return 'MODERATE';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          100) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          150)) {
                                                    return 'UNHEALTHY for SENSITIVE GROUPS';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          150) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          200)) {
                                                    return 'UNHEALTHY';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          200) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          300)) {
                                                    return 'VERY UNHEALTHY';
                                                  } else {
                                                    return 'HAZARDOUS';
                                                  }
                                                }(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: () {
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.aQIaverage,
                                                                    0) <=
                                                                50) {
                                                              return const Color(
                                                                  0xFF4FDD4D);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    50) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    100)) {
                                                              return const Color(
                                                                  0xFFDDD820);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    100) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    150)) {
                                                              return const Color(
                                                                  0xFFCD7630);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    150) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    200)) {
                                                              return const Color(
                                                                  0xFFC42222);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    200) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    300)) {
                                                              return const Color(
                                                                  0xFFA21BBB);
                                                            } else {
                                                              return const Color(
                                                                  0xFF800000);
                                                            }
                                                          }(),
                                                          fontSize: 40.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl: () {
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.aQIaverage,
                                                            0) <=
                                                        50) {
                                                      return FFAppConstants
                                                          .good;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            50) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            100)) {
                                                      return FFAppConstants
                                                          .moderate;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            100) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            150)) {
                                                      return FFAppConstants
                                                          .unhealtyforsg;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            150) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            200)) {
                                                      return FFAppConstants
                                                          .unhealthy;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            200) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            300)) {
                                                      return FFAppConstants
                                                          .veryunhealthy;
                                                    } else {
                                                      return FFAppConstants
                                                          .hazard;
                                                    }
                                                  }(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.aQIaverage,
                                                        0)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: () {
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.aQIaverage,
                                                                    0) <=
                                                                50) {
                                                              return const Color(
                                                                  0xFF4FDD4D);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    50) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    100)) {
                                                              return const Color(
                                                                  0xFFDDD820);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    100) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    150)) {
                                                              return const Color(
                                                                  0xFFCD7630);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    150) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    200)) {
                                                              return const Color(
                                                                  0xFFC42222);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    200) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    300)) {
                                                              return const Color(
                                                                  0xFFA21BBB);
                                                            } else {
                                                              return const Color(
                                                                  0xFF800000);
                                                            }
                                                          }(),
                                                          fontSize: 30.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          expanded: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: StreamBuilder<List<UserAQIRecord>>(
                                stream: queryUserAQIRecord(
                                  queryBuilder: (userAQIRecord) =>
                                      userAQIRecord.where(
                                    'uid',
                                    isEqualTo: currentUserReference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .indigoDye,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UserAQIRecord>
                                      containerUserAQIRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                () {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.aQIaverage,
                                                          0) <=
                                                      50) {
                                                    return 'GOOD';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          50) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          100)) {
                                                    return 'MODERATE';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          100) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          150)) {
                                                    return 'UNHEALTHY for SENSITIVE GROUPS';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          150) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          200)) {
                                                    return 'UNHEALTHY';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) >
                                                          200) &&
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.aQIaverage,
                                                              0) <=
                                                          300)) {
                                                    return 'VERY UNHEALTHY';
                                                  } else {
                                                    return 'HAZARDOUS';
                                                  }
                                                }(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLarge
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: () {
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.aQIaverage,
                                                                    0) <=
                                                                50) {
                                                              return const Color(
                                                                  0xFF4FDD4D);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    50) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    100)) {
                                                              return const Color(
                                                                  0xFFDDD820);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    100) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    150)) {
                                                              return const Color(
                                                                  0xFFCD7630);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    150) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    200)) {
                                                              return const Color(
                                                                  0xFFC42222);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    200) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    300)) {
                                                              return const Color(
                                                                  0xFFA21BBB);
                                                            } else {
                                                              return const Color(
                                                                  0xFF800000);
                                                            }
                                                          }(),
                                                          fontSize: 40.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl: () {
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.aQIaverage,
                                                            0) <=
                                                        50) {
                                                      return FFAppConstants
                                                          .good;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            50) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            100)) {
                                                      return FFAppConstants
                                                          .moderate;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            100) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            150)) {
                                                      return FFAppConstants
                                                          .unhealtyforsg;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            150) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            200)) {
                                                      return FFAppConstants
                                                          .unhealthy;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) >
                                                            200) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aQIaverage,
                                                                0) <=
                                                            300)) {
                                                      return FFAppConstants
                                                          .veryunhealthy;
                                                    } else {
                                                      return FFAppConstants
                                                          .hazard;
                                                    }
                                                  }(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.aQIaverage,
                                                        0)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLarge
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: () {
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.aQIaverage,
                                                                    0) <=
                                                                50) {
                                                              return const Color(
                                                                  0xFF4FDD4D);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    50) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    100)) {
                                                              return const Color(
                                                                  0xFFDDD820);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    100) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    150)) {
                                                              return const Color(
                                                                  0xFFCD7630);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    150) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    200)) {
                                                              return const Color(
                                                                  0xFFC42222);
                                                            } else if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) >
                                                                    200) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.aQIaverage,
                                                                        0) <=
                                                                    300)) {
                                                              return const Color(
                                                                  0xFFA21BBB);
                                                            } else {
                                                              return const Color(
                                                                  0xFF800000);
                                                            }
                                                          }(),
                                                          fontSize: 30.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered1 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Particulate Matter: PM is a mixture of solid particles and liquid droplets made up of hundreds of different chemicals. PM10 are inhalable particles, with diameters generally of 2.5 µm and smaller.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 5000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered1 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'PM2.5:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.pM25average,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered2 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Particulate Matter: PM is a mixture of solid particles and liquid droplets made up of hundreds of different chemicals. PM10 are inhalable particles, with diameters generally of 10 µm and smaller.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 5000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered2 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'PM10:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.pM10average,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered3 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Sulfur Dioxide:  SO2 largely comes from burning fossil fuels (coal and oil) by power plants and other industrial facilities and from burning diesel fuel in vehicles.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered3 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'SO2:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.sO2average,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered4 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Ozone: O3 is a gas composed of three atoms of oxygen. Ozone occurs both in the upper atmosphere and at ground level. In the upper atmosphere, O3 shields us from the sun’s harmful ultraviolet rays, but at ground level, it is a harmful air pollutant and is the main ingredient in “smog.”',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered4 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'O3:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.o3average,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered5 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Nitrogen Dioxide: NO2 is one of a group of highly reactive gases known as nitrogen oxides (NOx). When NOx and certain volatile organic compounds chemically react in the presence of strong sunlight, they form ozone or “smog.” NO2 primarily is a result of burning fuels in utility and industrial boilers as well as automobiles and trucks.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered5 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'NO2:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.nO2average,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered6 = true);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Carbon Monoxide: CO is an odorless gas that can come from incomplete combustion of fossil fuels in boilers and engines, but primarily as a result of automobiles, trucks and buses.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 5000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered6 = false);
                                            }),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'CO:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.cOaverage,
                                                              0)
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          theme: const ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: false,
                            tapBodyToCollapse: false,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Air Quality Over Time',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'This graph represents the Air Quality Index (AQI) values measured over the last week.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: StreamBuilder<List<UserAQIRecord>>(
                              stream: queryUserAQIRecord(
                                queryBuilder: (userAQIRecord) => userAQIRecord
                                    .orderBy('date', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .indigoDye,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserAQIRecord> chartUserAQIRecordList =
                                    snapshot.data!;
                                return SizedBox(
                                  width: 370.0,
                                  height: 230.0,
                                  child: FlutterFlowLineChart(
                                    data: [
                                      FFLineChartData(
                                        xData: chartUserAQIRecordList
                                            .map((e) => e.date)
                                            .withoutNulls
                                            .toList()
                                            .take(_model.daysCounter!)
                                            .toList(),
                                        yData: chartUserAQIRecordList
                                            .map((e) => e.aqi)
                                            .toList()
                                            .take(_model.daysCounter!)
                                            .toList(),
                                        settings: LineChartBarData(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          barWidth: 2.0,
                                          isCurved: true,
                                          preventCurveOverShooting: true,
                                          dotData: FlDotData(show: false),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            color: const Color(0x520DCDDD),
                                          ),
                                        ),
                                      )
                                    ],
                                    chartStylingInfo: ChartStylingInfo(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderWidth: 1.0,
                                    ),
                                    axisBounds: const AxisBounds(),
                                    xAxisLabelInfo: const AxisLabelInfo(
                                      title: 'Time',
                                      titleTextStyle: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    yAxisLabelInfo: const AxisLabelInfo(
                                      title: 'AQI',
                                      titleTextStyle: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('Week'),
                                        ChipData('Month'),
                                        ChipData('All')
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model.choiceChipsValue =
                                            val?.firstOrNull);
                                        setState(() {
                                          _model.daysCounter = () {
                                            if (_model.choiceChipsValue ==
                                                'Week') {
                                              return 7;
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Month') {
                                              return 30;
                                            } else {
                                              return 365;
                                            }
                                          }();
                                        });
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: const Color(0xFFA8DADC),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 40.0,
                                      rowSpacing: 16.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.spaceEvenly,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        ['Week'],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Saved locations',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  fontSize: 24.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Add new favourite location',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: PlaceAutocompleteCall.call(
                                  input: _model.textController.text,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .indigoDye,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final textFieldPlaceAutocompleteResponse =
                                      snapshot.data!;
                                  return SizedBox(
                                    width: 200.0,
                                    child: Autocomplete<String>(
                                      initialValue: const TextEditingValue(),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return (_model.apiResultts5?.jsonBody ??
                                                '')
                                            .where((option) {
                                          final lowercaseOption =
                                              option.toLowerCase();
                                          return lowercaseOption.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) {
                                        return AutocompleteOptionsList(
                                          textFieldKey: _model.textFieldKey,
                                          textController:
                                              _model.textController!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textHighlightStyle: const TextStyle(),
                                          elevation: 4.0,
                                          optionBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          optionHighlightColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        setState(() =>
                                            _model.textFieldSelectedOption =
                                                selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.textFieldFocusNode = focusNode;

                                        _model.textController =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.textFieldKey,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              _model.apiResultts5 =
                                                  await PlaceAutocompleteCall
                                                      .call(
                                                input:
                                                    _model.textController.text,
                                              );

                                              setState(() {});
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Search city...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: GeocodingCall.call(
                      address: _model.textController.text,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).indigoDye,
                              ),
                            ),
                          ),
                        );
                      }
                      final buttonGeocodingResponse = snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          await UserCitiesRecord.collection
                              .doc()
                              .set(createUserCitiesRecordData(
                                uid: currentUserReference,
                                savedCity: _model.textController.text,
                              ));
                          setState(() {
                            _model.textController?.clear();
                          });
                        },
                        text: 'Add new  city',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<UserCitiesRecord>>(
                    stream: queryUserCitiesRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).indigoDye,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UserCitiesRecord> pageViewUserCitiesRecordList =
                          snapshot.data!;
                      return SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            0,
                                            pageViewUserCitiesRecordList
                                                    .length -
                                                1)),
                                scrollDirection: Axis.horizontal,
                                itemCount: pageViewUserCitiesRecordList.length,
                                itemBuilder: (context, pageViewIndex) {
                                  final pageViewUserCitiesRecord =
                                      pageViewUserCitiesRecordList[
                                          pageViewIndex];
                                  return FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    speed: 400,
                                    front: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    pageViewUserCitiesRecord
                                                        .savedCity,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 36.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await pageViewUserCitiesRecord
                                                            .reference
                                                            .delete();
                                                      },
                                                      child:
                                                          ContainerDeleteIconWidget(
                                                        key: Key(
                                                            'Key9sf_${pageViewIndex}_of_${pageViewUserCitiesRecordList.length}'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    back: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'PM2.5: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .pm25aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'PM10: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .pm10aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'CO: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .coaqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'O3: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .o3aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'SO2: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .so2aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'NO2: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          AirQualityCurrentConditionCall
                                                              .call(
                                                        city:
                                                            pageViewUserCitiesRecord
                                                                .savedCity,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .indigoDye,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAirQualityCurrentConditionResponse =
                                                            snapshot.data!;
                                                        return Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AirQualityCurrentConditionCall
                                                                .no2aqi(
                                                              textAirQualityCurrentConditionResponse
                                                                  .jsonBody,
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 16.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              0,
                                              pageViewUserCitiesRecordList
                                                      .length -
                                                  1)),
                                  count: pageViewUserCitiesRecordList.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 3.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 16.0,
                                    dotHeight: 8.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).indigoDye,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
