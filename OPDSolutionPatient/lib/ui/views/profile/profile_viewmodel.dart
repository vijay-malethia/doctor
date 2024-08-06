import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app.dialogs.dart';
import '/app/app.bottomsheets.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/index_service.dart';

String? patientGender;
String? patientId;
String patientProfilePath = '';
var patients;
String? newUserPhoneNumber;
String profileId = "";

class ProfileViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

//remove age hinttext
  FocusNode focusNode = FocusNode();
  bool showHintText = true;
  removeHintText() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showHintText = false;
      } else {
        showHintText = true;
      }
      notifyListeners();
    });
  }

  Map<String, bool> showHintTextMap = {}; // Map to track hint text visibility

  void toggleHintTextVisibility(String inputKey, bool hasFocus) {
    showHintTextMap[inputKey] = !hasFocus;
    notifyListeners();
  }

  //Show dialog
  void showDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.infoAlert, data: patientDetails['id']);
    notifyListeners();
  }

  //Log Out
  void logOut() async {
    await _authService.logout();
    await _navigationService.clearStackAndShow(Routes.authView);
  }

  //Go to back
  goToBack() {
    _navigationService.back();
  }

  String genderInitVale = 'Male';
//select new user gender
  void changeNewUserGender(value) {
    genderInitVale = value;
    notifyListeners();
  }

  //Show Add new user  bottom sheet
  void showAddNewUserBottomSheet(TextEditingController number) async {
    number.text = newUserPhoneNumber!;
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.addUser,
    );
    await _navigationService.clearStackAndShow(Routes.profileView);

    notifyListeners();
  }

//patient gender list
  var genderList = [
    'Male',
    'Female',
    'Other',
  ];
  //change gender value from dropdown
  changeGender(value) async {
    patientGender = value;
    notifyListeners();
  }

//set data and show edit profile bottomsheet
  void showEditProfileBottomSheet(
    TextEditingController firstName,
    TextEditingController lastName,
    TextEditingController phone,
    TextEditingController ageController,
  ) async {
    firstName.text = patientDetails['firstName'];
    lastName.text = patientDetails['lastName'];
    phone.text = phoneNumber;
    ageController.text = age;
    patientGender = gender;
    patientId = patientDetails['id'];
    patientProfilePath =
        base64Image == 'http://103.30.75.131:444null' ? '' : base64Image;

    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editPatientProfile,
    );
    await getPatientInfo();
    notifyListeners();
  }

  //Show choose profile picture bottom sheet
  void showImagePickerBottomSheet() async {
    var res = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.imagePickerBottomSheet,
    );
    if (res!.data != null) {
      pickImage(res.data);
    }
    notifyListeners();
  }

  //Choose picture
  File? pickedImage;
  File? image;
  String imageName = '';
  String imagePathe = '';
  Future pickImage(imageSource) async {
    try {
      setBusy(true);
      final pickedFile = await ImagePicker().pickImage(source: imageSource!);
      if (pickedFile != null) {
        final croppedFile = await ImageCropper()
            .cropImage(sourcePath: pickedFile.path, uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ]);
        if (croppedFile != null) {
          pickedImage = File(croppedFile.path);
          imageName = croppedFile.path.split('/').last;
          imagePathe = croppedFile.path;
          await updateProfilePic(patientId);
        }
        notifyListeners();
      }
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    } finally {
      setBusy(false);
    }
  }

  //set data and show edit vitals bottomsheet
  void showEditVitalsBottomSheet(
      {TextEditingController? height,
      TextEditingController? weight,
      TextEditingController? pulse,
      TextEditingController? bp,
      TextEditingController? bpH,
      TextEditingController? temp}) async {
    height!.text = patientDetails['height'] == null
        ? ''
        : patientDetails['height'].toString();
    weight!.text = patientDetails['weight'] == null
        ? ''
        : patientDetails['weight'].toString();
    pulse!.text = patientDetails['pluse'] == null
        ? ''
        : patientDetails['pluse'].toString();
    bp!.text = patientDetails['bloodpressure'] == null
        ? ''
        : patientDetails['bloodpressure'].toString();
    bpH!.text = patientDetails['bloodpressureHigh'] == null
        ? ''
        : patientDetails['bloodpressureHigh'].toString();
    temp!.text = patientDetails['temperature'] == null
        ? ''
        : patientDetails['temperature'].toString();
    patientId = patientDetails['id'];
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editPatienVitals,
    );
    await _navigationService.clearStackAndShow(Routes.profileView);
  }

  //Show switch profile  bottom sheet
  void showSwitchProfileBottomSheet() async {
    patientId = patientDetails['id'];
    newUserPhoneNumber = phoneNumber;
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.switchUser,
    );

    notifyListeners();
  }

