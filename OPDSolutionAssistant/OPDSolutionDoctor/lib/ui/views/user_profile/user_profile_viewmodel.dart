import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opd_doctor/model/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/user_service.dart';

class UserProfileViewModel extends BaseViewModel {
  bool showProfile = true;
  ScrollController scrollController = ScrollController();
  final UserService _userService = locator<UserService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();

  DateTime now = DateTime.now();
  late String dateFormatted = "";

//formatted time
  formattedDate() {
    dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);
    notifyListeners();
  }

//show edit vitals bottom sheet
  void editBottomSheet(listIndex, index, list) {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true,
        variant: BottomSheetType.editVitals,
        data: [listIndex, index, list]);
  }

//show edit user profile bottom sheet
  void editProfileBottomSheet(listIndex, index, list) {
    _bottomSheetService.showCustomSheet(
        isScrollControlled: true,
        variant: BottomSheetType.editUserProfile,
        data: [listIndex, index, list]);
  }

//Controlling Scroll
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

  //Format appointment dates
  String formattedMonth(index, appointment) {
    DateTime dateTime = DateTime.parse(
        appointment[index]['appointmentDate'].toString().split('T').first);
    return DateFormat.MMMd().format(dateTime).toString().split(' ').first;
  }

  // Function to group dates by year
  Map dateGroups = {};
  Map groupDatesByYear() {
    for (Map<String, dynamic> appointment in appointment) {
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
  //////////////////////////////////////////////////////////////////////////API WORK////////////////////////////////////////////////////////////////////////////////

  List<UserModel> userList = [];
  List appointment = [];
//Get User Details
  Future<void> getUserDetails(String id) async {
    userList.clear();
    try {
      setBusy(true);
      var res = await _userService.getUserDeatilsById(id);
      var user = res.data['user'];
      appointment = res.data['appointment'];
      groupDatesByYear();
      userList.add(UserModel(
          firstName: user['firstName'],
          lastName: user['lastName'],
          phoneNumber: user['phoneNumber'],
          gender: user['gender'],
          height: user['height'] == null ? 0 : user["height"],
          weight: user['weight'] == null ? 0 : user["weight"],
          pulse: user['pluse'] == null ? 0 : user["pluse"],
          bp: user['bloodpressure'] == null ? 0 : user['bloodpressure']!,
          bph: user['bloodpressureHigh'] == null
              ? 0
              : user['bloodpressureHigh']!,
          temperature: user['temperature'] == null ? 0 : user["temperature"],
          age: user['age'],
          base64Image: user['userProfile'].toString(),
          id: user['id']));
      notifyListeners();
    } catch (e) {
      log('$e');
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

//book consultation
  void bookConsultation() async {
    formattedDate();
    try {
      setBusy(true);
      var data = {
        "id": userList[0].id,
        "height": userList[0].height,
        "weight": userList[0].weight,
        "pluse": userList[0].pulse,
        "bloodPressure": userList[0].bp,
        "bloodpressureHigh": userList[0].bph,
        "temperature": userList[0].temperature,
        "appointment": dateFormatted,
        "consultation": true,
        "reportCheck": false,
        "isActive": true,
        "isDoctor": true
      };
      await _userService.bookConsultation(data).then((value) async {
        if (value.data !=
            'Please come back after 5 days form your previous appointment') {
          _navigationService.clearStackAndShow(Routes.homeView);
        }
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
