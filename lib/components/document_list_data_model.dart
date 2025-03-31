import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'document_list_data_widget.dart' show DocumentListDataWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DocumentListDataModel extends FlutterFlowModel<DocumentListDataWidget> {
  ///  Local state fields for this component.

  List<String> documentName = [];
  void addToDocumentName(String item) => documentName.add(item);
  void removeFromDocumentName(String item) => documentName.remove(item);
  void removeAtIndexFromDocumentName(int index) => documentName.removeAt(index);
  void insertAtIndexInDocumentName(int index, String item) =>
      documentName.insert(index, item);
  void updateDocumentNameAtIndex(int index, Function(String) updateFn) =>
      documentName[index] = updateFn(documentName[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
