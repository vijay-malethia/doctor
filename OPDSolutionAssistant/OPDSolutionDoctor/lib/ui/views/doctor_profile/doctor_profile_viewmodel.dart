import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.bottomsheets.dart';
import '/api/api_error.dart';
import '/ui/common/index.dart';
import '/app/app.locator.dart';
import '/services/user_service.dart';
import '/ui/bottom_sheets/edit_assistant/edit_assistant_sheet.dart';
import '/model/doctor_profile_model.dart';
import '/ui/bottom_sheets/edit_clinic/edit_clinic_sheet.dart';
import '/ui/bottom_sheets/edit_doctor_profile/edit_doctor_profile_sheet.dart';

String profilePath = ''; //doctor profile picture
String clinicPath = ''; //clinic picture path
String? doctorGender;
bool isEditable = true; // for clinic sheet editable or add clinic
Map workingHoursDetails = {};
bool isAssitantAdd = false; //for add assistant

//for show doctorScheduleDetails in list with dynamic key
List detailList = [
  {'text': 'Monday', 'key': 'monday', 'to': 'mondayTo', 'from': 'mondayFrom'},
  {
    'text': 'Tuesday',
    'key': 'tuesday',
    'to': 'tusedayTo',
    'from': 'tuesdayFrom'
  },
  {
    'text': 'Wednesday',
    'key': 'wednesday',
    'to': 'wednesdayTo',
    'from': 'wednesdayFrom'
  },
  {
    'text': 'Thursday',
    'key': 'thursday',
    'to': 'thursdayTo',
    'from': 'thursdayFrom'
  },
  {'text': 'Friday', 'key': 'friday', 'to': 'fridayTo', 'from': 'fridayFrom'},
  {
    'text': 'Saturday',
    'key': 'saturday',
    'to': 'saturdayTo',
    'from': 'saturdayFrom'
  },
  {'text': 'Sunday', 'key': 'sunday', 'to': 'sundayTo', 'from': 'sundayFrom'},
];

class DoctorProfileViewModel extends FormViewModel {
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool showProfile = true;
  ScrollController scrollController = ScrollController();

