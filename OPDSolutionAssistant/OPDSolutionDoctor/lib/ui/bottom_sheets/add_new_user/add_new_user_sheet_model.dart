import 'dart:developer';

import 'package:opd_doctor/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/user_service.dart';

class AddNewUserSheetModel extends BaseViewModel {
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

  void goBack() {
    _navigationService.back();
  }
  ////////////////////////////////////////////////////////////////////////////API WORK////////////////////////////////////////////////////////////////////////////////

  //Add New User
  void addNewUser({
    required firstName,
    required lastName,
    required age,
    required phoneNumber,
    required height,
    required weight,
    required pulse,
    required bp,
    required bph,
    required temperature,
  }) async {
    try {
      setBusy(true);
      var data = {
        "firstName": firstName == '' ? '' : firstName,
        "lastName": lastName == '' ? '' : lastName,
        "age": age == '' ? '' : age,
        "phoneNumber": phoneNumber == '' ? '' : phoneNumber,
        "gender": selectedGender == 'Select Gender' ? '' : selectedGender,
        "height": height == '' ? '' : height,
        "weight": weight == '' ? '' : weight,
        "pluse": pulse == '' ? '' : pulse,
        "bloodpressure": bp == '' ? '' : bp,
        "bloodpressureHigh": bph == '' ? '' : bph,
        "temperature": temperature == '' ? '' : temperature,
        'isDoctor': true,
        "consultation": true,
        "reportCheck": false,
      };
      await _userService.addNewUser(data).then((value) async {
        print(value);
        if (value.statusCode == 200) {
          _navigationService.clearStackAndShow(Routes.homeView);
        }
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
