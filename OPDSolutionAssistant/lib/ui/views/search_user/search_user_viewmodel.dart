import 'package:doc_ease/services/index.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import 'package:doc_ease/api/index.dart';

class SearchUserViewModel extends FormViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List searchList = [];

//logolist
  List logoList = [
    'assets/images/patientLogo.svg',
    'assets/images/patientLogoGreen.svg',
    'assets/images/patientLogoYellow.svg',
    'assets/images/patientLogoPurple.svg',
    'assets/images/patientLogoRed.svg'
  ];

  //Go To Home Page
  void gotoHomePage() {
    navigationService.navigateTo(Routes.homeView);
  }

//  Go To User Details View
  goToUserDetailsView(index, TextEditingController search) async {
    await navigationService
        .navigateTo(Routes.appointmentDetailsView,
            arguments: AppointmentDetailsViewArguments(
                id: searchList[index]['id'],
                screenType: 'Search',
                appointmentId: null))!
        .then((value) {
      search.clear();
      searchList.clear();
      notifyListeners();
    });
  }

// add user bottom sheet
  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addUser);
  }

  ///////////////////////////////////////////////////////////////////////////Api Work///////////////////////////////////////////////////////////////////////////////
  final UserService _userService = locator<UserService>();

  //Search User By Number
  searchNumber(number) async {
    if (number.isEmpty) {
      searchList.clear();
      notifyListeners();
      return;
    }
    try {
      var res = await _userService.searchUser(number);
      searchList = res.data;
      notifyListeners();
    } on ApiError catch (error) {
      (error);
    } finally {
      setBusy(false);
    }
  }
}
