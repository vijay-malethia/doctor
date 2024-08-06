import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/ui/common/index.dart';
import '/widgets/drawer_navigator.dart';
import 'doctor_profile_view.form.dart';
import 'doctor_profile_viewmodel.dart';

@FormView(fields: [
  //Edit doctorProfile controllers
  FormTextField(name: 'firstName', initialValue: ''),
  FormTextField(name: 'lastName', initialValue: ''),
  FormTextField(name: 'phoneNumber', initialValue: ''),
  FormTextField(name: 'Age', initialValue: ''),
  FormTextField(name: 'Speciality', initialValue: ''),
  FormTextField(name: 'Experience', initialValue: ''),
  //Edit clinic controllers
  FormTextField(name: 'clinicName', initialValue: ''),
  FormTextField(name: 'clinicLocation', initialValue: ''),
  FormTextField(name: 'number1', initialValue: ''),
  //Edit assitant controllers
  FormTextField(name: 'assistantFirstName', initialValue: ''),
  FormTextField(name: 'assistantLastName', initialValue: ''),
  FormTextField(name: 'assistantContactNumber', initialValue: ''),
  FormTextField(name: 'assistantSpecialization', initialValue: ''),
])
class DoctorProfileView extends StackedView<DoctorProfileViewModel>
    with $DoctorProfileView {
  const DoctorProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DoctorProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerNavigator(),
      appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.black)),
      drawerEnableOpenDragGesture: false,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      renderAppBar(context, viewModel),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: viewModel.scrollController,
                          child: Container(
                            color: primaryColor,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, bottom: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(37),
                                      topRight: Radius.circular(37))),
                              child: Column(
                                children: [
                                  const SizedBox(height: 100),
                                  Text(
                                      '${viewModel.doctor.firstName} ${viewModel.doctor.lastName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  const SizedBox(height: 15),
                                  Container(
                                      width: 282,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: primaryColor),
                                      padding: const EdgeInsets.all(14),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                viewModel.doctor.specialization,
                                                style: const TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 22)),
                                            SvgPicture.asset(
                                                Images().verifiedIcon,
                                                height: 23,
                                                width: 23),
                                          ])),
                                  verticalSpaceMedium,

                                  //Row1
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: textWithBgColor(
                                              context,
                                              "${viewModel.doctor.experience}+ Years Experience",
                                              12,
                                              28,
                                              bglightColor)),
                                      horizontalSpaceMedium,
                                      Expanded(
                                          flex: 2,
                                          child: textWithBgColor(
                                              context,
                                              "${viewModel.doctor.appointmentCount}+ Appointments Done",
                                              12,
                                              28,
                                              bglightColor)),
                                      horizontalSpaceMedium,
                                      Expanded(
                                          flex: 2,
                                          child: textWithBgColor(
                                              context,
                                              "${viewModel.doctor.experience}+ Years Experience",
                                              12,
                                              28,
                                              bglightColor)),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  //Row2
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      renderWorkingHours(context, viewModel),
                                      horizontalSpaceSmall,
                                      renderPersonalDetails(context, viewModel),
                                    ],
                                  ),
                                  verticalSpaceMedium,
                                  //Row3
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //clinic add or edit
                                      renderClinicsWidget(context, viewModel),
                                      horizontalSpaceSmall,
                                      //assistant add and edit
                                      renderAssistantAddAndEdit(
                                          viewModel, context)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (viewModel.showProfile)
                    Positioned(
                      top: -50,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        height: 222,
                        width: 222,
                        child: viewModel.doctor.base64Image == "null"
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
                                  child: Image.network(
                                    '$baseurl${viewModel.doctor.base64Image}',
                                    height: 134,
                                    width: 134,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

//assistant add and edit container
  Expanded renderAssistantAddAndEdit(
      DoctorProfileViewModel viewModel, BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bglightColor),
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Assistants:",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    InkWell(
                      onTap: () async {
                        await viewModel.assistantAdd(true);
                        viewModel.showEditAssitantBottomSheet(null,
                            assistantFirstName: assistantFirstNameController,
                            assistantLastName: assistantLastNameController,
                            assistantContactNumber:
                                assistantContactNumberController,
                            assistantSpecialization:
                                assistantSpecializationController);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.add_circle,
                              color: primaryColor, size: 21),
                          horizontalSpaceSmall,
                          Text(
                            "Add",
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                verticalSpaceMedium,
                if (viewModel.assitantDetails != null)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: viewModel.assitantDetails.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await viewModel.assistantAdd(false);
                                  viewModel.showEditAssitantBottomSheet(index,
                                      assistantFirstName:
                                          assistantFirstNameController,
                                      assistantLastName:
                                          assistantLastNameController,
                                      assistantContactNumber:
                                          assistantContactNumberController,
                                      assistantSpecialization:
                                          assistantSpecializationController);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      Images().editIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    horizontalSpaceSmall,
                                    Text(
                                      "Edit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )
                                  ],
                                ),
                              ),
                              SvgPicture.asset(Images().patientLogoGreen),
                              verticalSpaceSmall,
                              Text(
                                  '${viewModel.assitantDetails[index]['firstName']} ${viewModel.assitantDetails[index]['lastName']}',

                                  // "Nurendar Bishnoi",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              verticalSpaceSmall,
                              Text(
                                  viewModel.assitantDetails[index]
                                          ['specialization'] ??
                                      "",
                                  style: Theme.of(context).textTheme.bodySmall),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(Images().callIcon),
                                      horizontalSpaceSmall,
                                      Text('Call',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall)
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Images().whatsapp),
                                      horizontalSpaceSmall,
                                      Text('Message',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall)
                                    ],
                                  )
                                ],
                              ),
                              verticalSpaceMedium,
                              Container(
                                height: 35,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: primaryColorLight),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.notifications_active,
                                        color: primaryColor),
                                    horizontalSpaceSmall,
                                    Text('Send Reminder',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
              ],
            )));
  }