//logolist
  List logoList = [
    'assets/images/patientLogoGreen.svg',
    'assets/images/userImage.svg',
    'assets/images/userYellowImage.svg',
  ];
  /////////////////////////////////////////////////////////////////////////Api's Work/////////////////////////////////////////////////////////
  final PatientService _patientService = locator<PatientService>();
  String id = '';
  String patientName = '';
  String phoneNumber = '';
  String age = '';
  String gender = '';
  String base64Image = '';
  bool? defaultUser;
  var patientDetails;
  //Get Patient information
  Future getPatientInfo() async {
    base64Image = '';
    try {
      setBusy(true);
      // getId();
      var res = await _patientService.getProfileById(profileId);
      patientDetails = res.data['message'];
      patientName =
          patientDetails['firstName'] + ' ' + patientDetails['lastName'];
      age = patientDetails['age'].toString();
      phoneNumber = patientDetails['phoneNumber'];
      gender = patientDetails['gender'];
      id = patientDetails['id'];
      base64Image =
          'http://103.30.75.131:444${patientDetails['userProfile'].toString()}';
      defaultUser = patientDetails['defaultUser'] ?? false;
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    } finally {
      setBusy(false);
    }
  }

//update user details
  Future updatePatientDetails(
      {firstName, lastName, phoneNumber, age, id}) async {
    var data = {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "age": age ?? 0,
      "gender": patientGender,
      "phoneNumber": phoneNumber
    };
    try {
      await _patientService.updatePatient(data);
    } on Error catch (err) {
      log('$err');
    }
  }

  //update user profile pic
  Future updateProfilePic(id) async {
    FormData formData = FormData.fromMap({
      'UserPic': await MultipartFile.fromFile(imagePathe, filename: imageName)
    });
    try {
      await _patientService.updateProfilePic(id, formData).then((value) {
        imageCache.clear();
        notifyListeners();
      });
    } on Error catch (err) {
      log('$err');
    }
  }

  //Update User Vitals
  Future updateVitals(
      {required height,
      required weight,
      required pulse,
      required bp,
      required bph,
      required temp}) async {
    try {
      setBusy(true);
      var data = {
        "id": patientId,
        "height": int.parse(height),
        "weight": int.parse(weight),
        "pluse": int.parse(pulse),
        "bloodPressure": int.parse(bp),
        "bloodpressureHigh": int.parse(bph),
        "temperature": double.parse(temp),
        "isDoctor": false
      };
      await _patientService.updateUserVitals(data).then((value) async {
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //delte Profile
  getDefaultUserId() async {
    for (var patientsElement in patients) {
      if (patientsElement['isDefault']) {
        var pref = await SharedPreferences.getInstance();
        pref.setString('id', patientsElement['id']);
        break;
      }
    }
  }

  deleteProfile(context, patientid) async {
    try {
      await _patientService.deleteProfile(patientid).then((value) {
        getDefaultUserId();
        _navigationService.clearStackAndShow(Routes.homeView);
      });
    } on Error catch (err) {
      (err);
    }
  }

  //get patient list
  void getPatientsList() async {
    try {
      // setBusy(true);
      var res = await _patientService.getPatientList();
      patients = res.data['message'];
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    } finally {}
  }

  Future addNewUser(context,
      {TextEditingController? fName,
      TextEditingController? lName,
      TextEditingController? age,
      TextEditingController? phoneNumber}) async {
    try {
      setBusy(true);
      var data = {
        "firstName": fName!.text,
        "lastName": lName!.text,
        "age": int.parse(age!.text),
        "phoneNumber": phoneNumber!.text,
        "gender": genderInitVale
      };
      await _authService.signUp(data).then((value) {
        print(value);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: value.statusCode == 200 ? Colors.green : Colors.red,
          content: Text(value.data['message']),
        ));
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

//get patient id
  void getId() async {
    setBusy(true);
    getPatientsList();
    var pref = await SharedPreferences.getInstance();
    profileId = pref.getString('id')!;
    await getPatientInfo();
    notifyListeners();
  }

  // //switch user get by id
  Future getProfileById(id) async {
    try {
      var pref = await SharedPreferences.getInstance();
      pref.setString('id', id);
      await _navigationService.clearStackAndShow(Routes.profileView);
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    }
  }
}
