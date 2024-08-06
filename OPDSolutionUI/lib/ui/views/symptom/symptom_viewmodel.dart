import 'dart:developer';

import 'package:opdsolutionui/services/consultation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../model/response_model.dart';

class SymptomsViewModel extends BaseViewModel {
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
      addSymptoms(symptomsName: res.data);
    }
    notifyListeners();
  }

  //Switch Button
  void switchButton(int index) {
    responseList[index].isActive = !responseList[index].isActive;
    toggleStatus(id: responseList[index].id);
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

  SymptomsViewModel() {
    getAllSymptoms();
  }

  ///////////////////////////////////////////////////////////////////////////API WORK/////////////////////////////////////////////////////////////////////////////////

  //Get Symptoms
  List list = [];
  List<ResponseModel> responseList = [];
  Future<void> getAllSymptoms() async {
    responseList.clear();
    try {
      setBusy(true);
      var response = await _consultationService.getSymptomsById();
      list = response.data;
      for (var ele in response.data) {
        responseList.add(ResponseModel(
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
      await _consultationService.addSymptoms(data).then((value) async {
        getAllSymptoms();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  // toggle status Api
  toggleStatus({required id}) async {
    try {
      await _consultationService.postSymptomStatus(id).then((value) async {
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    }
  }
}
