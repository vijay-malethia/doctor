import 'package:flutter/material.dart';
import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/views/patient/patient_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/ui_helpers.dart';

class ConfirmDialog extends StackedView<PatientViewModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ConfirmDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientViewModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Container(
            width: 400,
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Are you sure?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      renderButton('No'),
                      horizontalSpaceSmall,
                      renderButton('Yes'),
                    ],
                  ),
                ])));
  }

  SizedBox renderButton(name) {
    return SizedBox(
      height: 42,
      width: 150,
      child: GestureDetector(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 57,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  color: name != 'Yes' ? Colors.white : primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  name == 'Yes'
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : const Icon(Icons.close, color: primaryColor, size: 20),
                  horizontalSpaceSmall,
                  Text(name,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Lato',
                          color: name == 'Yes' ? Colors.white : primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ],
              )),
          onTap: () {
            completer.call(DialogResponse(
                confirmed: true, data: name == 'Yes' ? true : false));
          }),
    );
  }

  @override
  PatientViewModel viewModelBuilder(BuildContext context) => PatientViewModel();
}
