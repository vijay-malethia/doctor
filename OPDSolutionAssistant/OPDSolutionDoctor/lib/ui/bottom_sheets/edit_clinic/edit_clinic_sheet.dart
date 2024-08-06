import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/widgets/input.dart';
import '/widgets/button.dart';
import '/ui/common/index.dart';
import '/ui/views/doctor_profile/doctor_profile_view.form.dart';
import '/ui/views/doctor_profile/doctor_profile_viewmodel.dart';

String? clinicId;

class EditClinicSheet extends StackedView<DoctorProfileViewModel>
    with $DoctorProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditClinicSheet({
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
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpaceSmall,
                  Text(isEditable ? "Clinic edit" : "Add Clinic",
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                  if (isEditable) ...[
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: viewModel.pickedImage != null
                            ? Image.file(viewModel.pickedImage!,
                                height: 137, width: 137, fit: BoxFit.cover)
                            : clinicPath.trim().isNotEmpty
                                ? Image.network(clinicPath,
                                    height: 137, width: 137, fit: BoxFit.cover)
                                : Image.asset(
                                    Images().clinicImage,
                                    height: 137,
                                    width: 137,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                    verticalSpaceMedium,
                    InkWell(
                      onTap: () {
                        viewModel.showImagePickerBottomSheet('clinicPic');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Images().uploadIcon,
                                height: 24, width: 24),
                            horizontalSpaceSmall,
                            const Text("Upload",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700))
                          ]),
                    ),
                  ],
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Input(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(Images().buildingIcon,
                                height: 24, width: 24),
                          ),
                          hintText: "Clinic Name",
                          controller: clinicNameController,
                          maxLines: 1,
                        ),
                      ),
                      horizontalSpaceLarge,
                      Expanded(
                        flex: 3,
                        child: Input(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(Images().locationMarkerIcon,
                                height: 24, width: 24),
                          ),
                          hintText: "Clinic Location",
                          controller: clinicLocationController,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  const Text("Emergency Contact",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Input(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(Images().callIcon),
                          ),
                          hintText: "+91 ------------",
                          controller: number1Controller,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      horizontalSpaceLarge,
                      Expanded(flex: 3, child: Container())
                      // Expanded(
                      //   flex: 3,
                      //   child: Input(
                      //     prefixIcon: Icon(
                      //       Icons.phone_in_talk,
                      //       size: 24,
                      //       color: primaryColor,
                      //     ),
                      //     hintText: "+91 ------------",
                      //   ),
                      // ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Button(
                            onPressed: () {
                              completer!.call(SheetResponse(confirmed: false));
                            },
                            title: cancel,
                            height: 55,
                            isWhiteBg: true,
                          )),
                      horizontalSpaceMedium,
                      Expanded(
                          flex: 3,
                          child: Button(
                              onPressed: () async {
                                isEditable
                                    ? await viewModel.updateClinicDetails(
                                        id: clinicId,
                                        clinicName: clinicNameController.text,
                                        clinicAddress:
                                            clinicLocationController.text,
                                        contactNumber: number1Controller.text)
                                    : await viewModel.addClinicDetails(
                                        clinicName: clinicNameController.text,
                                        clinicAddress:
                                            clinicLocationController.text,
                                        contactNumber: number1Controller.text);
                                completer!.call(SheetResponse(confirmed: true));
                              },
                              title: save,
                              height: 55))
                    ],
                  ),
                  verticalSpaceLarge
                ],
              ),
            ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(BuildContext context) =>
      DoctorProfileViewModel();
}