//clinic add and edit container
  Expanded renderClinicsWidget(
      BuildContext context, DoctorProfileViewModel viewModel) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bglightColor,
        ),
        padding:
            const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Clinics:",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                InkWell(
                  onTap: () async {
                    await viewModel.changeEdit(false);
                    viewModel.showEditClinicBottomSheet(null,
                        clinicName: clinicNameController,
                        clinicLocation: clinicLocationController,
                        contactNumber: number1Controller);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add_circle,
                          color: primaryColor, size: 21),
                      horizontalSpaceSmall,
                      Text(
                        "Add",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                )
              ],
            ),
            verticalSpaceMedium,
            if (viewModel.clinicDetails != null)
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.clinicDetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: viewModel.clinicDetails[index]
                                          ['clinicProfile'] !=
                                      null
                                  ? Image.network(
                                      "$baseurl${viewModel.clinicDetails[index]['clinicProfile']}",
                                      height: 157,
                                      width: 157,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      Images().clinicImage,
                                      height: 157,
                                      width: 157,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            horizontalSpaceSmall,
                            horizontalSpaceTiny,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpaceSmall,
                                Text(
                                  viewModel.clinicDetails[index]['clinicName'],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                verticalSpaceSmall,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.location_on_outlined,
                                        size: 21, color: primaryColor),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Text(
                                        viewModel.clinicDetails[index]
                                            ['address'],
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpaceSmall,
                                verticalSpaceTiny,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                      "Emergency Contact: ${viewModel.clinicDetails[index]['contactNumber']}",
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                )
                              ],
                            ),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await viewModel.changeEdit(true);
                                  viewModel.showEditClinicBottomSheet(index,
                                      clinicName: clinicNameController,
                                      clinicLocation: clinicLocationController,
                                      contactNumber: number1Controller);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Images().editIcon,
                                        height: 24, width: 24),
                                    horizontalSpaceTiny,
                                    Text("Edit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
          ],
        ),
      ),
    );
  }

