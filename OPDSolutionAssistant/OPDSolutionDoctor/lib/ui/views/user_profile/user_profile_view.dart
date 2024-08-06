import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opd_doctor/ui/common/index.dart';
import 'package:opd_doctor/widgets/button.dart';
import 'package:opd_doctor/widgets/drawer_navigator.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  final List userList;
  final int index;
  const UserProfileView({required this.index, required this.userList, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserProfileViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: DrawerNavigator(),
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 5))
              : Stack(alignment: Alignment.center, children: [
                  Column(children: [
                    renderAppBar(context, viewModel), // Render App Bar
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
                                  child: Column(children: [
                                    const SizedBox(height: 100),
                                    Text(
                                        "${viewModel.userList[0].firstName!} ${viewModel.userList[0].lastName!}",
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 15),
                                    bookConsultation(viewModel,
                                        context), // Book Consultation
                                    verticalSpaceMedium,
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    vitals(viewModel,
                                                        context), // Render Vitals Container
                                                    verticalSpaceSmall,
                                                    pastsVisits(
                                                        viewModel) // Render Pasts Visits container
                                                  ])),
                                          horizontalSpaceSmall,
                                          Expanded(
                                              flex: 1,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    personalDetails(context,
                                                        viewModel) // Render Personal Details container
                                                  ]))
                                        ]),
                                    const SizedBox(height: 70)
                                  ])),
                            )))
                  ]),
                  if (viewModel.showProfile) profilePic(viewModel)
                ])),
    );
  }

/////////////////////////////////////////////////////////////////////Booking consultation////////////////////////////////////////////////////////////////////////////
  Widget bookConsultation(UserProfileViewModel viewModel, context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .23,
      child: Button(
          onPressed: () {
            viewModel.bookConsultation();
          },
          title: "Book Consultation",
          height: 57),
    );
  }

/////////////////////////////////////////////////////////////////////// profile pic circle/////////////////////////////////////////////////////////////////////
  Positioned profilePic(UserProfileViewModel viewModel) {
    return Positioned(
      top: -50,
      child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          height: 222,
          width: 222,
          child: viewModel.userList[0].base64Image == 'null'
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SvgPicture.asset(Images().patientLogoGreen,
                      height: 134, width: 134))
              : ClipOval(
                  child: CircleAvatar(
                      radius: 67,
                      child: Image.network(
                          '$baseurl${viewModel.userList[0].base64Image}',
                          height: 134,
                          width: 134,
                          fit: BoxFit.cover)))),
    );
  }

////////////////////////////////////////////////////////////////personal details///////////////////////////////////////////////////////////////////////////////
  Container personalDetails(
      BuildContext context, UserProfileViewModel viewModel) {
    return Container(
        decoration: const BoxDecoration(
            color: bglightColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Personal Details:",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: primaryColor))),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                    child: Text("Age:",
                        style: Theme.of(context).textTheme.bodyMedium)),
                Expanded(
                    child: Text(viewModel.userList[0].age.toString(),
                        style: Theme.of(context).textTheme.bodyMedium))
              ]),
              verticalSpaceMedium,
              const Divider(color: Colors.grey, height: 10),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                    child: Text("Gender:",
                        style: Theme.of(context).textTheme.bodyMedium)),
                Expanded(
                    child: Text(viewModel.userList[0].gender.toString(),
                        style: Theme.of(context).textTheme.bodyMedium))
              ]),
              verticalSpaceMedium,
              const Divider(color: Colors.grey, height: 10),
              verticalSpaceMedium,
              Row(children: [
                const Icon(Icons.phone_in_talk, color: primaryColor, size: 21),
                horizontalSpaceSmall,
                Text(viewModel.userList[0].phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium)
              ]),
              verticalSpaceSmall
            ])));
  }

///////////////////////////////////////////////////////////////////////pasts visits////////////////////////////////////////////////////////////////////////////////////
  Container pastsVisits(UserProfileViewModel viewModel) {
    return Container(
        decoration: const BoxDecoration(
            color: bglightColor,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                    child: Text("Past Visits:",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left))
              ]),
              verticalSpaceSmall,
              visitsList(viewModel)
            ])));
  }

