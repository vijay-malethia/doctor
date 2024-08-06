import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.router.dart';
import '../../common/utils.dart';
import '/model/medicine_model.dart';
import '/services/user_service.dart';
import '/app/app.locator.dart';

List<String> filteredChips = [];
List<String> symptomsItems = [];
List<String> diagnosisItems = [];
List<String> reportsItems = [];
List<String> medicineItems = [];

List<dynamic> selectedSymptomsList = [];
List<dynamic> selectedDiagnosisList = [];
List<dynamic> selectedReportList = [];
List<MedicineModel> selectedMedicineList = [];
List<TextEditingController> durList = [];

String appointmentId = '';
String reportPathName = "";
String reportPath = "";

class PatientViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  //Navigate to Print View
  void goToPrint(
      {required userName,
      required age,
      required gender,
      required phoneNumber,
      required id,
      required appointId,
      required adviceText}) {
    _navigationService.navigateToPrintViewView(
        userName: userName,
        age: age,
        gender: gender,
        phoneNumber: phoneNumber,
        id: id,
        appointId: appointId,
        height: height,
        weight: weight,
        pulse: pulse,
        bp: bp,
        temperature: temp,
        medicine: selectedMedicineList,
        diagnosis: selectedDiagnosisList,
        symptoms: selectedSymptomsList,
        advice: adviceText,
        appointmentDate: DateFormat.yMMMd().format(appointmentDate).toString());
  }

//Format appointment dates
  String formattedMonth(index) {
    DateTime dateTime = DateTime.parse(patientAppointmentsList[index]
            ['appointmentDate']
        .toString()
        .split('T')
        .first);
    return DateFormat.MMMd().format(dateTime).toString().split(' ').first;
  }

// Function to group dates by year
  Map dateGroups = {};
  List checkAppoinmentCount = [];
  Map groupDatesByYear() {
    for (Map<String, dynamic> appointment in patientAppointmentsList) {
      String date = appointment['appointmentDate'];
      String year = date.substring(0, 4);
      if (dateGroups.containsKey(year)) {
        dateGroups[year]!.add(appointment);
      } else {
        dateGroups[year] = [appointment];
      }
    }
    return dateGroups;
  }

  //Get last appoinmet id
  String lastAppointmentId = '';
  getLastAppointmentId(data, index, datesInYear) {
    lastAppointmentId = '';
    if (data.key == 0 && index != 0) {
      lastAppointmentId =
          dateGroups[dateGroups.keys.elementAt(index - 1)]?[0]['id'];
    } else if (data.key != 0) {
      lastAppointmentId = datesInYear[data.key - 1]['id'];
    }
    checkPreviousAppointData(lastAppointmentId);
    notifyListeners();
  }

  //On instruction submit
  void onInputSubmit({advice}) {
    adviceCtrl.text = advice ?? '';
    postPatientData();
    dismissKeyboard();
    notifyListeners();
  }

  //Get advice controller
  // void setCrlValue({TextEditingController? ctrl}) {
  //   adviceCtrl = ctrl!;
  //   notifyListeners();
  // }

  TextEditingController customRange = TextEditingController();
  //Toggle day or month
  bool isMonthOrDay = false;
  String checkMonthOrDay = 'Day';
  void toggleDayMonth(name) {
    nextAppointRange = 0;
    checkMonthOrDay = name;
    postPatientData();
    notifyListeners();
  }

  //Select date of next appointment
  double nextAppointRange = 0.0;
  // int afterDay = 0;
  DateTime selectedDate = DateTime.now();
  DateTime newDateTime = DateTime.now();
  int tempRangeChecker = 0;
  void selectRange(int value, {index}) {
    if (index != null) {
      tempRangeChecker = index;
    }
    // afterDay = value;
    selectedDate = newDateTime;
    if (checkMonthOrDay == 'Day') {
      selectedDate = selectedDate.add(Duration(days: value));
    } else {
      selectedDate = addMonths(selectedDate, value);
    }
    nextAppointRange = value.toDouble();
    notifyListeners();
    postPatientData();
  }

  //Add month
  DateTime addMonths(DateTime date, int monthsToAdd) {
    int year = date.year;
    int month = date.month;
    int day = date.day;
    int newMonth = month + monthsToAdd;
    int newYear = year + newMonth ~/ 12;

    newMonth = newMonth % 12;
    if (newMonth == 0) {
      newMonth = 12;
      newYear--;
    }
    int lastDayOfMonth = DateTime(newYear, newMonth + 1, 0).day;
    if (day > lastDayOfMonth) {
      day = lastDayOfMonth;
    }
    return DateTime(newYear, newMonth, day);
  }

  //Next apppointment list
  List nextAppoinmentList = ['3', '5', '7', '10', '15', '30'];
  List nextAppointmentMonth = ['1', '2', '3', '6', '9', '12'];

  //Get report index
  int getReportIndex(reportName) {
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['reportName'] == reportName) {
        return i;
      }
    }
    return 0;
  }

  //Swipe reports
  void swipeReport({String action = "Next", reportName}) {
    int reportIndex = getReportIndex(reportName);
    if (action == "Next") {
      reportIndex = (reportIndex + 1) % selectedReportList.length;
    } else {
      reportIndex = (reportIndex - 1 + selectedReportList.length) %
          selectedReportList.length;
    }
    reportPath = selectedReportList[reportIndex]['filePath'];
    reportPathName = selectedReportList[reportIndex]['reportName'];
    notifyListeners();
  }

