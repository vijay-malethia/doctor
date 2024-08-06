import 'dart:developer';
import 'package:opdsolutionui/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../model/doctor_model.dart';
import '/app/app.router.dart';
import '/app/app.locator.dart';
import '/services/index_service.dart';

String docName = '';
String imageUrl = '';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  int activeStep = 0;

  //Go to consultation view
  goToConsultationView(int index) async {
    _navigationService.navigateTo(Routes.consultationView,
        arguments: ConsultationViewArguments(
            id: allPatient[index]['id'],
            userName: allPatient[index]['firstName'] +
                ' ' +
                allPatient[index]['lastName'],
            age: allPatient[index]['age'].toString(),
            gender: allPatient[index]['gender'],
            phoneNumber: allPatient[index]['phoneNumber'],
            appointId: allPatient[index]['appointmentsId']));
  }

  //Log Out
  logOut() async {
    await _authService.logout();
    await _navigationService.navigateTo(Routes.authView);
  }

  ////////////////////////////////////////API's Work////////////////////////////////////
  final ConsultationService _consultationService =
      locator<ConsultationService>();
  List allPatient = [];

  //Intial funtion it will call when ui'll load
  String specialization = '';
  void initFuntion() async {
    getDoctor();
    // var pref = await SharedPreferences.getInstance();
    // // docName = pref.getString('docName')!;
    // imageUrl = baseurl + pref.getString('imageUrl')!;
    // specialization = pref.getString('specialization')!;
    getAllPatient();
    notifyListeners();
  }

  //Get all patient
  Future<void> getAllPatient() async {
    allPatient.clear();
    try {
      setBusy(true);
      var response = await _consultationService.getAllPatient();
      allPatient = response.data;
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  late DoctorModel doctor;
  Future<void> getDoctor() async {
    try {
      setBusy(true);
      var res = await _consultationService.getDoctorInfo();
      doctor = DoctorModel(
          id: res.data['id'].toString(),
          firstName: res.data['firstName'].toString(),
          lastName: res.data['lastName'] ?? '',
          phoneNumber: res.data['phoneNumber'].toString(),
          age: res.data['age'].toString(),
          base64Image: '$baseurl${res.data['userProfile'].toString()}',
          gender: res.data['gender'].toString(),
          specialization: res.data['specialization'].toString());
      docName = doctor.firstName + ' ' + doctor.lastName;
      imageUrl = doctor.base64Image;
      specialization = doctor.specialization;
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    } finally {
      setBusy(false);
    }
  }
}
