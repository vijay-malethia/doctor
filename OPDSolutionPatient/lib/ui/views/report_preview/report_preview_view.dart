import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../common/app_colors.dart';
import 'report_preview_viewmodel.dart';

class ReportPreviewView extends StackedView<ReportPreviewViewModel> {
  final String base64Data;
  final String indexName;
  const ReportPreviewView(
      {required this.base64Data, required this.indexName, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportPreviewViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                titleSpacing: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Text(indexName,
                    style: Theme.of(context).textTheme.bodyLarge),
                leadingWidth: 46,
                leading: Container(
                    padding: const EdgeInsets.only(left: 11.57),
                    child: IconButton(
                        onPressed: viewModel.goBack,
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 16, color: Colors.white))),
                elevation: 0,
                backgroundColor: primaryColor),
            body: SingleChildScrollView(
                child: base64Data.split('.').last == 'pdf'
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: SfPdfViewer.network(base64Data))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(base64Data, fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        })
                        // child: ExtendedImage.network(base64Data,
                        //     fit: BoxFit.contain,
                        //     mode: ExtendedImageMode.gesture,
                        //     cache: true, loadStateChanged: (loadingProgress) {
                        //   if (loadingProgress.loadingProgress == null) {
                        //     return child;
                        //   }
                        //   return const Center(
                        //       child: CircularProgressIndicator());
                        // }, initGestureConfigHandler: (state) {
                        //   return GestureConfig(
                        //       minScale: 1,
                        //       animationMinScale: 0.9,
                        //       maxScale: 4,
                        //       animationMaxScale: 4.5,
                        //       speed: 1.0,
                        //       inertialSpeed: 100.0,
                        //       initialScale: 1.0,
                        //       inPageView: false,
                        //       initialAlignment: InitialAlignment.center);
                        // }
                        // )
                        ))));
  }

  @override
  ReportPreviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportPreviewViewModel();
}
