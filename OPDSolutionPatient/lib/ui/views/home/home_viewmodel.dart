import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:developer';

import '/app/app.locator.dart';
import '/services/index_service.dart';
import '/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  //Go To Doctor View
  goToDocView(index) {
    String docName =
        docList[index]['firstName'] + ' ' + docList[index]['lastName'];
    _navigationService.navigateTo(Routes.doctorView,
        arguments:
            DoctorViewArguments(name: docName, id: docList[index]['id']));
  }

  //Log Out
  void logOut() async {
    await _authService.logout();
    await _navigationService.navigateTo(Routes.authView);
  }

  //////////////////////////////////////////////////////////////////////////APIs Work///////////////////////////////////
  final PatientService _patientService = locator<PatientService>();

  //Get all doctors
  List docList = [];
  Future<void> getAllDoc() async {
    try {
      var pref = await SharedPreferences.getInstance();
      String id = pref.getString('id')!;
      setBusy(true);
      var response = await _patientService.getDataDocById(id);
      docList = response.data;
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
