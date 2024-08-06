import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '/services/patient_service.dart';

class DoctorViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _patientService = locator<PatientService>();

  //get format appointment date
  String convertDateFormat(date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat('MMMM dd, yyyy');
    String outputDate = outputFormat.format(dateTime);
    return outputDate;
  }

//viewFull details navigation
  goToMedicinesDetails(index) {
    _navigationService.navigateToMedicinesView(
        mdedicinesDetails: dataList[index]['medicineData']);
  }

  goToReports(String id) {
    _navigationService.navigateTo(Routes.reportView,
        arguments: ReportViewArguments(id: id));
  }

  getlastappointDate() {
    return dataList.isEmpty
        ? ''
        : convertDateFormat(dataList.last['appointmentDate']);
  }

  getappointDate(index) {
    return convertDateFormat(dataList[index]['appointmentDate']);
  }

  getDiagnosis(index) {
    List data = dataList[index]['diagnosis'];
    return dataList[index]['diagnosis'] == '' ? '' : data.join(',');
  }

  getSymptoms(index) {
    List data = dataList[index]['symptoms'];
    return dataList[index]['symptoms'] == '' ? '' : data.join(',');
  }

  getAdvice(index) {
    List data = dataList[index]['symptoms'];
    return dataList[index]['symptoms'] == '' ? '' : data.join(',');
  }

  bool isExpanded = false;
  expansionChange(value) {
    isExpanded = value;
    notifyListeners();
  }

  goBack() async {
    _navigationService.back();
  }

//get medicines list with numbers
  String getMed() {
    List medicines = [];
    for (var appointment in dataList) {
      List<dynamic> medicineData = appointment['medicineData'];
      for (var medicine in medicineData) {
        String medicineName = medicine['medicine'];
        if (medicineName.isNotEmpty) {
          medicines.add(medicineName);
        }
      }
    }
    String result = medicines.asMap().entries.map((entry) {
      int index = entry.key + 1; // Index starts from 1
      String medicineName = entry.value;
      return '$index. $medicineName';
    }).join('\n');

    return result;
  }

  //Get all appointments
  List dataList = [];
  Future<void> getAppointmentDetails(id) async {
    dataList.clear();
    try {
      setBusy(true);
      final prefs = await SharedPreferences.getInstance();
      String userProfileId = prefs.getString('id')!;
      var response =
          await _patientService.getDataAppointment(id, userProfileId);
      dataList = response.data;
      // print(dataList);
      notifyListeners();
    } on Error catch (error) {
      print('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
