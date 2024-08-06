import 'package:doc_ease/ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/ui/common/index.dart';
import '/ui/common/images.dart';
import '/ui/views/appointment_details/appointment_details_view.form.dart';
import 'appointment_details_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'gender'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'bph'),
  FormTextField(name: 'temperature'),
])
class AppointmentDetailsView extends StackedView<AppointmentDetailsViewModel>
    with $AppointmentDetailsView {
  final String? id;
  final String? screenType;
  final String? appointmentDate;
  final String? appointmentId;

  const AppointmentDetailsView(
      {this.id,
      this.screenType,
      this.appointmentDate,
      this.appointmentId,
      Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppointmentDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: primaryColor),
          elevation: 0,
          centerTitle: false,
          title: const Text('Appointment Details',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: 'Lato')),
          leadingWidth: 30,
          leading: IconButton(
              padding: const EdgeInsets.only(left: 16),
              onPressed: () {
                screenType != 'assistantDetail'
                    ? viewModel.goToBack()
                    : viewModel.goHomeView();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              )),
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: primaryColor,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(37),
                          topRight: Radius.circular(37))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        //user picture
                        ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: SvgPicture.asset(Images().patientLogoGreen,
                                height: 82, width: 82)),
                        verticalSpaceSmall,
                        Text(viewModel.patientList[0].username,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                fontFamily: 'Lato')),
                        const SizedBox(height: 20),
                        //appointmente date
                        renderAppointmentDate(viewModel, context),
                        const SizedBox(height: 20),
                        //personal details conatiner
                        renderPersonalDetails(viewModel),
                        verticalSpaceMedium,
                        //vitals container
                        renderVitals(viewModel),
                        verticalSpaceMedium,
                        screenType == "assistantDetail"
                            ?
                            //cancel Button
                            SizedBox(
                                height: 55,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        minimumSize:
                                            const Size(double.infinity, 55),
                                        disabledBackgroundColor:
                                            const Color.fromARGB(
                                                255, 181, 216, 244),
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9))),
                                    onPressed: () {
                                      viewModel.cancelAppointment(context, id);
                                    },
                                    child: const Text(
                                      'Cancel Appointment',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Lato",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )))
                            : Button(
                                onPressed: () {
                                  viewModel.bookConsultation();
                                },
                                title: 'Book Appointment',
                                height: 55),
                        verticalSpaceMedium
                      ],
                    ),
                  ),
                ),
              ));
  }

//container with appointment date
  renderAppointmentDate(
      AppointmentDetailsViewModel viewModel, BuildContext context) {
    return InkWell(
      onTap: () {
        viewModel.selectAppointmentDate(
            context,
            screenType!,
            screenType == "assistantDetail"
                ? DateTime.parse(appointmentDate!)
                : DateTime.now());
      },
      child: Container(
          height: 43,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: bglightColor,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(Images().calenderIcon, height: 18, width: 18),
            horizontalSpaceSmall,
            Text(
                screenType == 'assistantDetail'
                    ? appointmentDate!
                    : viewModel.defaultAppointmentDate
                        .toIso8601String()
                        .split("T")
                        .first,
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600))
          ])),
    );
  }

//vitals container
  Container renderVitals(AppointmentDetailsViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bglightColor),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Vitals:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  viewModel.showBottomSheet(id!);
                },
                child: Row(children: [
                  SvgPicture.asset(Images().editIcon, height: 18, width: 18),
                  horizontalSpaceSmall,
                  const Text("Edit",
                      style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ]),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              renderVitalChip('Height', viewModel.patientList[0].height),
              renderVitalChip('Pulse', viewModel.patientList[0].pulse),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              renderVitalChip('Weight', viewModel.patientList[0].weight),
              renderVitalChip('BP',
                  '${viewModel.patientList[0].bloodPressure}/${viewModel.patientList[0].bloodPressureHigh}'),
            ],
          ),
          Row(
            children: [
              renderVitalChip(
                  'Temperature', viewModel.patientList[0].temperature),
            ],
          ),
        ],
      ),
    );
  }

//personal details
  Container renderPersonalDetails(AppointmentDetailsViewModel viewModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bglightColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Personal Details:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  viewModel.showEditUserBottomSheet(id!);
                },
                child: Row(children: [
                  SvgPicture.asset(Images().editIcon, height: 18, width: 18),
                  horizontalSpaceSmall,
                  const Text("Edit",
                      style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ]),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Text(
                    "Age:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    viewModel.patientList[0].age.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          spacedDivider,
          Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Text(
                    "Gender:",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    viewModel.patientList[0].gender,
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          spacedDivider,
          Row(
            children: [
              SvgPicture.asset(Images().callIcon),
              horizontalSpaceMedium,
              Text(
                '+91 ${viewModel.patientList[0].phone}',
                style: const TextStyle(
                    fontFamily: 'Lato',
                    color: Color.fromARGB(255, 14, 14, 15),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }

//vital with value
  Container renderVitalChip(name, value) {
    return Container(
      height: 43,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lato',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 10),
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(16)),
              alignment: Alignment.center,
              child: Text(
                  '$value ${name == 'Height' ? 'Feet' : name == 'Weight' ? 'kg' : name == 'Pulse' ? '/min' : name == 'BP' ? '' : '°F'}',
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontFamily: 'Lato',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }

  @override
  AppointmentDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppointmentDetailsViewModel()
        ..getAppointmentDetailsById(
            id!, screenType!, appointmentId == null ? "" : appointmentId!,
            firstName: firstNameController,
            lastName: lastNameController,
            age: ageController,
            phoneNumber: phoneNumberController,
            height: heightController,
            weight: weightController,
            pulse: pulseController,
            bp: bpController,
            bph: bphController,
            temp: temperatureController);

  // @override
  // void onDispose(AppointmentDetailsViewModel viewModel) {
  //   super.onDispose(viewModel);
  //   // disposeForm();
  // }
}
