import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '/widgets/button.dart';
import '/ui/common/index.dart';
import '/ui/views/doctor_profile/doctor_profile_viewmodel.dart';

class ImagePickerSheet extends StackedView<DoctorProfileViewModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ImagePickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DoctorProfileViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                        const Icon(Icons.camera),
                        const SizedBox(height: 10),
                        Text(
                          'Camera',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ]),
                ),
              ),
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
                        const Icon(Icons.image),
                        const SizedBox(height: 10),
                        Text(
                          'Gallery',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ]),
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          Button(
            onPressed: () {
              completer!.call(SheetResponse(confirmed: false));
            },
            title: cancel,
            height: 55,
          ),
          verticalSpaceLarge
        ],
      ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(BuildContext context) =>
      DoctorProfileViewModel();
}
