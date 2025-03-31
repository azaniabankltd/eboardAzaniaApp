import '/backend/api_requests/api_calls.dart';
import '/components/posted_images_preview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'eventsupdates_page_widget.dart' show EventsupdatesPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventsupdatesPageModel extends FlutterFlowModel<EventsupdatesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllEventsPosted)] action in eventsupdatesPage widget.
  ApiCallResponse? eventsResults;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
