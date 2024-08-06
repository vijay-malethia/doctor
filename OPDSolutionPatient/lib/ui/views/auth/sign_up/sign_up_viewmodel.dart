import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/auth_service.dart';
import '/ui/views/edit_profile/edit_profile_view.form.dart';

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  
  //remove age hintext
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

  @override
  void setFormStatus() {
    //setFormStatus
    super.setFormStatus();
  }

  //navigate to login view
  Future goToAuthView() async {
    _navigationService.navigateTo(Routes.authView);
  }

//Add user dropdown
  String selectedGender = "";
  String genderInitVale = 'Select Gender';
  List<String> genderList = ['Select Gender', 'Male', 'Female', 'Other'];
  void changeGender(value) {
    genderInitVale = value;
    selectedGender = value;
    notifyListeners();
  }

  bool isFormValid() {
    if (firstNameValue != null &&
        lastNameValue != null &&
        phoneNumberValue != null &&
        ageValue != null &&
        selectedGender.trim().isNotEmpty) {
      return firstNameValue!.trim().isNotEmpty &&
          lastNameValue!.trim().isNotEmpty &&
          phoneNumberValue!.trim().isNotEmpty &&
          (phoneNumberValue!.length == 10) &&
          ageValue!.trim().isNotEmpty;
    } else {
      return false;
    }
  }

//////////////////////////////////////////////////////Api work////////////////////////////////////////////////////////////////////////////////
  signUpWithNumber(context) async {
    try {
      setBusy(true);
      var data = {
        "firstName": firstNameValue,
        "lastName": lastNameValue,
        "age": ageValue,
        "phoneNumber": phoneNumberValue,
        "gender": selectedGender
      };
      await _authService.signUp(data).then((value) {
        if (value.statusCode == 200) {
          goToAuthView();
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: value.statusCode == 200 ? Colors.green : Colors.red,
          content: Text(value.data['message']),
        ));
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Phone Number is already registered'),
      ));
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
