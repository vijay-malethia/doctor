import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/index.dart';
import '/ui/views/profile/profile_view.form.dart';
import '/ui/views/profile/profile_viewmodel.dart';

class SwitchUserSheet extends StackedView<ProfileViewModel> with $ProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SwitchUserSheet({
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
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
            child: Column(children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Switch Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          fontFamily: 'Lato')))),
          verticalSpaceMedium,
          ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
                      contentPadding: const EdgeInsets.only(left: 1, right: 10),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: SvgPicture.asset(
                              viewModel.logoList[Random().nextInt(3)],
                              height: 50,
                              width: 50)),
                      title: Text(
                          '${patients[index]['firstName']} ${patients[index]['lastName']}',
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 15, 14, 14))),
                      trailing: patientId != patients[index]['id']
                          ? SvgPicture.asset(Images().switchIcon,
                              height: 24, width: 24)
                          : null,
                      onTap: () async {
                        await viewModel.getProfileById(patients[index]['id']);
                        completer!.call(SheetResponse(confirmed: true));
                      }),
                  spacedDivider
                ]);
              }),
          InkWell(
              onTap: () async {
                viewModel
                    .showAddNewUserBottomSheet(newUserphoneNumberController);
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: SvgPicture.asset(Images().addIcon,
                        height: 40, width: 47)),
                const Text("Add New Profile",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primaryColor))
              ])),
          verticalSpaceMedium,
        ])));
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
