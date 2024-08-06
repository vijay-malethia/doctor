import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opdsolutionui/ui/common/widgets/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/ui/common/index.dart';
import '/ui/common/widgets/bottom_bar.dart';
import '/ui/views/profile/profile_view.form.dart';
import 'profile_viewmodel.dart';

@FormView(fields: [
  //edit profile controllers
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'phoneNumber'),
  //edit vitals controllers
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'bph'),
  FormTextField(name: 'temperature'),
//add new user controllers
  FormTextField(name: 'NewUserfirstName'),
  FormTextField(name: 'NewUserlastName'),
  FormTextField(name: 'NewUserage'),
  FormTextField(name: 'NewUserphoneNumber'),
])
class ProfileView extends StackedView<ProfileViewModel> with $ProfileView {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: primaryColor),
            elevation: 0,
            toolbarHeight: 0),
        body: viewModel.isBusy
            ? const Loader()
            : Column(children: [
                renderAppBar(context, viewModel),
                Expanded(
                    child: Container(
                  color: primaryColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          verticalSpaceMedium,
                          //user picture
                          renderPatientProfilePic(viewModel, child),
                          //patient name
                          Text(viewModel.patientName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),

                          verticalSpaceSmall,
                          verticalSpaceTiny,
                          //personal Details
                          renderPersonalDetails(viewModel),
                          verticalSpaceSmall,
                          //vitals details
                          renderVitals(viewModel),
                          verticalSpaceMedium,
                          //logout button
                          renderButton(true, 'Log Out', () {
                            viewModel.logOut();
                          }),
                          verticalSpaceMedium,
                          if (viewModel.defaultUser == false) ...[
                            renderButton(false, 'Delete Profile', () {
                              viewModel.showDialog();
                            }),
                            verticalSpaceMedium
                          ]
                        ])),
                  ),
                ))
              ]),
        bottomNavigationBar: BottomNavigation(currentIndex: 2));
  }

  SizedBox renderButton(
      bool isLogout, String title, GestureTapCallback? onPressed) {
    return SizedBox(
        height: 55,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 55),
              disabledBackgroundColor: const Color.fromARGB(255, 181, 216, 244),
              backgroundColor: isLogout ? Colors.red : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: const BorderSide(color: Colors.red)),
            ),
            onPressed: onPressed,
            child: Text(title,
                style: TextStyle(
                    color: isLogout ? Colors.white : Colors.red,
                    fontFamily: "Lato",
                    fontSize: 18,
                    fontWeight: FontWeight.w700))));
  }

//patient picture
  Container renderPatientProfilePic(ProfileViewModel viewModel, Widget? child) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: viewModel.base64Image == 'http://103.30.75.131:444null'
            ? ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SvgPicture.asset(Images().userLogoGreen,
                    height: 82, width: 82))
            : ClipOval(
                child: Image.network(viewModel.base64Image,
                    height: 82,
                    width: 82,
                    fit: BoxFit.cover,
                    key: ValueKey(viewModel.base64Image),
                    loadingBuilder: (ctx, child, loadingProgress) {
                imageCache.clear();
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CircularProgressIndicator());
              })));
  }

//custom app bar
  Container renderAppBar(BuildContext context, ProfileViewModel viewModel) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 14, right: 14),
        color: primaryColor,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
              onTap: () {
                viewModel.showSwitchProfileBottomSheet();
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(viewModel.patientName,
                    style: Theme.of(context).textTheme.bodyLarge),
                const Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 2),
                    child: Icon(Icons.expand_more_outlined,
                        size: 22, color: Colors.white))
              ])),
          InkWell(
              onTap: () {
                viewModel.showEditProfileBottomSheet(firstNameController,
                    lastNameController, phoneNumberController, ageController);
              },
              child: Row(children: [
                SvgPicture.asset(
                  Images().editIcon,
                  height: 22,
                  width: 22,
                  color: Colors.white,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Edit",
                        style: Theme.of(context).textTheme.bodyLarge))
              ]))
        ]));
  }

  //personal details
  Container renderPersonalDetails(ProfileViewModel viewModel) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: bglightColor),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Personal Details :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              Row(children: [
                const Expanded(
                    flex: 1,
                    child: Text("Age:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500))),
                Expanded(
                    flex: 1,
                    child: Text(viewModel.age,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500)))
              ]),
              spacedDivider,
              Row(children: [
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
                    child: Text(viewModel.gender,
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)))
              ]),
              spacedDivider,
              Row(children: [
                SvgPicture.asset(Images().callIcon),
                horizontalSpaceMedium,
                Text('+91 ${viewModel.phoneNumber}',
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
              ])
            ]));
  }

  //vitals container
  Container renderVitals(ProfileViewModel viewModel) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: bglightColor),
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Vitals :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'Lato',
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
            InkWell(
                onTap: () {
                  viewModel.showEditVitalsBottomSheet(
                      height: heightController,
                      weight: weightController,
                      bp: bpController,
                      bpH: bphController,
                      pulse: pulseController,
                      temp: temperatureController);
                },
                child: Row(children: [
                  SvgPicture.asset(Images().editIcon, height: 18, width: 18),
                  horizontalSpaceSmall,
                  const Text("Edit",
                      style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
                ]))
          ]),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            renderVitalChip(
                'Height', viewModel.patientDetails?['height'] ?? ''),
            renderVitalChip('Pulse', viewModel.patientDetails?['pluse'] ?? '')
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            renderVitalChip(
                'Weight', viewModel.patientDetails?['weight'] ?? ''),
            renderVitalChip('BP',
                '${viewModel.patientDetails?['bloodpressure'] ?? ''}/${viewModel.patientDetails?['bloodpressureHigh'] ?? ''}')
          ]),
          Row(children: [
            renderVitalChip(
                'Temperature', viewModel.patientDetails?['temperature'] ?? '')
          ])
        ]));
  }

  //vital with value
  Container renderVitalChip(name, value) {
    return Container(
        height: 43,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11), color: Colors.white),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lato',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 10),
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(16)),
              alignment: Alignment.center,
              child: Text(
                  '$value ${name == 'Height' ? 'feet' : name == 'Weight' ? 'kg' : name == 'Pulse' ? '/min' : name == 'BP' ? '' : '°F'}',
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontFamily: 'Lato',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700)))
        ]));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel()..getId();
  // ..getPatientsList();
}
