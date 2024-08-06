import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../models/user_model.dart';
import '/services/index.dart';
import '/app/app.dialogs.dart';
import '/app/app.router.dart';
import '/app/app.locator.dart';
import '/app/app.bottomsheets.dart';

String? selectedGender;

class AppointmentDetailsViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  //final HomeService _homeService = locator<HomeService>();
  final UserService _userService = locator<UserService>();

  //set current date when user come from search
  DateTime defaultAppointmentDate = DateTime.now();

//show dialogbox
  final _dialogService = locator<DialogService>();
  Future<void> showDialog() async {
    await _dialogService.showCustomDialog(variant: DialogType.infoAlert);
    notifyListeners();
  }

  //Go to back
  goToBack() {
    _navigationService.navigateTo(Routes.searchUserView);
  }

  //Go to back
  goHomeView() {
    _navigationService.navigateTo(Routes.homeView);
  }

  //Edit user dropdown
  List<String> genderList = ['Male', 'Female', 'Other'];
  void changeGender(value) {
    selectedGender = value;
    notifyListeners();
  }

  //Show Edit Appointment BottomSheet
  void showBottomSheet(String id) {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true,
        variant: BottomSheetType.editAppointment,
        data: id);
  }

  //Show Edit user BottomSheet
  void showEditUserBottomSheet(String id) {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.editUser, data: id);
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

  DateTime selectedDate = DateTime.now();

  Future<void> selectAppointmentDate(
      BuildContext context, String screenType, DateTime appointmentDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            screenType == "assistantDetail" ? appointmentDate : selectedDate,
        firstDate:
            screenType == "assistantDetail" ? appointmentDate : selectedDate,
        lastDate: DateTime(2024));
    if (picked != null && screenType == 'assistantDetail') {
      selectedDate = picked;
      await updateAppointmentDate(context);
    } else if (picked != null && screenType != 'assistantDetail') {
      defaultAppointmentDate = picked;
    }
    notifyListeners();

    // if (picked != null && picked != selectedDate) {
    //   selectedDate = picked;
    //   notifyListeners();
    // }
  }

  //Set appointment data
  setAppointmentData({
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController age,
    required TextEditingController phoneNumber,
    required TextEditingController height,
    required TextEditingController weight,
    required TextEditingController pulse,
    required TextEditingController bp,
    required TextEditingController bph,
    required TextEditingController temp,
  }) {
    List<String> nameParts = patientList[0].username.split(' ');
    firstName.text = nameParts.isNotEmpty ? nameParts[0] : '';
    lastName.text = nameParts.length > 1 ? nameParts[1] : '';
    age.text = patientList[0].age.toString();
    selectedGender = patientList[0].gender;
    phoneNumber.text = patientList[0].phone;
    height.text = patientList[0].height.toString();
    weight.text = patientList[0].weight.toString();
    pulse.text = patientList[0].pulse.toString();
    bp.text = patientList[0].bloodPressure.toString();
    bph.text = patientList[0].bloodPressureHigh.toString();
    temp.text = patientList[0].temperature.toString();
    notifyListeners();
  }

////////////////////////////////////////////////////////Api Work/////////////////////////////////////////////////////////////////////////

  List patientList = [];
  List appointment = [];
  String? apoointId;
  String? userId;
  //get appointment details by id
  getAppointmentDetailsById(String id, String screenType, String appointmentId,
      {TextEditingController? firstName,
      TextEditingController? lastName,
      TextEditingController? age,
      TextEditingController? phoneNumber,
      TextEditingController? height,
      TextEditingController? weight,
      TextEditingController? pulse,
      TextEditingController? bp,
      TextEditingController? bph,
      TextEditingController? temp}) async {
    patientList.clear();
    try {
      apoointId = appointmentId;
      userId = id;
      setBusy(true);
      var res = await _userService.getPatientDetailsById(id);
      appointment = res.data['appointment'];
      var user = res.data['user'];
      patientList.add(UserModel(
          username: user['firstName'] + ' ' + user['lastName'],
          phone: user['phoneNumber'],
          gender: user['gender'],
          height: user['height'] == null ? 0 : user["height"],
          weight: user['weight'] == null ? 0 : user["weight"],
          pulse: user['pluse'] == null ? 0 : user["pluse"],
          bloodPressure:
              user['bloodpressure'] == null ? 0 : user['bloodpressure']!,
          bloodPressureHigh: user['bloodpressureHigh'] == null
              ? 0
              : user['bloodpressureHigh']!,
          temperature: user['temperature'] == null ? 0 : user["temperature"],
          age: user['age'],
          id: user['id']));
      if (screenType != "assistantDetail") {
        setAppointmentData(
            firstName: firstName!,
            lastName: lastName!,
            age: age!,
            phoneNumber: phoneNumber!,
            height: height!,
            weight: weight!,
            pulse: pulse!,
            bp: bp!,
            bph: bph!,
            temp: temp!);
      }
      notifyListeners();
    } on ApiError catch (error) {
      log('error$error');
    } finally {
      setBusy(false);
    }
  }

//book consultation
  void bookConsultation() async {
    String time = defaultAppointmentDate.toString();
    String formattedTime = time.replaceAll(' ', 'T');
    try {
      setBusy(true);
      var data = {
        "id": userId,
        "height": patientList[0].height,
        "weight": patientList[0].weight,
        "pluse": patientList[0].pulse,
        "bloodPressure": patientList[0].bloodPressure,
        "bloodpressureHigh": patientList[0].bloodPressureHigh,
        "temperature": patientList[0].temperature,
        "appointment": formattedTime,
        "consultation": true,
        "reportCheck": false,
        "isActive": true,
        "isDoctor": false
      };
      print(data);
      await _userService.editUserAppointment(data).then((value) async {
        _navigationService.clearStackAndShow(Routes.homeView);
        notifyListeners();
      });
    } on Error catch (error) {
      print('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Cancel Appointment
  cancelAppointment(context, id) async {
    try {
      await _userService.cancelAppointment(apoointId);
      _navigationService.clearStackAndShow(Routes.homeView);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          content: Text('Appointment Cancelled')));
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  //update datepicker
  updateAppointmentDate(BuildContext context) async {
    String time = selectedDate.toString();
    String formattedTime = time.replaceAll(' ', 'T');
    try {
      setBusy(true);
      var data = {
        "appointmentId": apoointId,
        "appointmentDate": formattedTime,
      };
      var res = await _userService.editUserAppointmentDate(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          content: Text('${res.data}')));
      _navigationService.clearStackAndShow(Routes.homeView);
    } on Error catch (error) {
      log('error$error');
    }
  }

  //Update User Profile
  void updateUser(
      {required id,
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
      await _userService.updateUser(data).then((value) {
        _navigationService.clearStackAndShow(Routes.appointmentDetailsView,
            arguments:
                AppointmentDetailsViewArguments(id: id, screenType: "search"));
      });
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Update User Vitals
  updateVitals(
      {required id,
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
        "isDoctor": false
      };
      await _userService.updateUserVitals(data).then((value) {
        _navigationService.clearStackAndShow(Routes.appointmentDetailsView,
            arguments:
                AppointmentDetailsViewArguments(id: id, screenType: "search"));
      });
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
