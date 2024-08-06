import 'dart:async';
import 'dart:developer';
import 'package:opdsolutionui/ui/common/widgets/dismisskeyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/auth_service.dart';
import '/ui/views/auth/otp/otp_view.form.dart';

class OtpViewModel extends FormViewModel {
  int _timerDuration = 30;
  late Timer _timer;
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  bool isVerify = false;

  //setFormStatus
  @override
  void setFormStatus() {
    super.setFormStatus();
  }

// check phoneNumber
  String? phoneNumber;
  getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString('phoneNumber');
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

//checking form validation
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

// navigation to back
  goToHomeView() async {
    _navigationService.navigateTo(Routes.homeView);
  }

// navigation to back
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
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  //Restart Timer
  void restartTimer(context) {
    dismissKeyboard(context);
    _timer.cancel();
    _timerDuration = 30; // Reset the timer duration
    startTimer(); // Start the timer again
    notifyListeners();
    resendOTP(context);
  }
  //////////////////////////////////////////////////////////////Api Work///////////////////////////////////////////////////////////////

  //verify otp.....showing snackbar
  verifyOtp(context) async {
    isVerify = true;
    try {
      var res = await _authService.verifyOtp(
          '$otpDigit1Value$otpDigit2Value$otpDigit3Value$otpDigit4Value',
          phoneNumber!);
      if (res.statusCode == 200 && res.data['roleName'] == 'Patient') {
        await _authService.processLoggedInData(res);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        _navigationService.clearStackAndShow(Routes.homeView);
      }
      if (res.statusCode == 401 || res.data['roleName'] != 'Patient') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: res.statusCode == 401
                ? Text(res.data)
                : const Text("Your role didn't match")));
      }
      notifyListeners();
    } on Error catch (error) {
      log('Error $error');
    }
  }

  //Resend OTP
  resendOTP(context) async {
    try {
      var res = await _authService.loginWithPhoneNumber(phoneNumber!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 15),
        content: Text(res.data),
      ));
    } on Error catch (error) {
      log('$error');
    }
  }
}
