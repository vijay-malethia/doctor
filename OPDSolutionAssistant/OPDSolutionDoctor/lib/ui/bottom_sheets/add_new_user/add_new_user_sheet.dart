import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_new_user/add_new_user_sheet.form.dart';

import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/common/ui_helpers.dart';
import 'package:opd_doctor/widgets/drop_down.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../widgets/button.dart';
import '../../../widgets/input.dart';
import 'add_new_user_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'bph'),
  FormTextField(name: 'temperature'),
])
class AddNewUserSheet extends StackedView<AddNewUserSheetModel>
    with $AddNewUserSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  AddNewUserSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddNewUserSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
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
                  const Text("Add User",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: primaryColor)),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Input(
                                controller: firstNameController,
                                hintText: "First Name",
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
                                hintText: "Last Name",
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
                                initValue: viewModel.genderInitVale,
                                iconColor: Colors.grey,
                                onChanged: viewModel.changeGender))
                      ]),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Input(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: phoneNumberController,
                                hintText: "+91 ----------",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                autofocus: false,
                                prefixIcon: const Icon(Icons.call,
                                    color: primaryColor, size: 24))),
                        horizontalSpaceMedium,
                        Expanded(
                            flex: 2,
                            child: Input(
                                controller: ageController,
                                hintText: "20",
                                maxLength: 3,
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("Age",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                textInputAction: TextInputAction.next,
                                textAlign: true,
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        Expanded(
                            flex: 1,
                            child: Input(
                                controller: bpController,
                                hintText: "120",
                                textAlign: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    child: const Text("/",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20))),
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("BP",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                maxLines: 1,
                                autofocus: false)),
                        Expanded(
                            flex: 1,
                            child: Input(
                                controller: bphController,
                                hintText: "80",
                                textAlign: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 90,
                                    child: const Text("mmHg",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                maxLines: 1,
                                autofocus: false)),
                      ]),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Input(
                                inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^([0-9]|1[0-9]|20|\d*\.\d+|\d+)$'))
                            ],
                                controller: heightController,
                                maxLength: 2,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                textAlign: true,
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("Height",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                hintText: "6",
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: const Text("Feet",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        Expanded(
                            child: Input(
                                controller: weightController,
                                textInputAction: TextInputAction.next,
                                textAlign: true,
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("Weight",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                keyboardType: TextInputType.number,
                                hintText: "51",
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: const Text("Kg",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        Expanded(
                            child: Input(
                                controller: pulseController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                textAlign: true,
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("Pulse",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: const Text("bpm",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                hintText: "166",
                                maxLines: 1,
                                autofocus: false))
                      ]),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Input(
                                inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(?:10|\d(?:\.\d)?)$'))
                            ],
                                controller: temperatureController,
                                textInputAction: TextInputAction.next,
                                textAlign: true,
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))),
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: const Text("C",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                hintText: "98",
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        const Expanded(child: SizedBox()),
                        horizontalSpaceMedium,
                        const Expanded(child: SizedBox())
                      ]),
                  verticalSpaceLarge,
                  Row(children: [
                    Expanded(
                        child: Button(
                            isWhiteBg: true,
                            title: 'Cancel',
                            onPressed: () {
                              completer!.call(SheetResponse(confirmed: false));
                              viewModel.goBack();
                            },
                            height: 55)),
                    horizontalSpaceMedium,
                    Expanded(
                        child: Button(
                            onPressed: () {
                              viewModel.addNewUser(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  age: ageController.text,
                                  phoneNumber: phoneNumberController.text,
                                  height: heightController.text,
                                  weight: weightController.text,
                                  pulse: pulseController.text,
                                  bp: bpController.text,
                                  bph: bphController.text,
                                  temperature: temperatureController.text);
                            },
                            title: "Save",
                            height: 55))
                  ])
                ]))));
  }

  @override
  AddNewUserSheetModel viewModelBuilder(BuildContext context) =>
      AddNewUserSheetModel();

  @override
  void onDispose(AddNewUserSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
