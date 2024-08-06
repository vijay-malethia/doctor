import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.bottomsheets.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/patient_service.dart';

String userId = '';
String appointId = '';
String name = '';

class HistoryUploadViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final PatientService _patientService = locator<PatientService>();
  //navigate previous screen
  void goBack() {
    _navigationService.back();
  }

  //datePicker
  DateTime selectedDate = DateTime.now();
  Future<void> selectAppointmentDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2027),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate = picked;
    }
    notifyListeners();
  }

// add container
  List containers = [];
  List uploadedContainers = [];

  // Add a new container to the list
  addContainer(Widget container) {
    containers.add(container);
    notifyListeners();
  }

  List<SelectedItem> reportDocuments = [];
  List<SelectedItem> journeyDocuments = [];

//remove from journey documents
  void removeJourneyFiles(index) {
    journeyDocuments.removeAt(index);
    multipartFilesList.removeAt(index);

    notifyListeners();
  }

  // Add an uploaded container to the list
  void addUploadedContainer(Widget uploadedContainer) {
    uploadedContainers.add(uploadedContainer);
    notifyListeners();
  }

  // Remove a container from the list
  void removeContainer(int index) {
    if (index >= 0 && index < containers.length) {
      containers.removeAt(index);
      notifyListeners();
    }
  }

  // Remove an uploaded container from the list
  void removeUploadedContainer(int index) {
    if (index >= 0 && index < uploadedContainers.length) {
      uploadedContainers.removeAt(index);
      notifyListeners();
    }
  }

  //Upload options bottomsheet
  void showUploadOptionsBottomSheet({widget, sheetName}) async {
    notifyListeners();
    var res = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.uploadOptions);
    if (res != null) {
      if (res.data == 'pdf') {
        pickDocument(sheetName, widget);
      } else {
        pickImage(res.data, sheetName, widget);
      }
    }
    notifyListeners();
  }

  List<dynamic> multipartFilesList = [];
  // pick image
  void pickImage(source, String sheetName, widget) async {
    try {
      setBusy(true);
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
            ]);

        if (sheetName == 'journey' && croppedFile != null) {
          journeyDocuments.add(SelectedItem("image", croppedFile));
          multipartFilesList.add(MultipartFile.fromFileSync(croppedFile.path));
        } else {
          if (croppedFile != null) {
            reportDocuments.add(SelectedItem("image", pickedFile));
            multipartFilesList
                .add(await MultipartFile.fromFileSync(croppedFile.path));
            if (sheetName == "Report") {
              addUploadedContainer(widget);
            }
          }
        }

        notifyListeners();
      }
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  String fileName = '';
  String filePath = '';
  //pick Document file
  void pickDocument(String sheetName, widget) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      if (sheetName == "Report") {
        addUploadedContainer(widget);
      }
      PlatformFile file = result.files.first;
      filePath = file.path!;
      fileName = file.name;
      if (sheetName == 'journey') {
        journeyDocuments.add(SelectedItem("pdf", fileName));
        // journeyDocuments.add(fileName);
        print(journeyDocuments);
        multipartFilesList.add(await MultipartFile.fromFileSync(filePath));
      } else {
        reportDocuments.add(SelectedItem("pdf", fileName));
        print(reportDocuments);
        multipartFilesList.add(await MultipartFile.fromFileSync(filePath));
      }
    }
    notifyListeners();
  }

////////////////////////////////////////////////////////////APi Work////////////////////////////////////////////
  //upload Image
  void uploadFile({id, date}) async {
    String time = date.toString();
    String formattedTime = time.replaceAll(' ', 'T');
    try {
      setBusy(true);
      await _patientService
          .uploadHistoryReport(
              files: multipartFilesList,
              id: id,
              reportName: "Text",
              date: formattedTime)
          .then((value) async {
        _navigationService.navigateTo(Routes.historyView);
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //upload journey list
  void uploadJourneyFile({id, date, TextEditingController? doctorName}) async {
    String time = selectedDate.toString();
    String formattedTime = time.replaceAll(' ', 'T');
    try {
      setBusy(true);

      await _patientService
          .uploadHistoryjourney(
              files: multipartFilesList,
              id: id,
              doctorName: 'Dr. ${doctorName!.text}',
              date: formattedTime)
          .then((value) async {
        doctorName.clear();
        _navigationService.navigateTo(Routes.historyView);
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}

//to add journey data check pdf or image
class SelectedItem {
  final String type; // "pdf" or "image"
  final dynamic content; // File for image, String for pdf name

  SelectedItem(this.type, this.content);
}
