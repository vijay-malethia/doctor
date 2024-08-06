import 'dart:developer';

import 'package:opdsolutionui/services/consultation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../model/response_model.dart';

class AllReportsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _consultationService = locator<ConsultationService>();

  goBack() {
    _navigationService.back();
  }

  //Switch Button
  void switchButton(int index) {
    responseList[index].isActive = !responseList[index].isActive;
    toggleStatus(id: responseList[index].id);
    notifyListeners();
  }

  //Show pop up
  Future<void> showPop() async {
    var res = await _dialogService.showCustomDialog(
        variant: DialogType.addItem, data: 'hello');
    if (res!.data != null) {
      addReports(reportName: res.data);
    }
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

  AllReportsViewModel() {
    getAllReports();
  }

  ///////////////////////////////////////////////////////////////////////////API WORK////////////////////////////////////////////////////////////////////////////////

  //Get all reports
  List list = [];
  List<ResponseModel> responseList = [];
  Future<void> getAllReports() async {
    responseList.clear();
    try {
      setBusy(true);
      var response = await _consultationService.getReportsById();
      for (var ele in response.data) {
        responseList.add(ResponseModel(
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
      await _consultationService.addReport(data).then((value) async {
        getAllReports();
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
      await _consultationService.postReportStatus(id).then((value) async {
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    }
  }
}
