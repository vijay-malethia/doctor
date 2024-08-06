import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../widgets/button.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/input.dart';
import 'edit_user_profile_sheet.form.dart';
import 'edit_user_profile_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'phoneNumber'),
])
class EditUserProfileSheet extends StackedView<EditUserProfileSheetModel>
    with $EditUserProfileSheet {
  final _navigationService = locator<NavigationService>();

  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  EditUserProfileSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditUserProfileSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
        child: Container(
            height: 380,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  verticalSpaceMedium,
                  const Text("Edit Profile",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: primaryColor)),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Input(
                                controller: firstNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                autofocus: false,
                                prefixIcon: const Icon(Icons.person,
                                    color: primaryColor, size: 24))),
                        horizontalSpaceMedium,
                        Expanded(
                            child: Input(
                                controller: lastNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                autofocus: false,
                                prefixIcon: const Icon(Icons.person,
                                    color: primaryColor, size: 24))),
                        horizontalSpaceMedium,
                        Expanded(
                            child: DropDown(
                                items: viewModel.genderList,
                                initValue: viewModel.genderList
                                        .contains(request.data[0].gender)
                                    ? request.data[0].gender
                                    : viewModel.genderInitVale,
                                iconColor: Colors.grey,
                                onChanged: viewModel.changeGender))
                      ]),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Input(
                                inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                                readOnly: true,
                                controller: phoneNumberController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                autofocus: false,
                                prefixIcon: const Icon(Icons.call,
                                    color: primaryColor, size: 24))),
                        horizontalSpaceMedium,
                        Expanded(
                            child: Input(
                                controller: ageController,
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        const Expanded(child: SizedBox())
                      ]),
                  verticalSpaceLarge,
                  Row(children: [
                    Expanded(
                        child: Button(
                            title: 'Cancel',
                            isWhiteBg: true,
                            onPressed: () {
                              _navigationService.back();
                            },
                            height: 55)),
                    horizontalSpaceMedium,
                    Expanded(
                        child: Button(
                            onPressed: () {
                              viewModel.updateUser(
                                  index: request.data[1],
                                  userList: request.data[2],
                                  id: request.data[0].id,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  age: ageController.text,
                                  phoneNumber: phoneNumberController.text);
                            },
                            title: "Update",
                            height: 55))
                  ])
                ]))));
  }

  @override
  EditUserProfileSheetModel viewModelBuilder(BuildContext context) =>
      EditUserProfileSheetModel()
        ..setControllersValue(
            firstNameController,
            lastNameController,
            phoneNumberController,
            ageController,
            request.data[0].firstName,
            request.data[0].lastName,
            request.data[0].phoneNumber,
            request.data[0].age.toString(),
            request.data[0].gender);
}