//navigate to report view
  void goToReportView({reportName, reportUrl}) {
    reportPath = reportUrl;
    reportPathName = reportName;
    notifyListeners();
    _navigationService.navigateTo(Routes.reportView);
  }

  //Go to back page
  void goback() {
    _navigationService.back();
  }

//Scroll appointments
  final ScrollController scrollController = ScrollController();
  void scrollList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
  }

  ///////////////////////////////////////////////////////////////Symptoms////////////////////////////////////////////////////////////
  //show symptom bottomsheet
  void showSymtomBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addSymptom);
    notifyListeners();
  }

  //Set data chip color, add data in list and remove
  void onChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedSymptomsList.contains(name)) {
        selectedSymptomsList.add(name);
      }
      // selectedChipIndex = index;
    } else {
      if (selectedSymptomsList.contains(name)) {
        selectedSymptomsList.remove(name);
      }
      // selectedChipIndex = -1;
    }
    postPatientData();
    notifyListeners();
  }

  // Remove Selected Symptoms
  void onSymptomChipDisplayTap(value) async {
    await showDialog();
    if (isSure) {
      selectedSymptomsList.removeAt(value);
      postPatientData();
      notifyListeners();
    }
  }

  //Search symptom Chip
  String searchQuery = '';
  void filterChipsSymptom(String query) {
    searchQuery = query;
    filteredChips = symptomsItems
        .where((chip) => chip.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////Diagnosis////////////////////////////////////////////////////////
  //Remove Diagnosis
  onDiagnosisChipDisplayTap(index) async {
    await showDialog();
    if (isSure) {
      selectedDiagnosisList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
  }

  //show diagnosis bottomsheet
  void showDiagnosisBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addDiagnosis);
    notifyListeners();
  }

  //Add or remove daignosis
  void onDiagnosisChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedDiagnosisList.contains(name)) {
        selectedDiagnosisList.add(name);
      }
    } else {
      if (selectedDiagnosisList.contains(name)) {
        selectedDiagnosisList.remove(name);
      }
    }
    postPatientData();
    notifyListeners();
  }

  //Search diagnosis Chip
  void filterChipsDiagnosis(String query) {
    searchQuery = query;
    filteredChips = diagnosisItems
        .where((chip) => chip.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////Report///////////////////////////////////////////////////////////////
  //Remove Reports
  onReportsChipDisplayTap(index) async {
    await showDialog();
    if (isSure) {
      selectedReportList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
  }

  //show report bottomsheet
  void showReportBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addReports);
    notifyListeners();
  }

//Check if path is avaiolbe in list then we cant romve item from list
  checkRemove(name) {
    bool returnValue = true;
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['reportName'] == name &&
          selectedReportList[i]['isUploaded']) {
        returnValue = false;
      }
    }
    return returnValue;
  }

  //Remove or add report using bottom sheet
  void onReportsChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedReportList.contains(name)) {
        selectedReportList
            .add({'reportName': name, 'isUploaded': false, 'filePath': ""});
      }
    } else {
      if (checkRemove(name)) {
        selectedReportList
            .removeWhere((element) => element['reportName'] == name);
      }
    }
    postPatientData();
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////Medicine//////////////////////////////////////////////////////////////////

  //show Medicines bottomsheet
  void showMedicineBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        isScrollControlled: true, variant: BottomSheetType.addMedicines);
    notifyListeners();
  }

  //Select unselect chip using bottom sheet
  void onMedicineChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedMedicineList.any((item) => item.medicine == name)) {
        selectedMedicineList.add(MedicineModel(
            medicine: name,
            dose: 'Select',
            when: 'Select',
            frequency: 'Select',
            duration: ' Select',
            instruction: ''));
        durList.add(TextEditingController());
        // instructionList.add(TextEditingController());
      }
      // selectedChipIndex = index;
    } else {
      if (selectedMedicineList.any((item) => item.medicine == name)) {
        selectedMedicineList.removeWhere((element) => element.medicine == name);
        doseList.removeLast();
        // notifyListeners();
      }
      // selectedChipIndex = -1;
    }
    postPatientData();
    notifyListeners();
  }

  //Search report Chip
  void filterChipsMedicine(String query) {
    searchQuery = query;
    filteredChips = medicineItems
        .where((chip) => chip.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //dose Date Dropdown Data
  final doseList = [
    'Select',
    '0-0-0',
    '1-0-0',
    '0-0-1',
    '1-0-1',
    '1-1-1',
    '1-1-0',
    '0-1-0',
    '0-1-1',
  ];

  // List<String> doseDropDown = [];
  changeDoseValue(value, index) {
    // doseDropDown.add(value);
    selectedMedicineList[index].dose = value;
    postPatientData();
    notifyListeners();
  }

  //When Dropdown Data
  final foodMedicine = [
    'Select',
    'Before Food',
    'After Food',
    'Before Breakfast',
    'After Breakfast',
    'Before Lunch',
    'After Lunch',
    'Before Dinner',
    'After Dinner',
    'Empty Stomach',
    'Bed Time',
    'SoS'
  ];

  // List<String> whenDropDown = [];
  changeFoodMedicineValue(value, index) {
    // whenDropDown.add(value);
    selectedMedicineList[index].when = value;
    postPatientData();
    notifyListeners();
  }

  //Frequency Data
  final frequencyList = [
    'Select',
    'Daily',
    'Alternate Day',
    'Weekly',
    'Fort Night',
    'Monthly'
  ];

  // List<String> frequencyDropDown = [];
  changeFrequencyValue(value, index) {
    // frequencyDropDown.add(value);
    selectedMedicineList[index].frequency = value;
    postPatientData();
    notifyListeners();
  }

  //Duration Data
  final durationList = ['Select', 'Days', 'Weeks', 'Months', 'Years'];
  // List<String> durationDropDown = [];
  changeDurationValue(value, index) {
    // durationDropDown.add(value);
    selectedMedicineList[index].duration =
        '${durList[index].text.trim()}  $value';
    postPatientData();
    notifyListeners();
  }

  //Copy  dose and set data to the next index
  copydoseDropdown(index) {
    selectedMedicineList[index + 1].dose = selectedMedicineList[index].dose;
    postPatientData();
    notifyListeners();
  }

  // Copy whenMedicine and set to the next index
  copywhenDropdown(index) {
    selectedMedicineList[index + 1].when = selectedMedicineList[index].when;
    postPatientData();
    notifyListeners();
  }

  //Copy frequency and set to the next index
  copyfrequencyDropdown(index) {
    selectedMedicineList[index + 1].frequency =
        selectedMedicineList[index].frequency;
    postPatientData();
    notifyListeners();
  }

  //Copy duration and set to the next index
  copydurationDropdown(index) {
    durList[index + 1].text =
        selectedMedicineList[index].duration.split(' ').first;
    selectedMedicineList[index + 1].duration =
        selectedMedicineList[index].duration;
    postPatientData();
    notifyListeners();
  }

  //Show dialog
  bool isSure = false;
  final _dialogService = locator<DialogService>();
  Future<void> showDialog() async {
    var res =
        await _dialogService.showCustomDialog(variant: DialogType.confirm);
    if (res!.data != null) {
      isSure = res.data;
    }
    notifyListeners();
  }

  //Remove  Medicine
  onMedicineChipDisplayTap(index) async {
    await showDialog();
    if (isSure) {
      undoMedicineList.add(MedicineModel(
          medicine: selectedMedicineList[index].medicine,
          dose: selectedMedicineList[index].dose,
          when: selectedMedicineList[index].when,
          frequency: selectedMedicineList[index].frequency,
          duration: selectedMedicineList[index].duration,
          instruction: selectedMedicineList[index].instruction));
      selectedMedicineList.removeAt(index);
      durList.removeAt(index);
      // instructionList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
  }

  //Undo medicines
  List<MedicineModel> undoMedicineList = [];
  void undoMedicine() {
    selectedMedicineList.add(undoMedicineList.last);
    durList.add(TextEditingController());
    // instructionList.add(TextEditingController());
    durList[selectedMedicineList.length - 1].text =
        selectedMedicineList[selectedMedicineList.length - 1]
            .duration
            .split(' ')
            .first;
    // instructionList[selectedMedicineList.length - 1].text =
    //     selectedMedicineList[selectedMedicineList.length - 1].instruction;
    undoMedicineList.removeLast();
    notifyListeners();
  }

  //Set duration and instruction controller values
  void setDurationCtrlValue({index}) {
    selectedMedicineList[index].duration =
        '${durList[index].text} ${selectedMedicineList[index].duration.split(' ').last}';
    postPatientData();
    // dismissKeyboard();
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////Api's Work///////////////////////////////////////////////////////////////
  final UserService _consultationService = locator<UserService>();

//Get all appointments
  List patientAppointmentsList = [];
  void getAllAppointDates(
      {id, bool isgetAllMedicalRecordsApiCall = false}) async {
    getSymptoms();
    patientAppointmentsList.clear();
    try {
      setBusy(true);
      var res = await _consultationService.getAppointmentDatesById(id);
      if (res.statusCode == 200) {
        patientAppointmentsList = res.data;
        getMedicalRecords(
            patientAppointmentsList[patientAppointmentsList.length - 1]['id'],
            patientAppointmentsList[patientAppointmentsList.length - 1],
            isComplete:
                patientAppointmentsList[patientAppointmentsList.length - 1]
                    ['isComplete']);
        if (patientAppointmentsList.length != 1) {
          lastAppointmentId =
              patientAppointmentsList[patientAppointmentsList.length - 2]['id'];
        }
        checkPreviousAppointData(lastAppointmentId);
        groupDatesByYear();
        notifyListeners();
      }
    } catch (e) {
      log('$e');
    } finally {
      // setBusy(false);
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////Medical Records///////////////////////////////////////////////////////////////////////

  //Clear all list
  void clearList() {
    selectedSymptomsList.clear();
    selectedDiagnosisList.clear();
    selectedReportList.clear();
    selectedMedicineList.clear();
    durList.clear();
    adviceCtrl.clear();
    customRange.clear();
    notifyListeners();
  }

  //Set data to the fields
  TextEditingController adviceCtrl = TextEditingController();
  void setData() {
    selectedSymptomsList = res.data['symptoms'];
    selectedDiagnosisList = res.data['diagnosis'];
    selectedReportList = res.data['reportFile'];
    height = res.data["userHeight"].toString();
    weight = res.data["userWeight"].toString();
    pulse = res.data["userPulse"].toString();
    bp =
        '${res.data['userBloodPressure'] ?? ''}/${res.data['userBloodpressureHigh'] ?? '0'}';
    temp = res.data["temprature"].toString();
    adviceCtrl.text = res.data["advice"].toString();
    checkMonthOrDay = res.data['nextAppointmentGapIn'].toString();
    nextAppointRange = double.parse(
        res.data['nextAppointmentDay'].toString() == 'null'
            ? '0.0'
            : res.data['nextAppointmentDay'].toString());
    for (var i = 0; i < res.data["medicineData"].length; i++) {
      durList.add(TextEditingController());
      selectedMedicineList.add(MedicineModel(
          medicine: res.data['medicineData'][i]['medicine'] ?? '',
          dose: res.data['medicineData'][i]['dose'] ?? 'Select',
          when: res.data['medicineData'][i]['when'] ?? 'Select',
          frequency: res.data['medicineData'][i]['frequency'] ?? 'Select',
          duration: res.data['medicineData'][i]['duration'] ?? 'Select',
          instruction: res.data['medicineData'][i]['instruction'] ?? ''));
      durList[i].text = selectedMedicineList[i].duration.split(' ').first;
    }
    bool checkCustomRange = true;
    for (var item in nextAppoinmentList) {
      checkCustomRange = true;
      if (res.data['nextAppointmentDay'].toString() == item ||
          res.data['nextAppointmentDay'].toString() == "null") {
        checkCustomRange = false;
        break;
      }
    }
    if (checkCustomRange) {
      customRange.text = res.data['nextAppointmentDay'].toString();
    }
    // scrollAppointment();
    notifyListeners();
  }

//Get medical records of patient by appointment id
  late Response res;
  bool isConsultationComplete = false;
  bool isScroll = true;
  String height = "", weight = "", temp = "", bp = "", pulse = "";
  late DateTime appointmentDate;
  void getMedicalRecords(id, data, {isComplete}) async {
    appointmentDate = DateTime.parse(data['appointmentDate']);
    isConsultationComplete = isComplete;
    clearList();
    appointmentId = id;
    notifyListeners();
    try {
      setBusy(true);
      res = await _consultationService.getMedicalRecords(id);
      if (res.statusCode == 200 &&
          res.data != 'No reports found.' &&
          res.data != "No Record Found" &&
          res.data != "No Data Found" &&
          res.data['id'] != null) {
        setData();
      } else {
        height = res.data['userHeight'].toString();
        weight = res.data['userWeight'].toString();
        temp = res.data['temprature'].toString();
        pulse = res.data['userPulse'].toString();
        bp =
            '${res.data['userBloodPressure'] ?? ''}/${res.data['userBloodpressureHigh'] ?? '0'}';
        notifyListeners();
      }
    } on Error catch (error) {
      log('$error');
    } finally {
      setBusy(false);
      if (isScroll) {
        scrollList();
        isScroll = false;
      }
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Check previou appointment data is available or not
  Map<String, dynamic> checkPreviousDataList = {};
  Future<void> checkPreviousAppointData(appointId) async {
    setBusy(true);
    checkPreviousDataList.clear();
    if (appointId != "") {
      try {
        var res = await _consultationService.getMedicalRecords(appointId);
        if (res.data != 'No reports found.' &&
            res.data != "No Record Found" &&
            res.data != "No Data Found" &&
            res.statusCode == 200) {
          checkPreviousDataList = res.data;
          notifyListeners();
        }
      } catch (e) {
        log('$e');
      }
    }
  }

  //Remove duplicate report
  removeDuplicateReport(name) {
    bool returnValue = true;
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['reportName'] == name) {
        returnValue = false;
        break;
      }
    }
    return returnValue;
  }

  //Copy previous appointment data
  List tempList = [];
  void copyDataLastAppointment({listName}) async {
    tempList.clear();
    try {
      var res = await _consultationService.getMedicalRecords(lastAppointmentId);
      if (listName == 'Add Symptoms') {
        tempList = res.data['symptoms'] as List;
        selectedSymptomsList.addAll(tempList);
        selectedSymptomsList = selectedSymptomsList.toSet().toList();
      } else if (listName == 'Add Report') {
        tempList = res.data['reportFile'];
        for (var i = 0; i < tempList.length; i++) {
          if (removeDuplicateReport(tempList[i]['reportName'])) {
            selectedReportList.add({
              'reportName': tempList[i]['reportName'],
              'filePath': tempList[i]['filePath'],
              'isUploaded': tempList[i]['isUploaded']
            });
          }
        }
      } else if (listName == 'Add Diagnosis') {
        tempList = res.data['diagnosis'];
        selectedDiagnosisList.addAll(tempList);
        selectedDiagnosisList = selectedDiagnosisList.toSet().toList();
      } else if (listName == 'Add Medicine') {
        tempList = res.data['medicineData'];
        var selectedMedicineCount = selectedMedicineList.length;
        if (selectedMedicineCount == 0) {
          selectedMedicineCount = 1;
        }
        for (var ele in tempList) {
          durList.add(TextEditingController());
          // instructionList.add(TextEditingController());
          selectedMedicineList.add(MedicineModel(
            medicine: ele['medicine'],
            dose: ele['dose'],
            when: ele['when'],
            frequency: ele['frequency'],
            duration: ele['duration'],
            instruction: ele['instruction'],
          ));
        }
        for (var i = selectedMedicineCount - 1;
            i < selectedMedicineCount + tempList.length;
            i++) {
          if (i < durList.length) {
            // instructionList[i].text = selectedMedicineList[i].instruction;
            durList[i].text = selectedMedicineList[i].duration.split(' ').first;
          }
        }
        selectedMedicineList = selectedMedicineList.fold<List<MedicineModel>>(
          <MedicineModel>[],
          (List<MedicineModel> uniqueList, MedicineModel element) {
            if (!uniqueList
                .any((MedicineModel e) => e.medicine == element.medicine)) {
              uniqueList.add(element);
            }
            return uniqueList;
          },
        );
      }
      postPatientData();
      notifyListeners();
    } on Error catch (e) {
      log('$e');
    } finally {}
  }

  ///////////////////////////////////Get and Post Symptom ,diagnosis ,reports and medicines//////////////////////////////////////////////
  //Get All Symptoms
  Future<void> getSymptoms() async {
    try {
      setBusy(true);
      symptomsItems.clear();
      reportsItems.clear();
      diagnosisItems.clear();
      medicineItems.clear();
      var response = await _consultationService.getSymptoms();
      symptomsItems = (response.data['symptoms'] as List)
          .map((ele) => ele['symptom1'] as String)
          .toList();
      diagnosisItems = (response.data['diagnosis'] as List)
          .map((ele) => ele['diagnose'] as String)
          .toList();
      reportsItems = (response.data['report'] as List)
          .map((ele) => ele['report1'] as String)
          .toList();
      medicineItems = (response.data['medicine'] as List)
          .map((ele) => ele['medicines'] as String)
          .toList();
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      // setBusy(false);
    }
  }

  //Post symptoms
  Future<void> addSymptoms({required symptomsName}) async {
    try {
      setBusy(true);
      var data = {'symptoms': symptomsName, 'isDoctor': true};
      await _consultationService.addSymptoms(data).then((value) async {
        await getSymptoms();
        selectedSymptomsList.add(symptomsName);
        postPatientData();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post diagnosis
  Future<void> addDiagnosis({required diagnosisName}) async {
    try {
      setBusy(true);
      var data = {'diagnose': diagnosisName, 'isDoctor': true};
      await _consultationService.addDiagnosis(data).then((value) async {
        await getSymptoms();
        selectedDiagnosisList.add(diagnosisName);
        postPatientData();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post reports
  Future<void> addReports({required reportName}) async {
    try {
      setBusy(true);
      var data = {'report1': reportName, 'isDoctor': true};
      await _consultationService.addReport(data).then((value) async {
        await getSymptoms();
        selectedReportList.add(
            {'reportName': reportName, 'filePath': '', 'isUploaded': false});
        postPatientData();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post medicine
  Future<void> addMedicine({required medicineName}) async {
    try {
      setBusy(true);
      var data = {'medicines': medicineName, 'isDoctor': true};
      await _consultationService.addMedicine(data).then((value) async {
        await getSymptoms();
        durList.add(TextEditingController());
        selectedMedicineList.add(MedicineModel(
            medicine: medicineName,
            dose: 'Select',
            when: 'Select',
            frequency: 'Select',
            duration: ' Select',
            instruction: ''));
        postPatientData();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

//////////////////////////////////////////////////////////////////////////Post All Medical Records/////////////////////////////////////////////////////////////
  //Change report data in required format data
  changeApiJson() {
    List reports = [];
    for (var i = 0; i < selectedReportList.length; i++) {
      reports.add(selectedReportList[i]['reportName']);
    }
    return reports;
  }

  //Post Patient Data
  Future<void> postPatientData() async {
    String time = selectedDate.toString();
    String formattedTime = time.replaceAll(' ', 'T');
    try {
      var data = {
        "id": appointmentId,
        "assistantId": "00000000-0000-0000-0000-000000000000",
        "symptoms": selectedSymptomsList,
        "diagnosis": selectedDiagnosisList,
        "reports": changeApiJson(),
        "medicines": selectedMedicineList,
        "advice": adviceCtrl.text,
        "appointmentId": "00000000-0000-0000-0000-000000000000",
        "nextVisit": formattedTime,
        'nextAppointmentDay':
            int.parse(nextAppointRange.toString().split('.').first),
        'nextAppointmentGapIn': checkMonthOrDay
      };
      await _consultationService.addRerord(data).then((value) {
        log('$value');
      });
    } on Error catch (err) {
      log('$err');
    } finally {}
  }
}