//doctor personal deatails container
  Expanded renderPersonalDetails(
      BuildContext context, DoctorProfileViewModel viewModel) {
    return Expanded(
        flex: 2,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bglightColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Personal Details:",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              verticalSpaceMedium,
              Row(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Text(
                        "Age:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        viewModel.doctor.age,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 18,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        viewModel.doctor.gender,
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 14, 14, 15),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
              spacedDivider,
              Row(
                children: [
                  SvgPicture.asset(Images().callIcon),
                  horizontalSpaceSmall,
                  Text(
                    '+91 ${viewModel.doctor.phoneNumber}',
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        color: Color.fromARGB(255, 14, 14, 15),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              // spacedDivider,
              // Row(
              //   children: [
              //     const Icon(Icons.mail,
              //         size: 21,
              //         color: primaryColor),
              //     horizontalSpaceSmall,
              //     Expanded(
              //       child: Text(
              //           "shalendraarora058@gmail.com",
              //           // softWrap: true,
              //           overflow: TextOverflow
              //               .ellipsis,
              //           maxLines: 1,
              //           style: Theme.of(context)
              //               .textTheme
              //               .bodyMedium),
              //     )
              //   ],
              // ),
            ],
          ),
        ));
  }

//Workig hours container with days details
  Expanded renderWorkingHours(
      BuildContext context, DoctorProfileViewModel viewModel) {
    return Expanded(
        flex: 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: bglightColor),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Working Hours:",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),
                  InkWell(
                    onTap: () {
                      viewModel.showEditworkignHoursBottomSheet();
                    },
                    child: Row(children: [
                      SvgPicture.asset(Images().editIcon,
                          height: 24, width: 24),
                      horizontalSpaceSmall,
                      Text("Edit",
                          style: Theme.of(context).textTheme.labelMedium)
                    ]),
                  )
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: fromAndToTime(
                          '${viewModel.doctor.doctorScheduleDetails?['breakFrom']}',
                          context,
                          '${viewModel.doctor.doctorScheduleDetails?['breakTo']}')),
                  horizontalSpaceMedium,
                  Expanded(
                      flex: 2,
                      child: fromAndToTime(
                          '${viewModel.doctor.doctorScheduleDetails?['secondBreakFrom']}',
                          context,
                          '${viewModel.doctor.doctorScheduleDetails?['secondBreakTo']}')),
                ],
              ),
              if (viewModel.doctor.doctorScheduleDetails['monday'] == true)
                renderDayTime(
                  context,
                  'Monday',
                  '${viewModel.doctor.doctorScheduleDetails?['mondayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['mondayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['tuesday'] == true)
                renderDayTime(
                  context,
                  'Tuesday',
                  '${viewModel.doctor.doctorScheduleDetails?['tuesdayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['tusedayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['wednesday'] == true)
                renderDayTime(
                  context,
                  'Wednesday',
                  '${viewModel.doctor.doctorScheduleDetails?['wednesdayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['wednesdayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['thursday'] == true)
                renderDayTime(
                  context,
                  'Thursday',
                  '${viewModel.doctor.doctorScheduleDetails?['thursdayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['thursdayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['friday'] == true)
                renderDayTime(
                  context,
                  'Friday',
                  '${viewModel.doctor.doctorScheduleDetails?['fridayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['fridayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['saturday'] == true)
                renderDayTime(
                  context,
                  'Saturday',
                  '${viewModel.doctor.doctorScheduleDetails?['saturdayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['saturdayTo']}',
                ),
              if (viewModel.doctor.doctorScheduleDetails['sunday'] == true)
                renderDayTime(
                  context,
                  'Sunday',
                  '${viewModel.doctor.doctorScheduleDetails?['sundayFrom']}',
                  '${viewModel.doctor.doctorScheduleDetails?['sundayTo']}',
                ),
            ],
          ),
        ));
  }

//Days with from and to time
  Column renderDayTime(BuildContext context, dayName, fromTime, toTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text("$dayName:",
            style: const TextStyle(
                fontFamily: 'Lato',
                color: Color.fromARGB(255, 14, 14, 15),
                fontWeight: FontWeight.w700,
                fontSize: 18)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: fromAndToTime(fromTime, context, toTime),
            ),
            Expanded(flex: 2, child: Container())
          ],
        )
      ],
    );
  }

//combine from and to date of days
  Container fromAndToTime(
      String fromTime, BuildContext context, String toTime) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 2),
        alignment: Alignment.center,
        child: Text.rich(TextSpan(text: '', children: [
          if (fromTime != 'null' && fromTime.trim().isNotEmpty)
            TextSpan(
                text: fromTime, style: Theme.of(context).textTheme.labelMedium),
          if (fromTime != 'null' &&
              fromTime.trim().isNotEmpty &&
              toTime != 'null' &&
              toTime.trim().isNotEmpty)
            TextSpan(
                text: ' to ', style: Theme.of(context).textTheme.labelMedium),
          if (toTime != 'null' && toTime.trim().isNotEmpty)
            TextSpan(
                text: toTime, style: Theme.of(context).textTheme.labelMedium),
        ])));
  }

//container with text
  Container textWithBgColor(BuildContext context, String text, double radius,
      double verticalPadding, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: bgColor),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 2),
      alignment: Alignment.center,
      child: Text(text,
          style: bgColor == bglightColor
              ? const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 14, 14, 15),
                )
              : Theme.of(context).textTheme.labelMedium),
    );
  }

//custom app bar
  Container renderAppBar(
      BuildContext context, DoctorProfileViewModel viewModel) {
    return Container(
      height: 75,
      width: double.infinity,
      color: primaryColor,
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                    Images().menuIcon,
                    height: 37,
                    width: 37,
                  ),
                );
              }),
              horizontalSpaceMedium,
              Text('My Profile',
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          InkWell(
            onTap: () {
              viewModel.showEditDoctorProfileBottomSheet(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneController: phoneNumberController,
                  ageController: ageController,
                  experienceController: experienceController,
                  specialityController: specialityController);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  Images().editIcon,
                  height: 28,
                  width: 28,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 18),
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 23.59,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DoctorProfileViewModel()..initFunction();
  @override
  void onViewModelReady(DoctorProfileViewModel viewModel) {
    viewModel.scrollController.addListener(viewModel.onScroll);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(DoctorProfileViewModel viewModel) {
    super.onDispose(viewModel);
    viewModel.scrollController.dispose();
  }
}
