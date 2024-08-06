import 'dart:developer';

import 'package:opd_doctor/app/app.locator.dart';
import 'package:opd_doctor/app/app.router.dart';
import 'package:opd_doctor/model/patient_model.dart';
import 'package:opd_doctor/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  List logoList = [
    'assets/images/patientLogo.svg',
    'assets/images/patientLogoGreen.svg',
    'assets/images/patientLogoYellow.svg',
    'assets/images/patientLogoPurple.svg',
    'assets/images/patientLogoRed.svg'
  ];

  HomeViewModel() {
    getAllPatient();
  }

  //Go to Patient View
  goToPatientView(index) {
    _navigationService.navigateTo(Routes.patientView,
        arguments: PatientViewArguments(
            userName: allPatient[index].name,
            age: allPatient[index].age,
            gender: allPatient[index].gender,
            phoneNumber: allPatient[index].phoneNumber,
            id: allPatient[index].id,
            appointId: allPatient[index].appointmentId));
  }

//navigate to search view
  void goToSearch() {
    _navigationService.navigateTo(Routes.searchUserView,
        arguments: SearchUserViewArguments(userList: allPatient));
  }

  //////////////////////////////////////////////////////////////////////////////////Api's Work//////////////////////////////////////////////////////////////////////////
  final UserService _userService = locator<UserService>();
  //Get all patient
  List allPatient = [];
  Future<void> getAllPatient() async {
    allPatient.clear();
    try {
      setBusy(true);
      var res = await _userService.getAllPatient();
      for (var i = 0; i < res.data.length; i++) {
        allPatient.add(PatientModel(
            id: res.data[i]['id'].toString(),
            name: res.data[i]['firstName'] + ' ' + res.data[i]['lastName'],
            age:
                res.data[i]['age'] == null ? '' : res.data[i]['age'].toString(),
            appointmentId: res.data[i]['appointmentsId'] ?? '',
            phoneNumber: res.data[i]['phoneNumber'],
            gender: res.data[i]['gender']));
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
