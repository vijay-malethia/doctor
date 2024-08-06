import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/app_colors.dart';
import '/ui/views/home/home_viewmodel.dart';
import '/ui/widgets/index.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/views/home/home_view.form.dart';

class AddUser extends StackedView<HomeViewModel> with $HomeView {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const AddUser({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.80,
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
                    child: Text("Add User",
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
                    prefixIcon: const Icon(Icons.person,
                        color: primaryColor, size: 24)),
                verticalSpaceMedium,
                Input(
                    controller: lastNameController,
                    hintText: "Last Name",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    autofocus: false,
                    prefixIcon: const Icon(Icons.person,
                        color: primaryColor, size: 24)),
                verticalSpaceMedium,
                Input(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: mobileNumberController,
                    hintText: "+91 ----------",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    maxLines: 1,
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
                    initValue: viewModel.genderInitVale,
                    iconColor: Colors.grey,
                    onChanged: viewModel.changeGender),
                verticalSpaceMedium,
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Add Vitals",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                            fontFamily: 'Lato'))),
                verticalSpaceMedium,
                Input(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^([0-9]|1[0-9]|20)$'))
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
                    autofocus: false),
                verticalSpaceMedium,
                Input(
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
                    autofocus: false),
                verticalSpaceMedium,
                Input(
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
                    autofocus: false),
                verticalSpaceMedium,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Input(
                              controller: bpController,
                              hintText: '120',
                              textAlign: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
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
                          child: Input(
                              controller: bphController,
                              hintText: "80",
                              textAlign: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              prefixIcon: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text("/",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700))),
                              trailing: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  child: const Text("mmHg",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18))),
                              maxLines: 1,
                              autofocus: false))
                    ]),
                verticalSpaceMedium,
                Input(
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp(r'^(?:10|\d(?:\.\d)?)$'))
                    // ],
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
                        child: const Text("F",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18))),
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    hintText: "98",
                    maxLines: 1,
                    autofocus: false),
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
                            viewModel.addUser(
                                cntx: context,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                age: ageController.text,
                                phoneNumber: mobileNumberController.text,
                                height: heightController.text,
                                weight: weightController.text,
                                pulse: pulseController.text,
                                bp: bpController.text,
                                bph: bphController.text,
                                temperature: temperatureController.text);
                          },
                          title: "Add",
                          height: 55))
                ])
              ]))),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
