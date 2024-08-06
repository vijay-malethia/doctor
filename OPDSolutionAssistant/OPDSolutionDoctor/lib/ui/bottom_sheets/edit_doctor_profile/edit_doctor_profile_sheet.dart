import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/widgets/drop_down.dart';
import '/widgets/input.dart';
import '/ui/common/index.dart';
import '/widgets/button.dart';
import '/ui/views/doctor_profile/doctor_profile_view.form.dart';
import '/ui/views/doctor_profile/doctor_profile_viewmodel.dart';

String? doctorId;

class EditDoctorProfileSheet extends StackedView<DoctorProfileViewModel>
    with $DoctorProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditDoctorProfileSheet({
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
      // height: 450,
      // constraints: BoxConstraints(),
      margin: const EdgeInsets.only(top: 140),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpaceSmall,
                const Text("Profile Edit",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
                Align(
                  alignment: Alignment.center,
                  child: profilePath.trim().isEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: SvgPicture.asset(
                            Images().patientLogoGreen,
                            height: 134,
                            width: 134,
                          ))
                      : ClipOval(
                          child: CircleAvatar(
                            radius: 67,
                            child: viewModel.pickedDoctorImage != null
                                ? Image.file(viewModel.pickedDoctorImage!,
                                    height: 134, width: 134, fit: BoxFit.cover)
                                : Image.network(
                                    '$baseurl$profilePath',
                                    height: 134,
                                    width: 134,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                ),
                verticalSpaceMedium,
                InkWell(
                  onTap: () {
                    viewModel.showImagePickerBottomSheet('doctorProfile');
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
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Input(
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 24,
                          color: primaryColor,
                        ),
                        hintText: "First Name",
                        controller: firstNameController,
                      ),
                    ),
                    horizontalSpaceLarge,
                    Expanded(
                      flex: 2,
                      child: Input(
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 24,
                          color: primaryColor,
                        ),
                        hintText: "Last Name",
                        controller: lastNameController,
                      ),
                    ),
                    horizontalSpaceLarge,
                    Expanded(
                      flex: 2,
                      child: Input(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(Images().callIcon),
                        ),
                        hintText: "+91 ------------",
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Input(
                        hintText: "Age",
                        controller: ageController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    horizontalSpaceLarge,
                    Expanded(
                      flex: 2,
                      child: Input(
                        hintText: "Speciality",
                        controller: specialityController,
                      ),
                    ),
                    horizontalSpaceLarge,
                    Expanded(
                      flex: 2,
                      child: Input(
                        hintText: "Experience",
                        controller: experienceController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropDown(
                          initValue: doctorGender,
                          items: viewModel.genderList,
                          onChanged: viewModel.changeGender,
                          iconColor: primaryColor),
                    ),
                    horizontalSpaceLarge,
                    horizontalSpaceLarge,
                    Expanded(flex: 4, child: Container())
                  ],
                ),
                verticalSpaceLarge,
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
                              await viewModel.updateDoctorProfile(
                                  id: doctorId,
                                  fname: firstNameController.text,
                                  lname: lastNameController.text,
                                  age: ageController.text,
                                  gender: doctorGender,
                                  experience: experienceController.text,
                                  specialization: specialityController.text);
                              completer!.call(SheetResponse(confirmed: true));
                            },
                            title: save,
                            height: 55)),
                    verticalSpaceLarge
                  ],
                )
              ],
            ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(BuildContext context) =>
      DoctorProfileViewModel();
}
