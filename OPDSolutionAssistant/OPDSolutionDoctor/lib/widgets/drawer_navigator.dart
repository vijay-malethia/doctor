import 'package:flutter/material.dart';
import 'package:opd_doctor/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/services/auth_service.dart';
import '/ui/common/index.dart';

import '../app/app.bottomsheets.dart';
import '../app/app.locator.dart';

class DrawerNavigator extends StatelessWidget {
  final _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  DrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Drawer(
          backgroundColor: primaryColor,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            verticalSpaceSmall,
            Row(children: [
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel),
                  iconSize: 27,
                  color: Colors.white),
              horizontalSpaceTiny,
              const Text(opdSolution,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20))
            ]),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  drawerListTile(context,
                      title: "Appointments", leading: Icons.person, onTap: () {
                    Navigator.of(context).pop();
                    _navigationService.navigateTo(Routes.homeView);
                  }),
                  drawerListTile(context,
                      title: "Add New User",
                      leading: Icons.add_circle, onTap: () {
                    Navigator.of(context).pop();
                    _bottomSheetService.showCustomSheet(
                        isScrollControlled: true,
                        variant: BottomSheetType.addNewUser);
                  }),
                  drawerListTile(context,
                      title: "Diagnosis", leading: Icons.person, onTap: () {
                    _navigationService.clearStackAndShow(Routes.listView,
                        arguments: const ListViewArguments(name: "Diagnose"));
                  }),
                  drawerListTile(context,
                      title: "Symptoms", leading: Icons.person, onTap: () {
                    _navigationService.clearStackAndShow(Routes.listView,
                        arguments: const ListViewArguments(name: "Symptom"));
                  }),
                  drawerListTile(context,
                      title: "Medicines", leading: Icons.circle, onTap: () {
                    _navigationService.clearStackAndShow(Routes.listView,
                        arguments: const ListViewArguments(name: "Medicine"));
                  }),
                  drawerListTile(context,
                      title: "Reports", leading: Icons.description, onTap: () {
                    _navigationService.clearStackAndShow(Routes.listView,
                        arguments: const ListViewArguments(name: "Report"));
                  }),
                  drawerListTile(context,
                      title: "Reminders",
                      leading: Icons.notifications_on,
                      onTap: () {}),
                  // const Expanded(child: SizedBox()),
                  verticalSpaceMedium,
                  drawerListTile(context,
                      title: "My Profile", leading: Icons.person, onTap: () {
                    Navigator.pushNamed(context, Routes.doctorProfileView);
                  }, isWhite: true),
                  drawerListTile(context, title: "Log Out", leading: null,
                      onTap: () async {
                    await _authService.logout();
                    await _navigationService
                        .clearStackAndShow(Routes.loginView);
                    Navigator.pop(context);
                  },
                      isWhite: true,
                      trailing: const Icon(Icons.logout,
                          size: 21, color: primaryColor)),
                  verticalSpaceSmall
                ],
              ),
            )
          ])),
    );
  }

  Widget drawerListTile(BuildContext context,
      {String? title,
      IconData? leading,
      Icon? trailing,
      void Function()? onTap,
      bool isWhite = false}) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: isWhite ? Colors.white : const Color.fromARGB(255, 36, 139, 239),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ListTile(
          dense: true,
          contentPadding:
              title == 'Log Out' ? const EdgeInsets.only(right: 10.0) : null,
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          horizontalTitleGap: 0.0,
          minLeadingWidth: title == 'Log Out' ? 0 : null,
          leading: title == 'Medicines'
              ? SvgPicture.asset(Images().pillIcon)
              : Icon(
                  leading,
                  size: 21,
                  color: isWhite ? primaryColor : Colors.white,
                ),
          trailing: trailing,
          iconColor: isWhite ? primaryColor : Colors.white,
          hoverColor: isWhite
              ? Colors.white.withOpacity(0.8)
              : primaryColor.withOpacity(0.8),
          title: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(title!,
                  style: TextStyle(
                      color: isWhite ? primaryColor : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