  void initFunction() async {
    await getDoctor().then((value) => doctorId = doctor.id);
    notifyListeners();
  }

//Hide profile on scroll screen
  void onScroll() {
    double scrollPositionThreshold = 70.0;
    if (scrollController.offset > scrollPositionThreshold) {
      showProfile = false;
      notifyListeners();
    } else {
      if (!showProfile) {
        showProfile = true;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  //Gender DropDown(for doctor and assistant)
  var genderList = [
    'male',
    'female',
    'other',
  ];
  changeGender(value) async {
    doctorGender = value;
    notifyListeners();
  }

//set data and show edit profile bottomsheet
  void showEditDoctorProfileBottomSheet({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? phoneController,
    TextEditingController? ageController,
    TextEditingController? specialityController,
    TextEditingController? experienceController,
  }) async {
    firstNameController!.text = doctor.firstName;
    lastNameController!.text = doctor.lastName;
    ageController!.text = doctor.age;
    phoneController!.text = doctor.phoneNumber;
    specialityController!.text = doctor.specialization;
    experienceController!.text = doctor.experience;
    profilePath = doctor.base64Image == "null" ? '' : doctor.base64Image;
    doctorId = doctor.id;
    doctorGender = doctor.gender;
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editDoctorProfile,
    );

    await getDoctor();
    showProfile = true;
  }

  //set  edit assistanat  sheet new assistant add
  assistantAdd(bool value) {
    isAssitantAdd = value;
    notifyListeners();
  }

//assistant gender
  String? assistantGender = 'male'; //assistant initaial value(default)

  //for selct assistant gender from dropdown
  changeAssistant(value) async {
    assistantGender = value;
    notifyListeners();
  }

//edit assistantbottom sheet
  void showEditAssitantBottomSheet(index,
      {TextEditingController? assistantFirstName,
      TextEditingController? assistantLastName,
      TextEditingController? assistantContactNumber,
      TextEditingController? assistantSpecialization}) async {
    if (isAssitantAdd == false) {
      assistantFirstName!.text = assitantDetails[index]['firstName'];
      assistantLastName!.text = assitantDetails[index]['lastName'];
      assistantId = assitantDetails[index]['id'];
    } else {
      assistantFirstName!.clear();
      assistantLastName!.clear();
      assistantContactNumber!.clear();
      assistantSpecialization!.clear();
    }
    var confirmationResponse = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editAssistant,
    );
    if (confirmationResponse?.confirmed == true) {
      await getDoctor();
    }
    showProfile = true;
  }

  //set  clinic sheet editable
  changeEdit(bool value) {
    isEditable = value;
    notifyListeners();
  }

//show add or edit clinic bottomsheet
  void showEditClinicBottomSheet(index,
      {TextEditingController? clinicName,
      TextEditingController? clinicLocation,
      TextEditingController? contactNumber}) async {
    notifyListeners();
    if (isEditable == true) {
      clinicName!.text = clinicDetails[index]['clinicName'];
      clinicLocation!.text = clinicDetails[index]['address'];
      contactNumber!.text = clinicDetails[index]['contactNumber'];
      clinicPath = clinicDetails[index]['clinicProfile'] != null
          ? "$baseurl${clinicDetails[index]['clinicProfile']}"
          : '';
      clinicId = clinicDetails[index]['id'];
    } else {
      clinicName!.clear();
      clinicLocation!.clear();
      contactNumber!.clear();
    }
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editClinic,
    );

    await getDoctor();
    showProfile = true;
    notifyListeners();
  }

//working hours edit bottomsheet
  void showEditworkignHoursBottomSheet() async {
    doctorId = doctor.id;
    workingHoursDetails = doctor.doctorScheduleDetails;
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.editWorkingHour,
    );
    await getDoctor();
    showProfile = true;
    notifyListeners();
  }

  //Show choose profile picture bottom sheet
  showImagePickerBottomSheet(String bottomSheetType) async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
        isScrollControlled: false, variant: BottomSheetType.imagePicker);
    if (sheetResponse!.confirmed == true) {
      await pickImage(sheetResponse.data, bottomSheetType);
      notifyListeners();
    }
  }

  //For clinic Pic
  File? pickedImage;
  String imageName = '';
  String imagePathe = '';
  //vairable for doctor profile
  File? pickedDoctorImage;
  String doctorImageName = '';
  String doctorImagePathe = '';

  //Choose picture
  Future pickImage(ImageSource source, String bottomSheetType) async {
    try {
      setBusy(true);
      await ImagePicker().pickImage(source: source).then((pickedFile) {
        if (pickedFile != null) {
          ImageCropper()
              .cropImage(sourcePath: pickedFile.path)
              .then((croppedFile) async {
            if (croppedFile != null) {
              if (bottomSheetType == 'clinicPic') {
                pickedImage = File(pickedFile.path);
                imageName = croppedFile.path.split('/').last;
                imagePathe = croppedFile.path;
                await updateClinicPic(clinicId);
              } else if (bottomSheetType == 'doctorProfile') {
                pickedDoctorImage = File(pickedFile.path);
                doctorImageName = croppedFile.path.split('/').last;
                doctorImagePathe = croppedFile.path;
                await updateDoctorProfilePic(doctorId);
              }

              setBusy(false);
              notifyListeners();
            }
          });
        } else {
          setBusy(false);
        }
      });

      notifyListeners();
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    //  finally {
    //   setBusy(false);
    // }
  }

//change switch Button value
  switchButton(index) {
    workingHoursDetails[detailList[index]['key']] =
        !workingHoursDetails[detailList[index]['key']];

    notifyListeners();
  }

//show day list in working hours bottosheet
  bool setDayList = false;
  showDayList() {
    setDayList = !setDayList;
    notifyListeners();
  }

  //show Time picker for working hours
  timePicker(BuildContext context, index, String type) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        TimeOfDay fromtime = value;
        String selecedTime = fromtime.format(context).toString();
        type == 'specificTo'
            ? workingHoursDetails[detailList[index]['to']] = selecedTime
            : type == 'specificFrom'
                ? workingHoursDetails[detailList[index]['from']] = selecedTime
                : type == 'breakFrom'
                    ? workingHoursDetails['breakFrom'] = selecedTime
                    : type == 'breakTo'
                        ? workingHoursDetails['breakTo'] = selecedTime
                        : type == 'secondBreakFrom'
                            ? workingHoursDetails['secondBreakFrom'] =
                                selecedTime
                            : type == 'secondBreakTo'
                                ? workingHoursDetails['secondBreakTo'] =
                                    selecedTime
                                : null;
      }
      notifyListeners();
    });
  }

// //Edit Role
//   String roleInitialValue = "Role";
//   final roleList = ['Role', 'Junior Cardiologiest', "Role 2"];

//   changeRole(value) {
//     roleInitialValue = value;
//     notifyListeners();
  // }

  /////////////////////////////////////////////////////////////////////////Api's Work//////////////////////////////////////////////////////////////////////////////////

//Get Doctor Info
  var doctor;
  var assitantDetails;
  var clinicDetails;

