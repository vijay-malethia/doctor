import 'dart:developer';
import 'package:image_cropper/image_cropper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/patient_service.dart';
import '../../common/app_strings.dart';
import '/app/app.bottomsheets.dart';

String appointId = '';
String name = '';
List<dynamic> selectedReports = [];
bool longPressed = false;
List<Map<String, dynamic>> selectedReportsData = [];

class ReportViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final PatientService _patientService = locator<PatientService>();

//on long press
  void toggleSelection({index}) {
    longPressed = true;
    if (index != null) {
      reportList[index]['selected'] = !reportList[index]['selected'];
    }
    notifyListeners();
  }

  // back to unselected reportspage
  void back() {
    longPressed = false;
    setSelectedValue();
    notifyListeners();
  }

//Upload options bottomsheet
  void showUploadOptionsBottomSheet(reportName, id) async {
    name = reportName;
    appointId = id;
    notifyListeners();
    var res = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.uploadOptions);
    if (res != null) {
      if (res.data == 'pdf') {
        pickDocument();
      } else {
        pickImage(res.data);
      }
    }
    notifyListeners();
  }

// pick image
  void pickImage(source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // Crop the picked image file
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
          ]);

      if (croppedFile != null) {
        uploadFile(
          fileName: croppedFile.path.split('/').last,
          filePath: croppedFile.path,
          reportName: name,
          id: appointId,
        );
      }
      notifyListeners();
    }
  }

  //pick Document file
  void pickDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      PlatformFile file = result.files.first;
      String filePath = file.path!;
      String fileName = file.name;
      uploadFile(
        fileName: fileName,
        filePath: filePath,
        id: appointId,
        reportName: name,
      );
    }
  }

//navigate previous screen
  void goBack() {
    _navigationService.back();
  }

// navigate report preview screen
  String base64Data = '';
  String reportName = '';
  preview(index) async {
    base64Data = 'http://103.30.75.131:444${reportList[index]['reportPath']}';
    reportName = reportList[index]['reportName'];
    _navigationService.navigateTo(Routes.reportPreviewView,
        arguments: ReportPreviewViewArguments(
            base64Data: base64Data, indexName: reportName));
  }

//share reports to other app
  void shareSelectedReports() {
    String sharedText = '';
    for (var report in reportList) {
      if (report['selected']) {
        if (sharedText == '') {
          sharedText += report['id'];
        } else {
          sharedText += ',' + report['id'];
        }
      }
    }
    Share.share(url + appointmentId + '/' + sharedText);
    notifyListeners();
  }

  //select unselect report to share
  setSelectedValue() {
    for (var element in reportList) {
      element['selected'] = false;
    }
  }

  /////////////////////////////////////////////////////////////////////////APIs Work///////////////////////////////////////////////////////////////////////////////

  var reportList = [];
  String appointmentId = '';
  //get list of reports name
  Future<void> getReportsName({id}) async {
    longPressed = false;
    reportList.clear();
    appointmentId = id;
    try {
      setBusy(true);
      var res = await _patientService.getListImageUrl(id);
      reportList = res.data;
      setSelectedValue();
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

  //upload Image
  void uploadFile({fileName, filePath, id, reportName}) async {
    try {
      setBusy(true);
      await _patientService
          .uploadReportFile(
              filename: fileName,
              filepath: filePath,
              id: id,
              reportName: reportName)
          .then((value) async {
        await getReportsName(id: appointmentId);
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
