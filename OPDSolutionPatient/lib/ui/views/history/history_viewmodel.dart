import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.router.dart';
import '/app/app.locator.dart';
import '/services/patient_service.dart';

bool isJouney = true;
String id = '';

class HistoryViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
//change index
  int currentIndex = 0;
  changeIndex(tabindex) {
    currentIndex = tabindex;
    notifyListeners();
  }

//on page load set journey tab false
  init() {
    isJouney = true;
    notifyListeners();
  }

  //navigate to preview screen
  void gotToPreview(id, isreport) {
    _navigationService.navigateTo(Routes.previewView,
        arguments: PreviewViewArguments(
            id: id, result: previewData, isreport: isreport));
  }

//filter data a/c to dates
  Map<String, List> groupedData = {};
  var previewData;
  changeGroupBy(fileDataList) {
    groupedData.clear();
    previewData = [];
    for (var fileData in fileDataList) {
      fileData['date'] = DateTime.parse(fileData['date']);
      for (var reportsElement in fileData['reports']) {
        reportsElement['reportPath'] =
            'http://103.30.75.131:444${reportsElement['reportPath']}';
        previewData.add({
          "reportPath": reportsElement['reportPath'],
          "reportId": reportsElement['reportId'],
          "id": fileData['id'],
          "name": fileData['doctor'] ?? fileData['report'],
          "date": fileData['date']
        });
      }
      String yearMonth = DateFormat('MMMM yyyy').format(fileData['date']);
      if (!groupedData.containsKey(yearMonth)) {
        groupedData[yearMonth] = [];
      }
      groupedData[yearMonth]!.add(fileData);
    }
    notifyListeners();
  }

  //go to add screen
  void add(sheeName) {
    _navigationService.navigateTo(Routes.historyUploadView,
        arguments: HistoryUploadViewArguments(sheetName: sheeName, id: id));
  }

/////////////////////////////////////////////////////////////////////API Work///////////////////////////////////////////////////////////////////////////////////

  final PatientService _patientService = locator<PatientService>();

  //get list of reports name
  Future<void> getReports() async {
    groupedData.clear();
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id')!;
    try {
      setBusy(true);
      var res = await _patientService.getAllReports(id);

      changeGroupBy(res.data); //filter reportsdata
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

  //get list of journey
  Future<void> getJourney() async {
    groupedData.clear();
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id')!;
    try {
      setBusy(true);
      var res = await _patientService.getAllJourney(id);
      changeGroupBy(res.data); //filter journey data
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }
}