//default working hours value in case of null from api
  Map<String, dynamic> defaultScheduleDetails = {
    "doctorId": doctorId,
    "monday": false,
    "mondayFrom": "",
    "mondayTo": "",
    "tuesday": false,
    "tuesdayFrom": "",
    "tusedayTo": "",
    "wednesday": false,
    "wednesdayFrom": "",
    "wednesdayTo": "",
    "thursday": false,
    "thursdayFrom": "",
    "thursdayTo": "",
    "friday": false,
    "fridayFrom": "",
    "fridayTo": "",
    "saturday": false,
    "saturdayFrom": "",
    "saturdayTo": "",
    "sunday": false,
    "sundayFrom": "",
    "sundayTo": "",
    "breakFrom": "",
    "breakTo": "",
    "secondBreakFrom": "",
    "secondBreakTo": ""
  };

  //get all doctor info
  Future<void> getDoctor() async {
    try {
      setBusy(true);
      var res = await _userService.getDoctorInfo();

      if (res.statusCode == 200) {
        doctor = DoctorProfileModel(
          id: res.data['users']['id'].toString(),
          firstName: res.data['users']['firstName'] != 'null'
              ? res.data['users']['firstName'].toString()
              : '',
          lastName: res.data['users']['lastName'] != null
              ? res.data['users']['lastName'].toString()
              : '',
          phoneNumber: res.data['users']['phoneNumber'] != null
              ? res.data['users']['phoneNumber'].toString()
              : '',
          age: res.data['users']['age'] == "null" ||
                  res.data['users']['age'] == null
              ? ''
              : res.data['users']['age'].toString(),
          base64Image: res.data['users']['userProfile'].toString(),
          gender: res.data['users']['gender'].toString(),
          specialization: res.data['users']['specialization'] == null ||
                  res.data['users']['specialization'] == 'null'
              ? ""
              : res.data['users']['specialization'].toString(),
          experience: res.data['users']['experience'] == null ||
                  res.data['users']['experience'] == 'null'
              ? ""
              : res.data['users']['experience'].toString(),
          appointmentCount: res.data['appointmentCount'].toString(),
          doctorScheduleDetails:
              res.data['doctorScheduleDetails'] ?? defaultScheduleDetails,
        );
        assitantDetails = res.data['assistantDetails'];
        clinicDetails = res.data['clinicData'];

        notifyListeners();
      }
    } on Error catch (err) {
      log('$err');
    } finally {
      setBusy(false);
    }
  }

  //Update assistant
  Future<void> updateAssistantDetails({
    required id,
    required fname,
    required lname,
  }) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "firstName": fname,
        "lastName": lname,
      };
      await _userService.updateAssistantDetail(data);
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    }
  }

  //Update doctor profile
  Future<void> updateDoctorProfile(
      {required id,
      required fname,
      required lname,
      required age,
      required gender,
      required experience,
      required specialization}) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "firstName": fname,
        "lastName": lname,
        "gender": gender,
        "age": age,
        "specialization": specialization,
        "experience": experience
      };
      await _userService.updateDoctor(data);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }

  //update Doctor profile picture
  updateDoctorProfilePic(id) async {
    FormData formData = FormData.fromMap({
      'UserPic': await MultipartFile.fromFile(doctorImagePathe,
          filename: doctorImageName)
    });
    try {
      await _userService.updateProfilePic(id, formData).then((value) async {
        notifyListeners();
      });
    } on Error catch (err) {
      log('$err');
    }
  }

  //Update clinic details
  Future<void> updateClinicDetails({
    required id,
    required clinicName,
    required clinicAddress,
    required contactNumber,
  }) async {
    try {
      setBusy(true);
      var data = {
        "id": id,
        "name": clinicName,
        "address": clinicAddress,
        "contactNumber": contactNumber
      };
      await _userService.updateClinicDetail(data);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }

  //update Clinic picture
  Future<void> updateClinicPic(id) async {
    FormData formData = FormData.fromMap({
      'Profile': await MultipartFile.fromFile(imagePathe, filename: imageName),
      'id': id
    });
    try {
      await _userService.updateClinicPic(formData);
      notifyListeners();
    } on Error catch (err) {
      log('$err');
    }
  }

  // Update doctor schedule detail
  Future<void> updateWorkingHours(data) async {
    try {
      setBusy(true);

      await _userService.updateDoctorSchedule(data);

      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }

  //Add clinic details
  Future<void> addClinicDetails({
    required clinicName,
    required clinicAddress,
    required contactNumber,
  }) async {
    try {
      setBusy(true);
      var data = {
        "name": clinicName,
        "address": clinicAddress,
        "contactNumber": contactNumber
      };
      await _userService.addClinicDetail(data);
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }

  //Add assistant details
  Future<void> addAssistantDetails({
    required assistantFirstame,
    required assistantLastName,
    required assistantGender,
    required assistantContactNumber,
    required assistantSpecialization,
  }) async {
    try {
      setBusy(true);
      var data = {
        "firstName": assistantFirstame,
        "lastName": assistantLastName,
        "phoneNumber": assistantContactNumber,
        "gender": assistantGender,
        "specialization": assistantSpecialization,
        "doctorId": doctorId,
      };
      await _userService.addAssistantDetail(data).then((value) => print(value));
      notifyListeners();
    } on ApiError catch (error) {
      log('Error $error');
    }
  }
}
