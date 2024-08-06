import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '/app/app.bottomsheets.dart';
import '/ui/common/utils.dart';
import '../../../app/app.dialogs.dart';
import '/model/index.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/consultation_service.dart';
import '/api/api_error.dart';

int selectedChipIndex = -1;
int selectedChipIndexDiagnosis = -1;

List<String> filteredChips = [];
List<String> diagnosisItems = [];
List<String> symptomsItems = [];
List<String> reportsItems = [];
List<String> medicineItems = [];

List<dynamic> selectedDiagnosisList = [];
List<dynamic> selectedSymptomsList = [];
List<dynamic> selectedReportList = [];
List<MedicineModel> selectedMedicineList = [];
List<TextEditingController> durList = [];
List<TextEditingController> instructionList = [];
String appointmentId = "";
String reportPath = "";
String reportPathName = "";

class ConsultationViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<MedicineModel> medicineList = [];

  //stepper index change
  int activeStep = -1;
  stepperIndexChange(index) {
    activeStep = index + 1;
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
  List<String> doseDropDown = [];
  List<String> medicineName = [];
  changeDoseValue(value, index) {
    doseDropDown.add(value);
    selectedMedicineList[index].dose = value;
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

  //Copy instruction and set to the next index
  copyInstruction(index) {
    instructionList[index + 1].text = selectedMedicineList[index].instruction;
    selectedMedicineList[index + 1].instruction =
        selectedMedicineList[index].instruction;
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
  List<String> whenDropDown = [];
  changeFoodMedicineValue(value, index) {
    whenDropDown.add(value);
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
  List<String> frequencyDropDown = [];
  changeFrequencyValue(value, index) {
    frequencyDropDown.add(value);
    selectedMedicineList[index].frequency = value;
    postPatientData();
    notifyListeners();
  }

  //Duration Data
  final durationList = ['Select', 'Days', 'Weeks', 'Months', 'Years'];
  List<String> durationDropDown = [];
  changeDurationValue(value, index) {
    durationDropDown.add(value);
    selectedMedicineList[index].duration =
        durList[index].text.trim() + ' ' + value;
    postPatientData();
    notifyListeners();
  }

  //Add instruction
  void onChangeInstruction(String instruction, int index) {
    selectedMedicineList[index].instruction = instruction;
    notifyListeners();
  }

  ////////////////////////////////////////////////symptoms////////////////////////////////////////////////////////////////////////////

  //show symptom bottomsheet
  void showSymtomBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        barrierColor: Colors.blue.shade50,
        isScrollControlled: true,
        variant: BottomSheetType.selectItem,
        data: selectedSymptomsList);
    notifyListeners();
  }

  //Set data chip color, add data in list and remove
  void onChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedSymptomsList.contains(name)) {
        selectedSymptomsList.add(name);
      }
      selectedChipIndex = index;
    } else {
      if (selectedSymptomsList.contains(name)) {
        selectedSymptomsList.remove(name);
      }
      selectedChipIndex = -1;
    }
    postPatientData();
    notifyListeners();
  }

  // Remove Selected Symptoms
  onSymptomChipDisplayTap(value) async {
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
  ////////////////////////////////////////////////Diagnosis///////////////////////////////////////////////////////////////

  //show diagnostic bottomsheet
  void showDiagnosisBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        barrierColor: Colors.blue.shade50,
        isScrollControlled: true,
        variant: BottomSheetType.addDiagnosis,
        data: selectedDiagnosisList);
    notifyListeners();
  }

  void onDiagnosisChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedDiagnosisList.contains(name)) {
        selectedDiagnosisList.add(name);
      }
      selectedChipIndex = index;
    } else {
      if (selectedDiagnosisList.contains(name)) {
        selectedDiagnosisList.remove(name);
      }
      selectedChipIndex = -1;
    }
    postPatientData();
    notifyListeners();
  }

  //Remove Diagnosis
  onDiagnosisChipDisplayTap(index) async {
    await showDialog();
    if (isSure) {
      selectedDiagnosisList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
  }

  //Search diagnosis Chip
  void filterChipsDiagnosis(String query) {
    searchQuery = query;
    filteredChips = diagnosisItems
        .where((chip) => chip.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
  ////////////////////////////////////////////////Reports/////////////////////////////////////////////////////////////

  //show report bottomsheet
  void showReportBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        barrierColor: Colors.blue.shade50,
        isScrollControlled: true,
        variant: BottomSheetType.addReport,
        data: selectedReportList);
    notifyListeners();
  }

  //Check if path is avaiolbe in list then we cant romve item from list
  checkRemove(name) {
    bool returnValue = true;
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['name'] == name &&
          selectedReportList[i]['isActive']) {
        returnValue = false;
      }
    }
    return returnValue;
  }

  void onReportsChipSelect(bool selected, String name, int index) {
    if (selected) {
      if (!selectedReportList.contains(name)) {
        selectedReportList.add(
            {'name': name, 'isActive': checkIsActivePath(name), 'path': ""});
      }
      selectedChipIndex = index;
    } else {
      if (checkRemove(name)) {
        selectedReportList.removeWhere((element) => element['name'] == name);
      }
      selectedChipIndex = -1;
    }
    postPatientData();
    notifyListeners();
  }

  //Remove Reports
  onReportsChipDisplayTap(index) async {
    await showDialog();
    if (isSure) {
      selectedReportList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
  }

  //Search report Chip
  void filterChipsReport(String query) {
    searchQuery = query;
    filteredChips = reportsItems
        .where((chip) => chip.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
  ////////////////////////////////////////////////Medicines/////////////////////////////////////////////////////////////

  //show Medicines bottomsheet
  void showMedicineBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
        barrierColor: Colors.blue.shade50,
        isScrollControlled: true,
        variant: BottomSheetType.addMedicine,
        data: selectedMedicineList.map((name) => name.medicine).toList());
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
      instructionList.removeAt(index);
      postPatientData();
      notifyListeners();
    }
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
        instructionList.add(TextEditingController());
      }
      selectedChipIndex = index;
    } else {
      if (selectedMedicineList.any((item) => item.medicine == name)) {
        selectedMedicineList.removeWhere((element) => element.medicine == name);
        // notifyListeners();
      }
      selectedChipIndex = -1;
    }
    print(selectedMedicineList);
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

  //Undo Medicine
  List<MedicineModel> undoMedicineList = [];
  void undoMedicine() {
    selectedMedicineList.add(undoMedicineList.last);
    durList.add(TextEditingController());
    instructionList.add(TextEditingController());
    durList[selectedMedicineList.length - 1].text =
        selectedMedicineList[selectedMedicineList.length - 1]
            .duration
            .split(' ')
            .first;
    instructionList[selectedMedicineList.length - 1].text =
        selectedMedicineList[selectedMedicineList.length - 1].instruction;
    undoMedicineList.removeLast();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //Get User Id
  String id = '';
  String appointId = '';
  getId(uid, apptId) {
    appointId = apptId;
    id = uid;
    notifyListeners();
  }

  //Change report to print format
  List<String> formattedReport = [];
  changeReportToPrintFormat() {
    for (var i = 0; i < selectedReportList.length; i++) {
      formattedReport.add(selectedReportList[i]['name']);
      notifyListeners();
    }
  }

  //Go to printpreview page
  goToPrintPreview(
      {required advice,
      required height,
      required weight,
      required bp,
      required phoneNumber,
      required age,
      required gender,
      required pulse,
      required temperature,
      required userName}) async {
    changeReportToPrintFormat();
    SharedPreferences pre = await SharedPreferences.getInstance();
    String? doctor = pre.getString("docName");
    String? number = pre.getString("phoneNumber");
    String? specialization = pre.getString("specialization");
    _navigationService.navigateTo(Routes.printView,
        arguments: PrintViewArguments(
            advice: advice,
            phoneNumber: phoneNumber,
            userName: userName,
            age: age,
            gender: gender,
            complaints: selectedSymptomsList.join(' , ').toString(),
            diagnosis: selectedDiagnosisList.join(' , ').toString(),
            reports: formattedReport.join(' , ').toString(),
            medicine: selectedMedicineList,
            height: height,
            weight: weight,
            bp: bp,
            doctor: doctor,
            number: number,
            pulse: pulse,
            temperature: temperature,
            specialization: specialization,
            activeStep: DateFormat.yMMMd().format(date).toString()));
    postPatientData();
  }

  //Go to Back page
  goToBack() {
    _navigationService.back();
  }

  //Passing Advice Text
  // void adviceText(TextEditingController adviceController) {
  //   adviceController.text = adviceController.text + " Advice is here";
  //   postPatientData();
  //   notifyListeners();
  // }

  //Set Date Format
  DateTime date = DateTime.now();
  String formattedMonth(index) {
    DateTime dateTime = DateTime.parse(
        dateList[index]['appointmentDate'].toString().split('T').first);
    return DateFormat.MMMd().format(dateTime).toString();
  }

  //Get index Date
  void getDate(index) {
    date = DateTime.parse(
        dateList[index]['appointmentDate'].toString().split('T').first);
    notifyListeners();
  }

  //Get All Controller
  TextEditingController adviceCtrl = TextEditingController();
  // TextEditingController? nextAppointCtrl;
  void getControllers({
    required TextEditingController adviceCtr,
    // required TextEditingController nextAppointCtr
  }) {
    adviceCtrl = adviceCtr;
    // nextAppointCtrl = nextAppointCtr;
    notifyListeners();
  }

  //Set Vital and Advice Values
  void setVitalAndAdviceValue({
    required String advice,
    String? nextAppoint,
  }) {
    adviceCtrl.text = advice;
    // nextAppointCtrl!.text = nextAppoint.toString().split(' ').first;
    selectedDate =
        nextAppoint == null ? DateTime.now() : DateTime.parse(nextAppoint);
    notifyListeners();
  }

  //On instruction submit
  void onInputSubmit({advice}) {
    adviceCtrl.text = advice ?? '';
    notifyListeners();
    postPatientData();
    dismissKeyboard();
  }

  //Set duration and instruction controller values
  void setDurationCtrlValue({index}) {
    selectedMedicineList[index].duration = durList[index].text +
        ' ' +
        selectedMedicineList[index].duration.split(' ').last;
    postPatientData();
    dismissKeyboard();
    notifyListeners();
  }

  //View Pdf File
  void viewPdf(base64Data, fileName) async {
    try {
      setBusy(true);
      Future.delayed(const Duration(seconds: 1)).then((value) async {
        var bytes = base64Decode(base64Data);
        final output = await getTemporaryDirectory();
        final file = File("${output.path}/$fileName.pdf");
        await file.writeAsBytes(bytes.buffer.asUint8List());
        await OpenFilex.open("${output.path}/$fileName.pdf");
        setBusy(false);
      });
      notifyListeners();
    } catch (e) {
      log('$e');
    } finally {}
  }

  //Show dialog
  bool isSure = false;
  final _dialogService = locator<DialogService>();
  Future<void> showDialog() async {
    var res =
        await _dialogService.showCustomDialog(variant: DialogType.infoAlert);
    if (res!.data != null) {
      isSure = res.data;
    }
    notifyListeners();
  }

  // // Pass report name to drawer
  // String reportName = '';
  // void getReportName(String report) {
  //   reportName = report;
  //   notifyListeners();
  // }

  //navigate to report view
  void goToReportView({reportName, reportUrl}) {
    reportPath = reportUrl;
    reportPathName = reportName;
    notifyListeners();
    _navigationService.navigateTo(Routes.reportView,
        arguments:
            ReportViewArguments(reportUrl: reportUrl, reportName: reportName));
  }

  //Pick date for next appointment
  // Future<void> pickNextAppointment(
  //     BuildContext context, TextEditingController ctrl) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: selectedDate,
  //       lastDate: DateTime(2090));
  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     ctrl.text = picked.toString().split(' ').first;
  //     notifyListeners();
  //     postPatientData();
  //   }
  // }

  //Select date of next appointment
  double nextAppointRange = 0.0;
  // int afterDay = 0;
  DateTime selectedDate = DateTime.now();
  DateTime newDateTime = DateTime.now();
  int tempRangeChecker = 0;
  void selectRange(int value) {
    // afterDay = value;
    selectedDate = newDateTime;
    if (checkMonthOrDay == 'Day') {
      selectedDate = selectedDate.add(Duration(days: value));
    } else {
      selectedDate = addMonths(selectedDate, value);
    }

    // final int dayDifference = value - tempRangeChecker;
    // selectedDate = dayDifference >= 0
    //     ? selectedDate.add(Duration(days: dayDifference))
    //     : selectedDate.subtract(Duration(days: -dayDifference));
    // tempRangeChecker = value;
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

  //Get report index
  int getReportIndex(reportName) {
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['name'] == reportName) {
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
    reportPath = selectedReportList[reportIndex]['path'];
    reportPathName = selectedReportList[reportIndex]['name'];
    notifyListeners();
  }

  //Toggle day or month
  bool isMonthOrDay = false;
  String checkMonthOrDay = '';
  void toggleDayMonth(name) {
    nextAppointRange = 0;
    checkMonthOrDay = name;
    postPatientData();
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////Api's Work///////////////////////////////////////////////////////////////////////
  final ConsultationService _consultationService =
      locator<ConsultationService>();

  //Initial Function
  // void initFunction() {
  //   getSymptoms();
  // }

  //Get All Symptoms
  Future<void> getSymptoms() async {
    try {
      // setBusy(true);
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
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      // setBusy(false);
    }
  }

  //Post symptoms
  void addSymptoms(
      {required symptomsName,
      required TextEditingController controller}) async {
    try {
      setBusy(true);
      var data = {'symptoms': symptomsName, 'isDoctor': true};
      await _consultationService.addSymptoms(data).then((value) async {
        await getSymptoms();
        selectedSymptomsList.add(symptomsName);
        controller.clear();
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
  void addDiagnosis(
      {required diagnosisName,
      required TextEditingController controller}) async {
    try {
      setBusy(true);
      var data = {'diagnose': diagnosisName, 'isDoctor': true};
      await _consultationService.addDiagnosis(data).then((value) async {
        await getSymptoms();
        selectedDiagnosisList.add(diagnosisName);
        controller.clear();
        postPatientData();
        notifyListeners();
      });
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Post reports
  void addReports(
      {required reportName, required TextEditingController controller}) async {
    try {
      setBusy(true);
      var data = {'report1': reportName, 'isDoctor': true};
      await _consultationService.addReport(data).then((value) async {
        await getSymptoms();
        selectedReportList.add(reportName);
        controller.clear();
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
  void addMedicine(
      {required medicineName,
      required TextEditingController controller}) async {
    try {
      setBusy(true);
      var data = {'medicines': medicineName, 'isDoctor': true};
      await _consultationService.addMedicine(data).then((value) async {
        await getSymptoms();
        selectedMedicineList.add(MedicineModel(
            medicine: medicineName,
            dose: 'Select',
            when: 'Select',
            frequency: 'Select',
            duration: ' Select',
            instruction: ''));
        controller.clear();
        postPatientData();
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //Change report data in required format data
  changeApiJson() {
    List reports = [];
    for (var i = 0; i < selectedReportList.length; i++) {
      reports.add(selectedReportList[i]['name']);
    }
    return reports;
  }

  //Post Patient Data
  Future<void> postPatientData(
      {advice, height, weight, pulse, bp, temp}) async {
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

  //Get All Appointments Date
  List dateList = [];
  void getAppointDatesById(
      {id, bool isgetAllMedicalRecordsApiCall = false}) async {
    try {
      setBusy(true);
      await _consultationService.getAppointmentDatesById(id).then((value) {
        dateList = value.data;
        // screenCounter = dateList.length - 1;
        if (reloadCount == 0) getAllMedicalRecords(dateList.length - 1);
        if (reloadCount != 0) {
          activeStep = reloadCount;
        } else {
          activeStep = dateList.length;
        }
        if (isgetAllMedicalRecordsApiCall) {
          getAllMedicalRecords(selectDateByMediIndex);
        }
      });
      notifyListeners();
    } catch (e) {
      log('$e');
    } finally {
      // setBusy(false);
    }
    notifyListeners();
  }

  //Check is reportpath is available or not
  bool checkIsActivePath(name) {
    bool returnValue = false;
    for (var i = 0; i < tempReportUrlList.length; i++) {
      if (tempReportUrlList[i]['reportPath'] != "" &&
          tempReportUrlList[i]['reportName'] == name) {
        returnValue = true;
        break;
      }
    }
    return returnValue;
  }

  //Get All Previous Reports By Id
  bool isData = false;
  bool isComplete = false;
  int selectDateByMediIndex = 0;
  int reloadCount = 0;
  List initMedicineList = [];
  List tempReportUrlList = [];
  String? height, weight, pulse, bp, temp;
  void getAllMedicalRecords(index) async {
    if (index > 0) {
      await checkPreviousAppointData(dateList[index - 1]['id']);
    }
    setBusy(true);
    lastAppointmentIndex = index;
    appointmentId = dateList[index]['id'];
    selectDateByMediIndex = index;
    reloadCount = index + 1;
    selectedSymptomsList.clear();
    selectedDiagnosisList.clear();
    selectedReportList.clear();
    selectedMedicineList.clear();
    initMedicineList.clear();
    undoMedicineList.clear();
    durList.clear();
    instructionList.clear();
    adviceCtrl.clear();
    // heightCtrl!.clear();
    // weightCtrl!.clear();
    // pulseCtrl!.clear();
    // bpCtrl!.clear();
    // tempCtrl!.clear();a8f6
    try {
      var res = await _consultationService.getMedicalRecords(appointmentId);
      var reportRes =
          await _consultationService.getReportUrl(appointmentId: appointmentId);

      if (reportRes.data != 'No reports found.') {
        tempReportUrlList = reportRes.data;
        height = res.data['height'].toString();
        weight = res.data['weight'].toString();
        bp = res.data['bloodPressure'].toString();
        temp = res.data['temprature'].toString();
        pulse = res.data['pulse'].toString();
      }
      isData = true;
      if (res.data.toString() == '{}') isData = false;
      isComplete = dateList[index]['isComplete'];
      if (isData) {
        nextAppointRange = double.parse(
            res.data['nextAppointmentDay'].toString() == 'null'
                ? '0.0'
                : res.data['nextAppointmentDay'].toString());
        checkMonthOrDay = res.data['nextAppointmentGapIn'].toString();
        selectedSymptomsList = res.data['symptoms'] as List;
        selectedDiagnosisList = res.data['diagnosis'];
        // selectedReportList = [];
        for (var i = 0; i < res.data['reports'].length; i++) {
          selectedReportList.add({
            'name': res.data['reports'][i],
            'isActive': checkIsActivePath(res.data['reports'][i]),
            'path': tempReportUrlList[i]['reportPath']
          });
        }
        initMedicineList = res.data["medicineData"];
        for (var ele in initMedicineList) {
          durList.add(TextEditingController());
          instructionList.add(TextEditingController());
          doseDropDown.add(ele['dose']);
          whenDropDown.add(ele['when']);
          frequencyDropDown.add(ele['frequency']);
          durationDropDown.add(ele['duration'].toString().split(' ').last);
          medicineName.add(ele['medicine']);
          selectedMedicineList.add(MedicineModel(
              medicine: ele['medicine'],
              dose: ele['dose'],
              when: ele['when'],
              frequency: ele['frequency'],
              duration: ele['duration'],
              instruction: ele['instruction']));
        }
        for (var i = 0; i < initMedicineList.length; i++) {
          instructionList[i].text = selectedMedicineList[i].instruction;
          durList[i].text = selectedMedicineList[i].duration.split(' ').first;
        }
        setVitalAndAdviceValue(
            advice: res.data['advice'].toString(),
            nextAppoint: res.data['nextVisit']);
      }
      notifyListeners();
    } catch (e) {
      log('$e');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

  //Complete Consultaion
  // void completeConsul() async {
  //   try {
  //     setBusy(true);
  //     await _consultationService.completeConsul(appointmentId);
  //     getAppointDatesById(id: id, isgetAllMedicalRecordsApiCall: true);
  //     notifyListeners();
  //   } catch (e) {
  //     log('$e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  //Get reportes by appointment id
  // String base64Image = '';
  // String notUploaded = '';
  // Future<void> getReportesByAppointmentId({report, id}) async {
  //   base64Image = '';
  //   try {
  //     setBusy(true);
  //     var res = await _consultationService.getReports(
  //         appointmentId: id, reportName: report);
  //     if (res.statusCode == 200) {
  //       base64Image = '$baseurl${res.data.toString()}';
  //     } else if (res.statusCode == 400) {
  //       notUploaded = res.data;
  //     }
  //     notifyListeners();
  //   } on Error catch (err) {
  //     log('$err');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  //Remove duplicate report
  removeDuplicateReport(name) {
    bool returnValue = true;
    for (var i = 0; i < selectedReportList.length; i++) {
      if (selectedReportList[i]['name'] == name) {
        returnValue = false;
        break;
      }
    }
    return returnValue;
  }

  //Copy data of last appointment
  int lastAppointmentIndex = 0;
  List tempList = [];
  String lastAppId = '';
  void copyDataLastAppointment({index, listName}) async {
    tempList.clear();
    if (index >= 0) {
      lastAppId = dateList[index]['id'];
      try {
        var res = await _consultationService.getMedicalRecords(lastAppId);
        if (listName == 'Add Symptoms') {
          tempList = res.data['symptoms'] as List;
          selectedSymptomsList.addAll(tempList);
          selectedSymptomsList = selectedSymptomsList.toSet().toList();
        } else if (listName == 'Add Report') {
          tempList = res.data['reports'];
          for (var i = 0; i < tempList.length; i++) {
            if (removeDuplicateReport(tempList[i])) {
              selectedReportList.add({
                'name': tempList[i],
                'isActive': checkIsActivePath(tempList[i]),
                'path': ""
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
            instructionList.add(TextEditingController());
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
            if (i < instructionList.length && i < durList.length) {
              instructionList[i].text = selectedMedicineList[i].instruction;
              durList[i].text =
                  selectedMedicineList[i].duration.split(' ').first;
            }
          }
          selectedMedicineList = selectedMedicineList.fold<List<MedicineModel>>(
            <MedicineModel>[],
            (List<MedicineModel> uniqueList, MedicineModel element) {
              if (!uniqueList.any((MedicineModel e) =>
                  e.medicine == element.medicine &&
                  e.dose == element.dose &&
                  e.when == element.when &&
                  e.frequency == element.frequency &&
                  e.duration == element.duration &&
                  e.instruction == element.instruction)) {
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
  }

  // Check previou appointment data is available or not
  Map<String, dynamic> checkPreviousDataList = {};
  Future<void> checkPreviousAppointData(appointId) async {
    setBusy(true);
    checkPreviousDataList.clear();
    try {
      var res = await _consultationService.getMedicalRecords(appointId);
      if (res.data != 'No reports found.' && res.data != "No Record Found") {
        checkPreviousDataList = res.data;
      }
      notifyListeners();
    } catch (e) {
      log('$e');
    } finally {
      // setBusy(true);
    }
  }
}
