import 'dart:developer';

import 'package:doc_ease/api/index.dart';
import 'package:doc_ease/app/app.bottomsheets.dart';
import 'package:doc_ease/services/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';
import '/app/app.router.dart';
import '/app/app.locator.dart';

class HomeViewModel extends FormViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final HomeService _homeService = locator<HomeService>();
  final UserService _userService = locator<UserService>();

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addUser);
  }

//logolist
  List logoList = [
    'assets/images/patientLogo.svg',
    'assets/images/patientLogoGreen.svg',
    'assets/images/patientLogoYellow.svg',
    'assets/images/patientLogoPurple.svg',
    'assets/images/patientLogoRed.svg'
  ];

  //Add user dropdown
  String selectedGender = "";
  String genderInitVale = 'Select Gender';
  List<String> genderList = ['Select Gender', 'Male', 'Female', 'Other'];
  void changeGender(value) {
    genderInitVale = value;
    selectedGender = value;
    notifyListeners();
  }

  //Navigate to Appointment Details Screen
  void goToAppointmentDetails(index) {
    _navigationService.navigateToAppointmentDetailsView(
        id: allUser[index].id,
        screenType: "assistantDetail",
        appointmentDate: allUser[index].dateofAppointment,
        appointmentId: allUser[index].appointmentsId);
  }

  //Navigate to Search Screen
  void goToSearch() {
    _navigationService.navigateTo(Routes.searchUserView);
  }

/////////////////////////////////////////////////////////////////////////////Api Work///////////////////////////////////////////////////////////////////////////////

//get assistant name
  String assistantName = "";
  void getName() async {
    var pref = await SharedPreferences.getInstance();
    assistantName = pref.getString('assistantName')!;
    notifyListeners();
  }

  //get User
  List<UserModel> allUser = [];
// String deatilsById = '';
  Future<void> getAllUser() async {
    try {
      allUser.clear();
      setBusy(true);
      var res = await _homeService.getAllUser();
      for (var element in res.data) {
        // deatilsById = element['id'];
        allUser.add(UserModel(
            id: element['id'],
            username: element['firstName'] + " " + element['lastName'],
            phone: element['phoneNumber'],
            gender: element['gender'],
            height: element['height'].toString(),
            weight: element['weight'].toString(),
            pulse: element['pluse'].toString(),
            bloodPressure: element['bloodpressure'].toString(),
            bloodPressureHigh: element['bloodpressureHigh'] == null
                ? 0
                : element['bloodpressureHigh']!,
            temperature: element['temperature'].toString(),
            dateofAppointment:
                element['appointmentDate'].toString().split('T').first,
            age: element['age'].toString(),
            reportCheck: element['reportCheck'],
            consultation: element['consultation'],
            appointmentsId: element['appointmentsId']));
      }
      notifyListeners();
    } on ApiError catch (error) {
      log('error$error');
    } finally {
      setBusy(false);
    }
  }

  //Add User
  addUser(
      {required cntx,
      required firstName,
      required lastName,
      required age,
      required phoneNumber,
      required height,
      required weight,
      required pulse,
      required bp,
      required bph,
      required temperature}) async {
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
        'isDoctor': false,
        "consultation": true,
        "reportCheck": false,
      };
      final result = await _userService.addUser(data);
      ScaffoldMessenger.of(cntx).showSnackBar(SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.green,
          content: Text("${result.data}")));
      _navigationService.clearStackAndShow(Routes.homeView);
    } on Error catch (error) {
      log('error$error');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
