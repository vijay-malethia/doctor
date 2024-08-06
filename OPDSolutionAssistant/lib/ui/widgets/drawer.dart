import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app.bottomsheets.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../common/images.dart';
import '/services/auth_service.dart';
import '/ui/common/index.dart';

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
              const Text("",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20))
            ]),
            const SizedBox(height: 20),
            drawerListTile(context,
                title: "Appointments", leading: Icons.person, onTap: () {
              Navigator.of(context).pop();
              _navigationService.navigateTo(Routes.homeView);
            }),
            drawerListTile(context, title: "Add User", leading: Icons.person,
                onTap: () {
              _bottomSheetService.showCustomSheet(
                  isScrollControlled: true, variant: BottomSheetType.addUser);
            }),
            drawerListTile(context,
                title: "Add Consultation",
                leading: Icons.description, onTap: () {
              _navigationService.clearStackAndShow(Routes.searchUserView);
            }),
            const Expanded(child: SizedBox(height: 20)),
            drawerListTile(context, title: "Log Out", leading: null,
                onTap: () async {
              await _authService.clearUserSession();
              await _navigationService
                  .pushNamedAndRemoveUntil(Routes.loginView);
              Navigator.pop(context);
            },
                isWhite: true,
                trailing:
                    const Icon(Icons.logout, size: 21, color: primaryColor)),
            verticalSpaceSmall
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
