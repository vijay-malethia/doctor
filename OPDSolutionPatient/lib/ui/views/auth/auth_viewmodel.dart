import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import '/services/auth_service.dart';

import '/ui/views/auth/auth_view.form.dart';
import '/ui/common/widgets/dismisskeyboard.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';

class AuthViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  //navigate to Sign up view
  Future goToSignUpView() async {
    _navigationService.navigateTo(Routes.signUpView);
  }

//check form validation
  bool isFormValid() {
    if (phoneNumberValue != null) {
      return phoneNumberValue!.trim().isNotEmpty &&
          (phoneNumberValue!.length == 10);
    } else {
      return false;
    }
  }

  //Set phonenumber
  setPhoneNumber(phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

//navigate to otp view
  Future goToOtpView() async {
    _navigationService.navigateTo(Routes.otpView);
  }

  ///////////////////////////////////////////////////////////////////////////Api Work///////////////////////////////////////////////////////////////

  loginWithNumber(context) async {
    try {
      setBusy(true);
      dismissKeyboard(context);
      await _authService.loginWithPhoneNumber(phoneNumberValue!).then((value) {
        if (value.statusCode == 200) {
          setPhoneNumber(phoneNumberValue);
          goToOtpView();
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: value.statusCode == 200 ? Colors.green : Colors.red,
          content: Text(value.data),
        ));
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {
      setBusy(false);
    }
  }
}