//////////////////////////////////////////////////////////////////////Visits List///////////////////////////////////////////////////////////////////////////////////
  SizedBox visitsList(UserProfileViewModel viewModel) {
    return SizedBox(
        height: 118,
        child: ListView.builder(
            itemCount: viewModel.dateGroups.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String year = viewModel.dateGroups.keys.elementAt(index);
              List datesInYear = viewModel.dateGroups[year]!;
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 33,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: primaryColorLight),
                        margin: EdgeInsets.only(
                            right: 10, left: index == 0 ? 0 : 10),
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(year,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                    color: primaryColor)))),
                    ...datesInYear.asMap().entries.map((data) => InkWell(
                        onTap: () {},
                        child: Container(
                            width: 63,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2.0,
                                      spreadRadius: 1,
                                      offset: const Offset(2, 2))
                                ]),
                            child: Column(children: [
                              Container(
                                  width: double.infinity,
                                  height: 46,
                                  decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Text(
                                      data.value['appointmentDate']
                                          .substring(8, 10),
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700))),
                              const SizedBox(height: 5),
                              Text(
                                  viewModel.formattedMonth(
                                      index, viewModel.appointment),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))
                            ]))))
                  ]);
            }));
  }

/////////////////////////////////////////////////////////////////////// Vitals Container///////////////////////////////////////////////////////////////////////////////
  Container vitals(UserProfileViewModel viewModel, BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: bglightColor,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Expanded(
                    child: Text("Vitals:",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left)),
                InkWell(
                    onTap: () {
                      viewModel.editBottomSheet(
                          viewModel.userList[0], index, userList);
                    },
                    child: Row(children: [
                      SvgPicture.asset(Images().editIcon,
                          height: 24, width: 24),
                      horizontalSpaceSmall,
                      const Text("Edit",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700))
                    ]))
              ]),
              verticalSpaceTiny,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                renderVitalChip(
                    Theme.of(context).textTheme, 'Height', "", viewModel),
                renderVitalChip(
                    Theme.of(context).textTheme, 'Weight', "", viewModel),
                renderVitalChip(
                    Theme.of(context).textTheme, 'Temperature', "", viewModel)
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                renderVitalChip(
                    Theme.of(context).textTheme, 'Pulse', "", viewModel),
                const Expanded(child: SizedBox()),
                renderVitalChip(
                    Theme.of(context).textTheme, 'BP', "", viewModel),
                horizontalSpaceLarge,
                const Expanded(child: SizedBox()),
                const Expanded(child: SizedBox()),
              ])
            ])));
  }

  Container renderVitalChip(
      TextTheme theme, name, value, UserProfileViewModel viewModel) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(name, style: theme.labelSmall),
          horizontalSpaceSmall,
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(16)),
              alignment: Alignment.center,
              child: Text(
                  '$value ${name == 'Height' ? "${viewModel.userList[0].height} inch" : name == 'Weight' ? "${viewModel.userList[0].weight} kg" : name == 'Pulse' ? "${viewModel.userList[0].pulse} / min" : name == 'BP' ? '${viewModel.userList[0].bp} / ${viewModel.userList[0].bph}' : "${viewModel.userList[0].temperature} °F"}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700)))
        ]));
  }

//////////////////////////////////////////////////////////////////////////App Bar///////////////////////////////////////////////////////////////////////////////////
  renderAppBar(BuildContext context, UserProfileViewModel viewModel) {
    return Container(
        height: 85,
        width: double.infinity,
        color: primaryColor,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(children: [
          Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SvgPicture.asset(Images().menuIcon)));
          }),
          horizontalSpaceMedium,
          Expanded(
              child: Text("User Profile",
                  style: Theme.of(context).textTheme.headlineMedium)),
          InkWell(
              onTap: () {
                viewModel.editProfileBottomSheet(
                    viewModel.userList[0], index, userList);
              },
              child: Row(children: [
                SvgPicture.asset(Images().editIcon,
                    height: 24, width: 24, color: Colors.white),
                horizontalSpaceSmall,
                const Text("Edit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))
              ]))
        ]));
  }

  @override
  UserProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserProfileViewModel()..getUserDetails(userList[index]["id"]);

  @override
  void onViewModelReady(UserProfileViewModel viewModel) {
    viewModel.scrollController.addListener(viewModel.onScroll);
    super.onViewModelReady(viewModel);
  }
}
