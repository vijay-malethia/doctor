import 'dart:async';

import 'package:dio/dio.dart';
import 'package:doc_ease/api/endpoints.dart';
import 'package:doc_ease/api/http_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  bool _isAuthorized = false;
  get isAuthorized => _isAuthorized;

//Prepare User  Session
  Future<bool> prepareUserSession() async {
    try {
      _isAuthorized = false;
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString('auth_token');
      if (token != null) {
        _isAuthorized = true;
        setToken(token);
      }
      return _isAuthorized;
    } catch (err) {
      return _isAuthorized;
    }
  }

// Set data in storage after login
  Future<bool> processLoggedInData(Response json) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('auth_token', json.data['token']);
    pref.setString('role_name', json.data['roleName']);
    await prepareUserSession();
    return true;
  }

//Login with Phone Number
  Future<Response> loginWithPhoneNumber(String phoneNumber) async {
    return httpRequest.post(Endpoints.login + '?phoneNumber=$phoneNumber',
        options: Options(
            responseType: ResponseType.json,
            validateStatus: (statusCode) {
              if (statusCode == null) {
                return false;
              }
              if (statusCode == 401) {
                return true;
              } else {
                return statusCode >= 200 && statusCode < 300;
              }
            }));
  }

//OTP Verify
  Future<Response> verifyOtp(String otp, String phoneNumber) async {
    return httpRequest.post(Endpoints.otpVerify,
        data: {
          "phoneNumber": phoneNumber,
          "otp": otp,
        },
        options: Options(
            responseType: ResponseType.json,
            validateStatus: (statusCode) {
              if (statusCode == null) {
                return false;
              }
              if (statusCode == 401) {
                return true;
              } else {
                return statusCode >= 200 && statusCode < 300;
              }
            }));
  }

  // Clear user session
  Future clearUserSession() async {
    _isAuthorized = false;
    await SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
    });
  }
}
