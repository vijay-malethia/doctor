import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../app/app.dialogs.dart';
import '../../../model/response_list_model.dart';
import '../../../services/user_service.dart';
import '../../../app/app.locator.dart';

class ListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

//navigation to back
  goBack() {
    _navigationService.back();
  }

//initial function
  initFunction(name) {
    if (name == "Medicine") {
      getAllMedicine();
    } else if (name == "Symptom") {
      getAllSymptoms();
    } else if (name == "Diagnose") {
      getAllDiagnosis();
    } else {
      getAllReports();
    }
    notifyListeners();
  }

  //showSearchResult
  isSearchResultEmpty(name, searchVaue) {
    if (name == "Medicine") {
      if (searchVaue.isNotEmpty && medicineSearchResults.isEmpty) {
        return true;
      }
    } else if (name == "Symptom") {
      if (searchVaue.isNotEmpty && symptomSearchResults.isEmpty) {
        return true;
      }
    } else if (name == "Diagnose") {
      if (searchVaue.isNotEmpty && searchResultsDiagnose.isEmpty) {
        return true;
      }
    } else {
      if (searchVaue.isNotEmpty && searchResultsReport.isEmpty) {
        return true;
      }
    }
  }

  // Switch Condition
  renderSwitch(ListViewModel viewModel, int index, name) {
    if (name == "Medicine") {
      viewModel.switchMedicineButton(index);
    } else if (name == "Symptom") {
      viewModel.switchButtonSymptom(index);
    } else if (name == "Diagnose") {
      viewModel.switchButtonDiagnose(index);
    } else {
      viewModel.switchButtonReport(index);
    }
  }

  //showing list condition
  renderList(String name, ListViewModel viewModel, int index) {
    if (name == "Medicine") {
      if (viewModel.medicineSearchResults.isEmpty) {
        return viewModel.medicineResponseList;
      }
      return viewModel.medicineSearchResults;
    } else if (name == "Symptom") {
      if (viewModel.symptomSearchResults.isEmpty) {
        return viewModel.symptomResponseList;
      }
      return viewModel.symptomSearchResults;
    } else if (name == "Diagnose") {
      if (viewModel.searchResultsDiagnose.isEmpty) {
        return viewModel.diagnoseResponseList;
      }
      return viewModel.searchResultsDiagnose;
    } else {
      if (viewModel.searchResultsReport.isEmpty) {
        return viewModel.responseListReport;
      }
      return viewModel.searchResultsReport;
    }
  }

//condition to show item count
  getItemCount(String name, ListViewModel viewModel) {
    if (name == "Medicine") {
      if (viewModel.medicineSearchResults.isEmpty) {
        return viewModel.medicineResponseList.length;
      }
      return viewModel.medicineSearchResults.length;
    } else if (name == "Symptom") {
      if (viewModel.symptomSearchResults.isEmpty) {
        return viewModel.symptomResponseList.length;
      }
      return viewModel.symptomSearchResults.length;
    } else if (name == "Diagnose") {
      if (viewModel.searchResultsDiagnose.isEmpty) {
        return viewModel.diagnoseResponseList.length;
      }
      return viewModel.searchResultsDiagnose.length;
    } else {
      if (viewModel.searchResultsReport.isEmpty) {
        return viewModel.responseListReport.length;
      }
      return viewModel.searchResultsReport.length;
    }
  }

