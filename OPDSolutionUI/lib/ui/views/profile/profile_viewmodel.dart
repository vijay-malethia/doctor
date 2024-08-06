import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opdsolutionui/app/app.router.dart';
import 'package:opdsolutionui/model/doctor_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../api/api_error.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';

import '../../../services/consultation_service.dart';
import '../../common/app_strings.dart';

class ProfileViewModel extends BaseViewModel {
  final _consultationService = locator<ConsultationService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  //Set controllers value
  void setControllersValue(
      TextEditingController fnameCtrl,
      lnameCtrl,
      ageCtrl,
      speclCtrl,
      String fnameValue,
      lnameValue,
      ageValue,
      genderValue,
      speclValue) {
    fnameCtrl.text = fnameValue;
    lnameCtrl.text = lnameValue;
    ageCtrl.text = ageValue;
    dropdownvalue = genderValue;
    speclCtrl.text = speclValue;
    notifyListeners();
  }

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

  //Profile view
  profile() {
    isEditable = false;
    notifyListeners();
  }

  //Go Back
  goBack() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  //Go to Edit Profile Screen
  bool isEditable = false;
  void gotoEditProfileView(
      {required fnameCtrl,
      required lnameCtrl,
      required ageCtrl,
      required fnameValue,
      required lnameValue,
      required ageValue,
      required genderValue,
      required speclCtrl,
      required speclValue}) async {
    isEditable = true;
    setControllersValue(fnameCtrl, lnameCtrl, ageCtrl, speclCtrl, fnameValue,
        lnameValue, ageValue, genderValue, speclValue);
    notifyListeners();
  }

  void initFunction() {
    getDoctor();
  }

  //Show choose profile picture bottom sheet
  void showBottomSheet() async {
    var res = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.imagePicker,
    );
    if (res!.data != null) {
      await imagePicker(res.data);
    }
    notifyListeners();
  }

  //Choose picture
  File? pickedImage;
  String imageName = '';
  String imagePathe = '';
  Future<void> imagePicker(ImageSource imageSource) async {
    setBusy(true);
    await ImagePicker()
        .pickImage(source: imageSource, imageQuality: 10)
        .then((pickedFile) {
      if (pickedFile != null) {
        ImageCropper()
            .cropImage(sourcePath: pickedFile.path)
            .then((croppedFile) {
          if (croppedFile != null) {
            pickedImage = File(pickedFile.path);
            imageName = croppedFile.path.split('/').last;
            imagePathe = croppedFile.path;
            notifyListeners();
          }
          setBusy(false);
        });
      }
    });
  }

  /////////////////////////////////////////////////////////////////////////Api's Work//////////////////////////////////////////////////////////////////////////////////

//Get Doctor Info
  late DoctorModel doctor;
  Future<void> getDoctor() async {
    try {
      setBusy(true);
      var res = await _consultationService.getDoctorInfo();
      doctor = DoctorModel(
          id: res.data['id'].toString(),
          firstName: res.data['firstName'].toString(),
          lastName: res.data['lastName'] ?? '',
          phoneNumber: res.data['phoneNumber'].toString(),
          age: res.data['age'].toString(),
          base64Image: '$baseurl${res.data['userProfile'].toString()}',
          gender: res.data['gender'].toString(),
          specialization: res.data['specialization'].toString());
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    } finally {
      setBusy(false);
    }
  }

  //Update Doctor Info
  updateView(
      {required id,
      required fname,
      required lname,
      required age,
      required specialization}) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "firstName": fname,
        "lastName": lname,
        "gender": dropdownvalue,
        "age": age,
        "specialization": specialization
      };
      await _consultationService.updateDoctor(data);
      // .then((value) async {
      //   if (pickedImage != null) {
      //     updateProfilePic(doctor.id);
      //   }
      await getDoctor();
      isEditable = false;
      notifyListeners();
      //  });
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //update profile
  updateProfilePic(id) async {
    FormData formData = FormData.fromMap({
      'UserPic': await MultipartFile.fromFile(imagePathe, filename: imageName)
    });
    try {
      await _consultationService
          .updateProfilePic(id, formData)
          .then((value) async {
        await getDoctor();
        isEditable = false;
        notifyListeners();
      });
    } on Error catch (err) {
      log('$err');
    }
  }
}
