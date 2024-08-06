import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/app_colors.dart';
import '/ui/views/report/report_viewmodel.dart';

class UploadOptionsSheet extends StackedView<ReportViewModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const UploadOptionsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportViewModel viewModel,
    Widget? child,
  ) {
    return Container(
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
                onTap: () {
                  completer!.call(
                      SheetResponse(confirmed: true, data: ImageSource.camera));
                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera, color: Colors.white),
                          const SizedBox(height: 10),
                          Text('Camera',
                              style: Theme.of(context).textTheme.displayMedium)
                        ]))),
            InkWell(
                onTap: () {
                  completer!.call(SheetResponse(
                      confirmed: true, data: ImageSource.gallery));
                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, color: Colors.white),
                          const SizedBox(height: 10),
                          Text('Gallery',
                              style: Theme.of(context).textTheme.displayMedium)
                        ]))),
            InkWell(
                onTap: () {
                  completer!.call(SheetResponse(confirmed: true, data: 'pdf'));
                },
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.file_present_outlined,
                              color: Colors.white),
                          const SizedBox(height: 10),
                          Text('Pdf',
                              style: Theme.of(context).textTheme.displayMedium)
                        ])))
          ])
        ]));
  }

  @override
  ReportViewModel viewModelBuilder(BuildContext context) => ReportViewModel();
}
