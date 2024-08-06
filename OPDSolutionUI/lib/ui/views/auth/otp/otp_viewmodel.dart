import 'dart:async';
import 'dart:developer';

import 'package:opdsolutionui/ui/views/auth/otp/otp_view.form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/auth_service.dart';

class OtpViewModel extends FormViewModel {
  int _timerDuration = 30;
  late Timer _timer;
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  bool isVerify = false;

  @override
  void setFormStatus() {
    //setFormStatus
    super.setFormStatus();
  }

  String? phoneNumber;
  getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString('phoneNumber');
  }

  verifyOtp(context) async {
    isVerify = true;
    try {
      await _authService
          .verifyOtp(
              '$otpDigit1Value$otpDigit2Value$otpDigit3Value$otpDigit4Value',
              phoneNumber!)
          .then((value) async {
        if (value.statusCode == 401) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red, content: Text(value.data)));
        }
        if (value.statusCode == 200 && value.data['roleName'] == 'Doctor') {
          await _authService.processLoggedInData(value);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _navigationService.clearStackAndShow(Routes.homeView);
        }
        if (value.statusCode == 401 || value.data['roleName'] != 'Doctor') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: value.statusCode == 401
                  ? Text(value.data)
                  : const Text("Your role didn't match")));
        }
        notifyListeners();
      });
    } on Error catch (error) {
      log('Error $error');
    } finally {}
  }

// otp switching focus.....
  switchFocus1(String value, BuildContext context,
      TextEditingController otpDigit1Controller) {
    if (otpDigit1Controller.text.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    notifyListeners();
  }

  switchFocus2(String value, BuildContext context,
      TextEditingController otpDigit2Controller) {
    if (otpDigit2Controller.text.length == 1) {
      FocusScope.of(context).nextFocus();
    } else if (otpDigit2Controller.text.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    notifyListeners();
  }

  switchFocus3(String value, BuildContext context,
      TextEditingController otpDigit3Controller) {
    if (otpDigit3Controller.text.length == 1) {
      FocusScope.of(context).nextFocus();
    } else if (otpDigit3Controller.text.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    notifyListeners();
  }

  switchFocus4(String value, BuildContext context,
      TextEditingController otpDigit4Controller) {
    if (otpDigit4Controller.text.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    notifyListeners();
  }

//form validation to check otp
  bool isFormValid(context) {
    if (otpDigit1Value != null &&
        otpDigit2Value != null &&
        otpDigit3Value != null &&
        otpDigit4Value != null) {
      if (otpDigit1Value!.trim().isNotEmpty &&
          otpDigit2Value!.trim().isNotEmpty &&
          otpDigit3Value!.trim().isNotEmpty &&
          otpDigit4Value!.trim().isNotEmpty) {
        if (!isVerify) {
          verifyOtp(context);
        }
        return true;
      }
    }
    return false;
  }

// navigation to go back
  goToHomeView() async {
    _navigationService.navigateTo(Routes.homeView);
  }

  goToBack() async {
    _navigationService.back();
  }

//Format Time
  String get timerText {
    int minutes = (_timerDuration / 60).floor();
    int seconds = _timerDuration % 60;
    return "0$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  //Start Timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerDuration > 0) {
        _timerDuration--;
        notifyListeners(); // notify view about the change
      } else {
        _timer.cancel();
      }
    });
  }

  //Restart Timer
  void restartTimer(context) {
    _timer.cancel();
    _timerDuration = 30; // Reset the timer duration
    startTimer(); // Start the timer again
    notifyListeners();
    resendOTP(context);
  }

  //Resend OTP
  resendOTP(context) async {
    try {
      var res = await _authService.loginWithPhoneNumber(phoneNumber!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 15),
        content: Text(res.data),
      ));
    } on Error catch (error) {
      log('$error');
    }
  }
}
