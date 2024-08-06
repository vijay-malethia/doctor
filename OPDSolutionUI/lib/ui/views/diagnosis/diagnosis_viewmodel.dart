import 'dart:developer';

import 'package:opdsolutionui/services/consultation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../model/response_model.dart';

class DiagnosisViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _consultationService = locator<ConsultationService>();

  goBack() {
    _navigationService.back();
  }

  //Show pop up
  Future<void> showPop() async {
    var res = await _dialogService.showCustomDialog(
        variant: DialogType.addItem, data: 'hello');
    if (res!.data != null) {
      addDiagnosis(diagnosisName: res.data);
    }
    notifyListeners();
  }

  //Switch Button
  void switchButton(int index) {
    responseList[index].isActive = !responseList[index].isActive;
    activeUnactiveDiagnosis(id: responseList[index].id);
    notifyListeners();
  }

  //Search list
  List searchResults = [];
  void search(String searchText) {
    searchResults = responseList
        .where((item) =>
            item.listItem.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  DiagnosisViewModel() {
    getAllDiagnosis();
  }

  ///////////////////////////////////////////////////////////////////////////API WORK//////////////////////////////////////////////////////////////////////////////

  //Get Diagnosis
  List list = [];
  List<ResponseModel> responseList = [];
  Future<void> getAllDiagnosis() async {
    responseList.clear();
    try {
      setBusy(true);
      var response = await _consultationService.getDiagnosisById();
      for (var ele in response.data) {
        responseList.add(ResponseModel(
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
      await _consultationService.addDiagnosis(data).then((value) async {
        getAllDiagnosis();
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

// toggle status Api
  activeUnactiveDiagnosis({required id}) async {
    try {
      await _consultationService.postDiagnosisStatus(id).then((value) async {
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    }
  }
}
