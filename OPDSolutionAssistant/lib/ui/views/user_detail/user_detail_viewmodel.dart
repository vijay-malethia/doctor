import 'dart:developer';

import 'package:doc_ease/app/app.bottomsheets.dart';
import 'package:doc_ease/app/app.router.dart';
import 'package:doc_ease/services/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/api/api_error.dart';
import '/app/app.locator.dart';

class UserDetailViewModel extends FormViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();
  //Add Consultation Button
  bool isCheckOne = true;
  changingUI() {
    isCheckOne = false;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // Set a validation message for the entire form
  }

  //Show Edit User Bottom Sheet
  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.editUser);
  }

  //Add user dropdown
  String selectedGender = "";
  String genderInitVale = 'Select';
  List<String> genderList = ['Select', 'Male', 'Female', 'Other'];
  void changeGender(value) {
    genderInitVale = value;
    selectedGender = value;
    notifyListeners();
  }

  setVitalsValue(
      {required TextEditingController height,
      required TextEditingController weight,
      required TextEditingController pulse,
      required TextEditingController bp,
      required TextEditingController temp,
      required TextEditingController firstName,
      required TextEditingController lastName,
      required TextEditingController age,
      required TextEditingController gender,
      required TextEditingController phoneNumber,
      required List usersList,
      required int index}) {
    height.text = usersList[index]['height'].toString();
    weight.text = usersList[index]['weight'].toString();
    pulse.text = usersList[index]['pluse'].toString();
    bp.text = usersList[index]['bloodpressure'].toString();
    temp.text = usersList[index]['temperature'].toString();
    firstName.text = usersList[index]['firstName'].toString();
    lastName.text = usersList[index]['lastName'].toString();
    age.text = usersList[index]['age'].toString();
    phoneNumber.text = usersList[index]['phoneNumber'].toString();
    genderInitVale = usersList[index]['gender'].toString();
    genderList.insert(0, usersList[index]['gender'].toString());
    notifyListeners();
  }

//Get user id
  getUserId(id) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('uId', id);
    notifyListeners();
  }

  bool report = false;
  bool consultation = true;
//bool report check and consultation
  checkConsultation() {
    consultation = true;
    report = false;
    notifyListeners();
  }

  checkReport() {
    report = true;
    consultation = false;
    notifyListeners();
  }

  //Choose Date

  DateTime selectedDate = DateTime.now();

  Future<void> selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1, 1),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    notifyListeners();
  }

//////////////////////////////////////////Api work///////////////////////////////////
  //Edit User
  editUser(
      {required firstName,
      required lastName,
      required age,
      required phoneNumber,
      context}) async {
    try {
      var pref = await SharedPreferences.getInstance();
      setBusy(true);
      var data = {
        "firstName": firstName.toString().trim(),
        "lastName": lastName.toString().trim(),
        "age": int.parse(age),
        "gender": selectedGender,
        "phoneNumber": phoneNumber,
      };
      await _userService
          .editUser(data, pref.getString('uId')!.toString())
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          content: Text('${value.data}'),
        ));
        _navigationService.clearStackAndShow(Routes.homeView);
      });
    } on ApiError catch (error) {
      log('error$error');
    } finally {
      setBusy(false);
    }
  }

  //Add User Vitals
  addUserVital(
      {required height,
      required weight,
      required pulse,
      required bp,
      required temp,
      context}) async {
    try {
      var pref = await SharedPreferences.getInstance();
      String id = pref.getString('uId').toString();
      String time = selectedDate.toString();
      String formattedTime = time.replaceAll(' ', 'T');
      var data = {
        "id": id,
        "height": double.parse(height == '' ? '0' : height),
        "weight": double.parse(weight == '' ? '0' : weight),
        "pluse": double.parse(pulse == '' ? '0' : pulse),
        "bloodPressure": double.parse(bp == '' ? '0' : bp),
        "temperature": double.parse(temp == '' ? '0' : temp),
        "appointment": formattedTime,
        "consultation": consultation,
        "reportCheck": false,
        'isActive': true,
        "appointmenId": "00000000-0000-0000-0000-000000000000"
      };
      await _userService.editUserAppointment(data).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 5),
          content: Text('${value.data}'),
        ));
        _navigationService.clearStackAndShow(Routes.homeView);
      });
    } on Error catch (err) {
      log('$err');
    }
  }
}
