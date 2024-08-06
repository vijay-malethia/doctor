import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/app_colors.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/input.dart';
import '/ui/views/profile/profile_view.form.dart';
import '/ui/views/profile/profile_viewmodel.dart';

class EditPatienVitalsSheet extends StackedView<ProfileViewModel>
    with $ProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditPatienVitalsSheet({
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
        height: MediaQuery.of(context).size.height * 0.68,
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
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Edit Vitals",
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
                  maxLength: 3,
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
                  maxLength: 3,
                  autofocus: false),
              verticalSpaceMedium,
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                    child: Input(
                        controller: bpController,
                        hintText: '120',
                        textAlign: true,
                        maxLength: 3,
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
                            alignment: Alignment.centerLeft,
                            width: 60,
                            child: const Text("mmHg",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18))),
                        maxLines: 1,
                        maxLength: 3,
                        autofocus: false))
              ]),
              verticalSpaceMedium,
              Input(
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
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  hintText: "98",
                  maxLines: 1,
                  autofocus: false),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                    child: Button(
                        isWhiteBg: true,
                        border: true,
                        title: 'Cancel',
                        onPressed: () {
                          completer!.call(SheetResponse(confirmed: false));
                        },
                        height: 55)),
                horizontalSpaceSmall,
                Expanded(
                    child: Button(
                        onPressed: () async {
                          await viewModel.updateVitals(
                              height: heightController.text.trim().isEmpty
                                  ? '0'
                                  : heightController.text,
                              weight: weightController.text.trim().isEmpty
                                  ? '0'
                                  : weightController.text,
                              pulse: pulseController.text.trim().isEmpty
                                  ? '0'
                                  : pulseController.text,
                              bp: bpController.text.trim().isEmpty
                                  ? '0'
                                  : bpController.text,
                              bph: bphController.text.trim().isEmpty
                                  ? '0'
                                  : bphController.text,
                              temp: temperatureController.text.trim().isEmpty
                                  ? '0'
                                  : temperatureController.text);
                          completer!.call(SheetResponse(confirmed: true));
                        },
                        title: "Update",
                        height: 55))
              ])
            ])));
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
