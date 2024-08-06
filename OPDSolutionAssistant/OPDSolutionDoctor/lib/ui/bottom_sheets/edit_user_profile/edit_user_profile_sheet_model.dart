import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:opd_doctor/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/user_service.dart';

class EditUserProfileSheetModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();

  //Add user dropdown
  String selectedGender = "";
  String genderInitVale = 'Select Gender';
  List<String> genderList = ['Select Gender', 'Male', 'Female', 'Other'];
  void changeGender(value) {
    genderInitVale = value;
    selectedGender = value;
    notifyListeners();
  }

  //Set controllers value
  void setControllersValue(
      TextEditingController firstNameCtrl,
      lastNameCtrl,
      phoneNumberCtrl,
      ageCtrl,
      String firstValue,
      lastNameValue,
      phoneValue,
      ageValue,
      genderValue) {
    firstNameCtrl.text = firstValue;
    lastNameCtrl.text = lastNameValue;
    phoneNumberCtrl.text = phoneValue;
    ageCtrl.text = ageValue;
    selectedGender = genderValue;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////API WORK/////////////////////////////////////////////////////////////////////////////////

  //Update User Profile
  void updateUser(
      {required id,
      required index,
      required userList,
      required firstName,
      required lastName,
      required age,
      required phoneNumber}) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "firstName": firstName == '' ? '' : firstName,
        "lastName": lastName == '' ? '' : lastName,
        "age": age == '' ? '' : int.parse(age),
        "phoneNumber": phoneNumber == '' ? '' : phoneNumber,
        "gender": selectedGender == 'Select Gender' ? '' : selectedGender,
      };
      await _userService.updateUser(data).then((value) async {
        _navigationService.clearStackAndShow(Routes.userProfileView,
            arguments:
                UserProfileViewArguments(index: index, userList: userList));
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
