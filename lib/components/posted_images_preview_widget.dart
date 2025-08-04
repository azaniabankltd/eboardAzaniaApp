import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'posted_images_preview_model.dart';
export 'posted_images_preview_model.dart';

class PostedImagesPreviewWidget extends StatefulWidget {
  const PostedImagesPreviewWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final dynamic parameter1;
  final dynamic parameter2;

  @override
  State<PostedImagesPreviewWidget> createState() =>
      _PostedImagesPreviewWidgetState();
}

class _PostedImagesPreviewWidgetState extends State<PostedImagesPreviewWidget> {
  late PostedImagesPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostedImagesPreviewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final postedImages = widget!.parameter2?.toList() ?? [];

        return Container(
          width: double.infinity,
          height: 500.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, postedImages.length - 1))),
                  scrollDirection: Axis.horizontal,
                  itemCount: postedImages.length,
                  itemBuilder: (context, postedImagesIndex) {
                    final postedImagesItem = postedImages[postedImagesIndex];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        getJsonField(
                          postedImagesItem,
                          r'''$.image_path''',
                        ).toString(),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(0, min(0, postedImages.length - 1))),
                    count: postedImages.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      safeSetState(() {});
                    },
                    effect: smooth_page_indicator.SlideEffect(
                      spacing: 8.0,
                      radius: 8.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      dotColor: FlutterFlowTheme.of(context).accent1,
                      activeDotColor: FlutterFlowTheme.of(context).primary,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
