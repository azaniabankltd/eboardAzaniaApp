import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'posted_images_preview_widget.dart' show PostedImagesPreviewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostedImagesPreviewModel
    extends FlutterFlowModel<PostedImagesPreviewWidget> {
  ///  Local state fields for this component.

  List<String> imagePath = [];
  void addToImagePath(String item) => imagePath.add(item);
  void removeFromImagePath(String item) => imagePath.remove(item);
  void removeAtIndexFromImagePath(int index) => imagePath.removeAt(index);
  void insertAtIndexInImagePath(int index, String item) =>
      imagePath.insert(index, item);
  void updateImagePathAtIndex(int index, Function(String) updateFn) =>
      imagePath[index] = updateFn(imagePath[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
