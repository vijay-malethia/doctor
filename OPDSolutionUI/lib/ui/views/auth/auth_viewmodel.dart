import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import '/services/auth_service.dart';
import '/ui/views/auth/auth_view.form.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';

class AuthViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool isFormValid() {
    if (phoneNumberValue != null) {
      return phoneNumberValue!.trim().isNotEmpty &&
          (phoneNumberValue!.length == 10);
    } else {
      return false;
    }
  }

  loginWithNumber(context) async {
    try {
      setBusy(true);
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

  //Set phonenumber
  setPhoneNumber(phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  Future goToOtpView() async {
    _navigationService.navigateTo(Routes.otpView);
  }
}
