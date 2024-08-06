import 'dart:developer';
import 'package:doc_ease/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'login_view.form.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final authService = locator<AuthService>();
  bool checkValidation = false;

  @override
  void setFormStatus() {
    // Set a validation message for the entire form
    setPhoneNumberValidationMessage(
        phoneNumberValidator(value: phoneNumberValue));
  }

  //Phone Number Validation
  String? phoneNumberValidator({String? value}) {
    RegExp emailRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
    if (emailRegExp.hasMatch(value!)) {
      checkValidation = true;
    }
    if (!emailRegExp.hasMatch(value)) {
      checkValidation = false;
      return 'Plese Enter Valid Number';
    }
    notifyListeners();
    return null;
  }

//Login With Phone Number
  loginWithPhoneNumber(context) async {
    try {
      setBusy(true);
      var res = await authService.loginWithPhoneNumber(phoneNumberValue!);
      if (res.statusCode == 200) {
        setPhoneNumber(phoneNumberValue);
        goToOtpPage();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: res.statusCode == 200 ? Colors.green : Colors.red,
        content: Text(res.data),
      ));
    } on Error catch (error) {
      log('Error$error');
    } finally {
      setBusy(false);
    }
  }

  //Go To OTP Screen
  goToOtpPage() async {
    _navigationService.navigateTo(Routes.otpView);
  }

  //Set phonenumber
  setPhoneNumber(phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }
}
// if (value.statusCode == 200) {
//   setPhoneNumber(phoneNumberValue);
//   goToOtpPage();
// }
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   duration: const Duration(seconds: 5),
//   content: Text(value.data),
// ));
