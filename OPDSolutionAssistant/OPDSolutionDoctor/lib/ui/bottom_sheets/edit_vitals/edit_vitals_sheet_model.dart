import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/user_service.dart';

class EditVitalsSheetModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();

  //Set controllers value
  void setControllersValue(
      TextEditingController heightCtrl,
      weightCtrl,
      pulseCtrl,
      bpCtrl,
      bp2Ctrl,
      tempCtrl,
      String heightValue,
      weightValue,
      pulseValue,
      bpValue,
      bphValue,
      tempValue) {
    heightCtrl.text = heightValue;
    weightCtrl.text = weightValue;
    pulseCtrl.text = pulseValue;
    bpCtrl.text = bpValue;
    bp2Ctrl.text = bphValue;
    tempCtrl.text = tempValue;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////API WORK/////////////////////////////////////////////////////////////////////////////////

  //Update User Profile
  void updateUser(
      {required id,
      required index,
      required userList,
      required height,
      required weight,
      required pulse,
      required bp,
      required bph,
      required temp}) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "height": height == 'null' ? 0 : int.parse(height),
        "weight": weight == 'null' ? 0 : int.parse(weight),
        "pluse": pulse == 'null' ? 0 : int.parse(pulse),
        "bloodPressure": bp == 'null' ? 0 : int.parse(bp),
        "bloodpressureHigh": bph == 'null' ? 0 : int.parse(bph),
        "temperature": temp == 'null' ? 0 : double.parse(temp),
        "isDoctor": true
      };
      await _userService.updateUserVitals(data).then((value) async {
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
