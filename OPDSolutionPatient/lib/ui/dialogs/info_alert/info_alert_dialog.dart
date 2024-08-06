import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/widgets/button.dart';
import '/ui/views/profile/profile_viewmodel.dart';
import '/ui/common/ui_helpers.dart';

class InfoAlertDialog extends StackedView<ProfileViewModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        insetPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 2, bottom: 20, left: 15, right: 15),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpaceTiny,
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            completer(DialogResponse(confirmed: true));
                          },
                          icon: const Icon(Icons.close, size: 18))),
                  const Text("Are You Sure ?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  verticalSpaceTiny,
                  const Text("Tap ' Yes ' to Delete Profile",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  verticalSpaceMedium,
                  Row(children: [
                    Expanded(
                        child: Button(
                            onPressed: () {
                              completer(DialogResponse(confirmed: true));
                              viewModel.deleteProfile(context, request.data);
                            },
                            title: "Yes",
                            height: 40)),
                    horizontalSpaceMedium,
                    Expanded(
                        child: Button(
                            onPressed: () {
                              completer(DialogResponse(confirmed: true));
                            },
                            title: "No",
                            height: 40,
                            isWhiteBg: true,
                            border: true))
                  ])
                ])));
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
