import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opdsolutionui/ui/common/ui_helpers.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../views/profile/profile_viewmodel.dart';

class ImagePickerSheet extends StackedView<ProfileViewModel> {
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
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          )),
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Container()),
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
                          style: Theme.of(context).textTheme.displaySmall,
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
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ]),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () =>
                    completer!.call(SheetResponse(confirmed: false)),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.displaySmall,
                )),
          ),
          verticalSpaceLarge,
          verticalSpaceLarge
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
