import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../services/index_service.dart';
import '/app/app.router.dart';

class EditProfileViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();

  //Gender DropDown
  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  void dropdown(value) async {
    dropdownvalue = value;
    notifyListeners();
  }

  //Go Back
  goToBack() async {
    _navigationService.back();
  }

  //Log Out
  void logOut() async {
    await _authService.logout();
    await _navigationService.navigateTo(Routes.authView);
  }

  //Set controllers value
  void setControllersValue(
      TextEditingController firstNameCtrl,
      lastNameCtrl,
      phoneNumberCtrl,
      ageCtrl,
      String firstValue,
      lastNameValue,
      phoneValue,
      ageValue,
      genderValue) {
    firstNameCtrl.text = firstValue;
    lastNameCtrl.text = lastNameValue;
    phoneNumberCtrl.text = phoneValue;
    ageCtrl.text = ageValue;
    dropdownvalue = genderValue;
    notifyListeners();
  }

  //Show choose profile picture bottom sheet
  void showBottomSheet() async {
    var res = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.imagePickerBottomSheet,
    );
    if (res!.data != null) {
      pickImage(res.data);
    }
    notifyListeners();
  }

  //Choos picture
  File? pickedImage;
  File? image;
  String imageName = '';
  String imagePathe = '';
  Future pickImage(imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource!);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressQuality: 100,
         uiSettings: [
              AndroidUiSettings(
            
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
            ]
      );
      if (croppedFile != null) {
        pickedImage = File(pickedFile.path);
        imageName = croppedFile.path.split('/').last;
        imagePathe = croppedFile.path;
        notifyListeners();
      }
    }
  }

  ////////////////////////////////////////////////////Api's Work////////////////////////////////////////////
  final PatientService _patientService = locator<PatientService>();

  void updateUserDetails({firstName, lastName, phoneNumber, age, id}) async {
    var data = {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "age": age ?? 0,
      "gender": dropdownvalue,
      "phoneNumber": phoneNumber
    };
    try {
      await _patientService.updatePatient(data);
      _navigationService.clearStackAndShow(Routes.profileView);
    } on Error catch (err) {
      log('$err');
    }
  }

  void updateProfilePic(id) async {
    FormData formData = FormData.fromMap({
      'UserPic': await MultipartFile.fromFile(imagePathe, filename: imageName)
    });
    try {
      await _patientService.updateProfilePic(id, formData);
      _navigationService.clearStackAndShow(Routes.profileView);
    } on Error catch (err) {
      log('$err');
    }
  }
}
