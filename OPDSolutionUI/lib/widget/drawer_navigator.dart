import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_strings.dart';
import '../ui/views/home/home_viewmodel.dart';

class DrawerNavigator extends StackedView<HomeViewModel> {
  final _navigationService = locator<NavigationService>();
  DrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.25,
        elevation: 0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      border: Border(bottom: BorderSide(color: primaryColor))),
                  child: DrawerHeader(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          horizontalSpaceSmall,
                          GestureDetector(
                            onTap: () {
                              _navigationService.navigateTo(Routes.profileView);
                            },
                            child: imageUrl == "" || imageUrl == baseurl
                                ? const Image(
                                    height: 60,
                                    width: 60,
                                    image: AssetImage('assets/images/user.png'))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(height: 60, width: 60,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }, imageUrl, fit: BoxFit.cover)),
                          ),
                          horizontalSpaceMedium,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Text(docName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                              verticalSpaceTiny,
                              const Text("Doctor",
                                  style: TextStyle(color: Colors.white))
                            ],
                          )
                        ],
                      ))),
              Column(children: [
                list(context, Icons.home_outlined, "Home", viewModel,
                    route: Routes.homeView),
                list(context, Icons.healing_outlined, "Medicine", viewModel,
                    route: Routes.medicineView),
                list(context, Icons.medication_outlined, "Diagnosis", viewModel,
                    route: Routes.diagnosisView),
                list(context, Icons.medication_outlined, "Symptoms", viewModel,
                    route: Routes.symptomsView),
                list(context, Icons.medical_information_outlined, "Reports",
                    viewModel,
                    route: Routes.allReportsView),
                list(context, Icons.logout, "Logout", viewModel),
              ]),
            ]));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  Widget list(BuildContext context, icon, title, HomeViewModel model, {route}) {
    return ListTile(
        minLeadingWidth: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        leading: Icon(icon, size: 25, color: primaryColor),
        title: Text(title,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
        onTap: () {
          if (route == Routes.homeView) {
            Navigator.pop(context);
          } else if (title == 'Logout') {
            Navigator.pop(context);
            model.logOut();
          }
          if (route != null) {
            _navigationService.navigateTo(route);
          }
        });
  }
}
