import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/index.dart';
import '../patient/patient_viewmodel.dart';

class ReportView extends StackedView<PatientViewModel> {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
          appBar: renderAppBar(context),
          body: GestureDetector(
            child: Stack(
              children: [
                renderImageViewer(context, child, viewModel),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 10, top: 10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              padding: const EdgeInsets.all(0),
                              splashRadius: 1,
                              onPressed: () {
                                viewModel.swipeReport(
                                    action: '', reportName: reportPathName);
                              },
                              icon: const Icon(Icons.arrow_back_ios,
                                  size: 40, color: primaryColor)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 10, bottom: 15, top: 10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              splashRadius: 1,
                              onPressed: () {
                                viewModel.swipeReport(
                                    action: 'Next', reportName: reportPathName);
                              },
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 40, color: primaryColor)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  AppBar renderAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      toolbarHeight: 60,
      elevation: 0,
      title: Text(
        reportPathName,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, size: 24)),
    );
  }

  Container renderImageViewer(
      BuildContext context, Widget? child, PatientViewModel viewModel) {
    return Container(
      child: reportPath == ''
          ? const Center(
              child: Text('NO FILE UPLOADED YET',
                  style: TextStyle(fontWeight: FontWeight.w500)))
          : {baseurl + reportPath}.toString().split('.').last == 'pdf'
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SfPdfViewer.network('$baseurl+$reportPath'))
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ExtendedImage.network(
                    '$baseurl$reportPath',
                    fit: BoxFit.contain,
                    mode: ExtendedImageMode.gesture,
                    loadStateChanged: (loadingProgress) {
                      if (loadingProgress.loadingProgress == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                    initGestureConfigHandler: (state) {
                      return GestureConfig(
                        minScale: 1,
                        animationMinScale: 0.9,
                        maxScale: 4,
                        animationMaxScale: 4.5,
                        speed: 1.0,
                        inertialSpeed: 100.0,
                        initialScale: 1.0,
                        inPageView: false,
                        initialAlignment: InitialAlignment.center,
                      );
                    },
                  ),
                ),
    );
  }

  @override
  PatientViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PatientViewModel();
}
