import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_vitals/edit_vitals_sheet.form.dart';
import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/common/ui_helpers.dart';
import 'package:opd_doctor/widgets/button.dart';
import 'package:opd_doctor/widgets/input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import 'edit_vitals_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'bp2'),
  FormTextField(name: 'temperature'),
])
class EditVitalsSheet extends StackedView<EditVitalsSheetModel>
    with $EditVitalsSheet {
  final _navigationService = locator<NavigationService>();
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  EditVitalsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditVitalsSheetModel viewModel,
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
                  const Text("Edit Vitals",
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
                                inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(?:10|\d(?:\.\d)?)$'))
                            ],
                                controller: heightController,
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
                                hintText: "10",
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: const Text("Feet",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18))),
                                hintstyle: const TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
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
                                hintstyle: const TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
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
                                hintstyle: const TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                autofocus: false))
                      ]),
                  verticalSpaceMedium,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Input(
                                controller: bpController,
                                hintText: "120",
                                textAlign: true,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                trailing: Container(
                                    alignment: Alignment.center,
                                    width: 10,
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
                            flex: 2,
                            child: Input(
                                controller: bp2Controller,
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
                        horizontalSpaceMedium,
                        Expanded(
                            flex: 4,
                            child: Input(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]{1,50}(\.[0-9]{0,2})?$'))
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
                                hintstyle: const TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                maxLines: 1,
                                autofocus: false)),
                        horizontalSpaceMedium,
                        const Expanded(flex: 4, child: SizedBox())
                      ]),
                  verticalSpaceLarge,
                  Row(children: [
                    Expanded(
                        child: Button(
                            isWhiteBg: true,
                            title: 'Cancel',
                            onPressed: () {
                              _navigationService.back();
                            },
                            height: 55)),
                    horizontalSpaceMedium,
                    Expanded(
                        child: Button(
                            onPressed: () {
                              viewModel.updateUser(
                                  id: request.data[0].id,
                                  index: request.data[1],
                                  userList: request.data[2],
                                  height: heightController.text,
                                  weight: weightController.text,
                                  pulse: pulseController.text,
                                  bp: bpController.text,
                                  bph: bp2Controller.text,
                                  temp: temperatureController.text);
                            },
                            title: "Update",
                            height: 55))
                  ])
                ]))));
  }

  @override
  EditVitalsSheetModel viewModelBuilder(BuildContext context) =>
      EditVitalsSheetModel()
        ..setControllersValue(
            heightController,
            weightController,
            pulseController,
            bpController,
            bp2Controller,
            temperatureController,
            request.data[0].height.toString(),
            request.data[0].weight.toString(),
            request.data[0].pulse.toString(),
            request.data[0].bp.toString(),
            request.data[0].bph.toString(),
            request.data[0].temperature.toString());
}
