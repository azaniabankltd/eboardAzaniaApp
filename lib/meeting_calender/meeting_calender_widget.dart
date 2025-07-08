import '/backend/api_requests/api_calls.dart';
import '/components/meeting_list_new_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meeting_calender_model.dart';
export 'meeting_calender_model.dart';

/// create page to show calender with details like when meetin will be held
class MeetingCalenderWidget extends StatefulWidget {
  const MeetingCalenderWidget({super.key});

  static String routeName = 'meetingCalender';
  static String routePath = '/meetingCalender';

  @override
  State<MeetingCalenderWidget> createState() => _MeetingCalenderWidgetState();
}

class _MeetingCalenderWidgetState extends State<MeetingCalenderWidget>
    with TickerProviderStateMixin {
  late MeetingCalenderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetingCalenderModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF2596BE),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 40.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'qzfss9zy' /* Meeting Calendar */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      unselectedLabelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '6zlxebcg' /* Upcoming */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '6qnqpe7r' /* Passed */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: GetAllMeeetingSchedulesCall.call(
                            year: '2025',
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitThreeBounce(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            final columnGetAllMeeetingSchedulesResponse =
                                snapshot.data!;

                            return ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                scrollbars: false,
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown,
                                },
                              ),
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final upcomingEvents =
                                              GetAllMeeetingSchedulesCall
                                                      .meetingSchedule(
                                                    columnGetAllMeeetingSchedulesResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                upcomingEvents.length,
                                                (upcomingEventsIndex) {
                                              final upcomingEventsItem =
                                                  upcomingEvents[
                                                      upcomingEventsIndex];
                                              return MeetingListNewWidget(
                                                key: Key(
                                                    'Key9oo_${upcomingEventsIndex}_of_${upcomingEvents.length}'),
                                                meetingAgenda: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.meeting_agenda''',
                                                ).toString(),
                                                meetingDate: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.formatted_time''',
                                                ).toString(),
                                                meetingLocation: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.meeting_location''',
                                                ).toString(),
                                                onlyDate: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.only_date''',
                                                ).toString(),
                                                onlyMonth: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.only_month''',
                                                ).toString(),
                                                meeetingType: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.meeting_type''',
                                                ).toString(),
                                                committee: getJsonField(
                                                  upcomingEventsItem,
                                                  r'''$.commettee''',
                                                ).toString(),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: GetAllMeeetingSchedulesCall.call(
                            year: 'passed',
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnGetAllMeeetingSchedulesResponse =
                                snapshot.data!;

                            return ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                scrollbars: false,
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown,
                                },
                              ),
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final passedEvents =
                                              GetAllMeeetingSchedulesCall
                                                      .meetingSchedule(
                                                    columnGetAllMeeetingSchedulesResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                passedEvents.length,
                                                (passedEventsIndex) {
                                              final passedEventsItem =
                                                  passedEvents[
                                                      passedEventsIndex];
                                              return MeetingListNewWidget(
                                                key: Key(
                                                    'Keym4g_${passedEventsIndex}_of_${passedEvents.length}'),
                                                meetingAgenda: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.meeting_agenda''',
                                                ).toString(),
                                                meetingDate: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.formatted_time''',
                                                ).toString(),
                                                meetingLocation: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.meeting_location''',
                                                ).toString(),
                                                onlyDate: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.only_date''',
                                                ).toString(),
                                                onlyMonth: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.only_month''',
                                                ).toString(),
                                                meeetingType: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.meeting_type''',
                                                ).toString(),
                                                committee: getJsonField(
                                                  passedEventsItem,
                                                  r'''$.commettee''',
                                                ).toString(),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
