import 'package:doc_ease/ui/views/appointment_details/appointment_details_view.form.dart';
import 'package:doc_ease/ui/views/appointment_details/appointment_details_viewmodel.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';
import '/ui/common/app_colors.dart';
import '/ui/common/ui_helpers.dart';

class EditUserSheet extends StackedView<AppointmentDetailsViewModel>
    with $AppointmentDetailsView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditUserSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppointmentDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              verticalSpaceSmall,
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Edit User",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          fontFamily: 'Lato'))),
              verticalSpaceMedium,
              Input(
                  controller: firstNameController,
                  hintText: "First Name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.person, color: primaryColor, size: 24)),
              verticalSpaceMedium,
              Input(
                  controller: lastNameController,
                  hintText: "Last Name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.person, color: primaryColor, size: 24)),
              verticalSpaceMedium,
              Input(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: phoneNumberController,
                  hintText: "+91 ----------",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLines: 1,
                  readOnly: true,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.call, color: primaryColor, size: 24)),
              verticalSpaceMedium,
              Input(
                  controller: ageController,
                  hintText: "20",
                  maxLength: 3,
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Age",
                          style: TextStyle(
                              color: kcDarkGreyColor,
                              letterSpacing: 0,
                              fontSize: 18,
                              fontWeight: FontWeight.w700))),
                  textInputAction: TextInputAction.next,
                  textAlign: true,
                  maxLines: 1,
                  autofocus: false),
              verticalSpaceMedium,
              DropDown(
                  items: viewModel.genderList,
                  initValue: selectedGender,
                  iconColor: Colors.grey,
                  onChanged: viewModel.changeGender),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                    child: Button(
                        isWhiteBg: true,
                        title: 'Cancel',
                        onPressed: () {
                          completer!.call(SheetResponse(confirmed: false));
                        },
                        height: 55)),
                horizontalSpaceSmall,
                Expanded(
                    child: Button(
                        onPressed: () {
                          viewModel.updateUser(
                              id: request.data,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              age: ageController.text,
                              phoneNumber: phoneNumberController.text);
                          completer!.call(SheetResponse(confirmed: true));
                        },
                        title: "Update",
                        height: 55))
              ])
            ])));
  }

  @override
  AppointmentDetailsViewModel viewModelBuilder(BuildContext context) =>
      AppointmentDetailsViewModel();
}
