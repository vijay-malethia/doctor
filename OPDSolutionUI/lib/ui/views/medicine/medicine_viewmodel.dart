import 'dart:developer';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.dialogs.dart';
import '/services/consultation_service.dart';
import '../../../app/app.locator.dart';
import '../../../model/response_model.dart';

class MedicineViewModel extends BaseViewModel {
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
      addMedicine(medicineName: res.data);
    }
    notifyListeners();
  }

  //Switch Button
  void switchButton(int index) {
    responseList[index].isActive = !responseList[index].isActive;
    activeUnactiveMedicine(id: responseList[index].id);
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
  
  //Get all medicine(It will be call when ui'll load)
  MedicineViewModel() {
    getAllMedicine();
  }

  ///////////////////////////////////////////////////////////////////////////API WORK//////////////////////////////////////////////////////////////////////////////

  //Get medicine list from api
  List<ResponseModel> responseList = [];
  Future<void> getAllMedicine() async {
    responseList.clear();
    try {
      setBusy(true);
      var response = await _consultationService.getMedicineById();
      for (var ele in response.data) {
        responseList.add(ResponseModel(
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
      await _consultationService.addMedicine(data).then((value) async {
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
  activeUnactiveMedicine({required id}) async {
    try {
      await _consultationService.postMedicineStatus(id).then((value) async {
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    }
  }
}
