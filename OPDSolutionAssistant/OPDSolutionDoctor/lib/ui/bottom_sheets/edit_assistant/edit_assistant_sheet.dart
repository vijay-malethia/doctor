import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opd_doctor/ui/common/image.dart';
import 'package:opd_doctor/widgets/drop_down.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/widgets/input.dart';
import '/widgets/button.dart';
import '/ui/common/app_colors.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/views/doctor_profile/doctor_profile_view.form.dart';
import '/ui/views/doctor_profile/doctor_profile_viewmodel.dart';
import '/ui/common/app_strings.dart';

String assistantId = '';

class EditAssistantSheet extends StackedView<DoctorProfileViewModel>
    with $DoctorProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditAssistantSheet({
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Text(isAssitantAdd ? "Assistant add" : "Assistant edit",
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700)),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Input(
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 24,
                      color: primaryColor,
                    ),
                    hintText: "First Name",
                    controller: assistantFirstNameController,
                  ),
                ),
                horizontalSpaceLarge,
                // Expanded(
                //   flex: 2,
                //   child: Input(
                //     prefixIcon: Icon(
                //       Icons.person,
                //       size: 24,
                //       color: primaryColor,
                //     ),
                //     hintText: "Middle Name",
                //   ),
                // ),

                Expanded(
                  flex: 3,
                  child: Input(
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 24,
                      color: primaryColor,
                    ),
                    hintText: "Last Name",
                    controller: assistantLastNameController,
                  ),
                )
              ],
            ),
            // verticalSpaceLarge,
            // Row(
            //   children: [
            //     const Expanded(
            //       flex: 2,
            //       child: Input(
            //         prefixIcon: Icon(
            //           Icons.phone_in_talk,
            //           size: 24,
            //           color: primaryColor,
            //         ),
            //         hintText: "+91 ------------",
            //       ),
            //     ),
            //     horizontalSpaceLarge,
            //     Expanded(
            //       flex: 2,
            //       child: Input(
            //         prefixIcon: Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: SvgPicture.asset(
            //             Images().whatsapp,
            //           ),
            //         ),
            //         hintText: "+91 ------------",
            //       ),
            //     ),
            //     horizontalSpaceLarge,
            //     Expanded(
            //       flex: 2,
            //       child: DropDown(
            //         initValue: viewModel.roleInitialValue,
            //         items: viewModel.roleList,
            //         onChanged: viewModel.changeRole,
            //         iconColor: primaryColor,
            //       ),
            //     )
            //   ],
            // ),
            verticalSpaceMedium,
            if (isAssitantAdd) ...[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Input(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          Images().callIcon,
                         
                        ),
                      ),
                    
                      hintText: "+91 ------------",
                      controller: assistantContactNumberController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  horizontalSpaceLarge,
                  Expanded(
                    flex: 3,
                    child: DropDown(
                      initValue: viewModel.assistantGender,
                      items: viewModel.genderList,
                      onChanged: viewModel.changeAssistant,
                      iconColor: primaryColor,
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                  flex: 3,
                  child: Input(
                    hintText: "Speciality",
                    controller: assistantSpecializationController,
                  ),
                ),
                horizontalSpaceLarge,
                const Expanded(flex: 3, child: horizontalSpaceTiny),
              ]),
              verticalSpaceMedium,
            ],
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
                          isAssitantAdd
                              ? await viewModel.addAssistantDetails(
                                  assistantFirstame:
                                      assistantFirstNameController.text,
                                  assistantLastName:
                                      assistantLastNameController.text,
                                  assistantGender: viewModel.assistantGender,
                                  assistantContactNumber:
                                      assistantContactNumberController.text,
                                  assistantSpecialization:
                                      assistantSpecializationController.text)
                              : await viewModel.updateAssistantDetails(
                                  id: assistantId,
                                  fname: assistantFirstNameController.text,
                                  lname: assistantLastNameController.text);
                          completer!.call(SheetResponse(confirmed: true));
                        },
                        title: save,
                        height: 55))
              ],
            ),
            verticalSpaceLarge,
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(BuildContext context) =>
      DoctorProfileViewModel();
}