//list to show search results
  renderSearch(ListViewModel viewModel, String value, context, name) {
    if (name == "Medicine") {
      viewModel.searchMedicine(value, context);
    } else if (name == "Symptom") {
      viewModel.searchSymptom(value, context);
    } else if (name == "Diagnose") {
      viewModel.searchDiagnose(value, context);
    } else {
      viewModel.searchDiagnose(value, context);
    }
  }

  //Show pop up to add new
  Future<void> showPopUp(name) async {
    var res = await _dialogService.showCustomDialog(
        variant: DialogType.addNew, data: "Hello");
    if (res!.data != null) {
      if (name == "Medicine") {
        addMedicine(medicineName: res.data);
      } else if (name == "Symptom") {
        addSymptoms(symptomsName: res.data);
      } else if (name == 'Diagnose') {
        addDiagnosis(diagnosisName: res.data);
      } else {
        addReports(reportName: res.data);
      }
    }
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////MEDICINE/////////////////////////////////////////////////////////////////////////////////////

  //Switch Button
  void switchMedicineButton(int index) {
    medicineResponseList[index].isActive =
        !medicineResponseList[index].isActive;
    activeUnactiveMedicine(id: medicineResponseList[index].id);
    notifyListeners();
  }

  //Search list
  List medicineSearchResults = [];
  void searchMedicine(String searchText, context) {
    medicineSearchResults = medicineResponseList
        .where((item) =>
            item.listItem.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////MEDICINE API WORK//////////////////////////////////////////////////////////////////////////////

  //Get medicine list from api
  List<ResponseListModel> medicineResponseList = [];
  Future<void> getAllMedicine() async {
    medicineResponseList.clear();
    try {
      setBusy(true);
      var response = await _userService.getMedicineById();
      for (var ele in response.data) {
        medicineResponseList.add(ResponseListModel(
            id: ele['id'],
            listItem: ele['medicines'],
            isActive: ele['isActive']));
        notifyListeners();
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post medicine
  void addMedicine({
    required medicineName,
  }) async {
    try {
      setBusy(true);
      var data = {'medicines': medicineName, 'isDoctor': true};
      await _userService.addMedicine(data).then((value) async {
        getAllMedicine();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Active or Unactive Medicine
  void activeUnactiveMedicine({required id}) async {
    try {
      await _userService.postMedicineStatus(id);
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    }
  }

////////////////////////////////////////////////////////////////////////////SYMPTOM//////////////////////////////////////////////////////////////////////////////////

  //Switch Button
  void switchButtonSymptom(int index) {
    symptomResponseList[index].isActive = !symptomResponseList[index].isActive;
    activeUnactiveSymptom(id: symptomResponseList[index].id);
    notifyListeners();
  }

  //Search list
  List symptomSearchResults = [];
  void searchSymptom(String searchText, context) {
    symptomSearchResults = symptomResponseList
        .where((item) =>
            item.listItem.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    notifyListeners();
  }

//////////////////////////////////////////////////////////////////////////SYMPTOM API WORK//////////////////////////////////////////////////////////////////////////////

  //Get Symptoms
  List<ResponseListModel> symptomResponseList = [];
  Future<void> getAllSymptoms() async {
    symptomResponseList.clear();
    try {
      setBusy(true);
      var response = await _userService.getSymptomsById();
      for (var ele in response.data) {
        symptomResponseList.add(ResponseListModel(
            id: ele['id'],
            listItem: ele['symptom'],
            isActive: ele['isActive']));
        notifyListeners();
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post symptoms
  void addSymptoms({
    required symptomsName,
  }) async {
    try {
      setBusy(true);
      var data = {'symptoms': symptomsName, 'isDoctor': true};
      await _userService.addSymptoms(data).then((value) async {
        getAllSymptoms();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  // Active or unactive symptom
  void activeUnactiveSymptom({required id}) async {
    try {
      await _userService.postSymptomStatus(id);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }

  ///////////////////////////////////////////////////////////////////////////DIAGNOSE////////////////////////////////////////////////////////////////////////////////////

  //Switch Button
  void switchButtonDiagnose(int index) {
    diagnoseResponseList[index].isActive =
        !diagnoseResponseList[index].isActive;
    activeUnactiveDiagnosis(id: diagnoseResponseList[index].id);
    notifyListeners();
  }

  //Search list
  List searchResultsDiagnose = [];
  void searchDiagnose(String searchText, context) {
    searchResultsDiagnose = diagnoseResponseList
        .where((item) =>
            item.listItem.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////DIAGNOSE API WORK//////////////////////////////////////////////////////////////////////////////

  //Get Diagnosis
  List<ResponseListModel> diagnoseResponseList = [];
  Future<void> getAllDiagnosis() async {
    diagnoseResponseList.clear();
    try {
      setBusy(true);
      var response = await _userService.getDiagnosisById();
      for (var ele in response.data) {
        diagnoseResponseList.add(ResponseListModel(
            id: ele['id'],
            listItem: ele['diagnose'],
            isActive: ele['isActive']));

        notifyListeners();
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post diagnosis
  void addDiagnosis({
    required diagnosisName,
  }) async {
    try {
      setBusy(true);
      var data = {'diagnose': diagnosisName, 'isDoctor': true};
      await _userService.addDiagnosis(data).then((value) async {
        getAllDiagnosis();
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

// Active or Unactive Diagnosis
  void activeUnactiveDiagnosis({required id}) async {
    try {
      await _userService.postDiagnosisStatus(id);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }

/////////////////////////////////////////////////////////////////////////////REPORT////////////////////////////////////////////////////////////////////////////////////

//Switch Button
  void switchButtonReport(int index) {
    responseListReport[index].isActive = !responseListReport[index].isActive;
    activeUnactiveReport(id: responseListReport[index].id);
    notifyListeners();
  }

  //Search list
  List searchResultsReport = [];
  void searchReport(String searchText, context) {
    searchResultsReport = responseListReport
        .where((item) =>
            item.listItem.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////REPORT API WORK////////////////////////////////////////////////////////////////////////////////

  //Get all reports
  List<ResponseListModel> responseListReport = [];
  Future<void> getAllReports() async {
    responseListReport.clear();
    try {
      setBusy(true);
      var response = await _userService.getReportsById();
      for (var ele in response.data) {
        responseListReport.add(ResponseListModel(
            id: ele['id'], listItem: ele['report'], isActive: ele['isActive']));
        notifyListeners();
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post reports
  void addReports({required reportName}) async {
    try {
      setBusy(true);
      var data = {'report1': reportName, 'isDoctor': true};
      await _userService.addReport(data).then((value) async {
        getAllReports();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  // active and Unactive report
  void activeUnactiveReport({required id}) async {
    try {
      await _userService.postReportStatus(id);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }
}
