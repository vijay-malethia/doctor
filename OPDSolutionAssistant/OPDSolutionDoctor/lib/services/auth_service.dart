import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/index.dart';

class AuthService {
  bool _isAuthorized = false;
  get isAuthorized => _isAuthorized;

  // Check is saved auth token is valid or not
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

// Login with Phone number
  Future<Response> loginWithPhoneNumber(String phoneNumber) async {
    return httpRequest.post(Endpoints.login + phoneNumber,
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

// Verify OTP
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

// Set data in storage after login
  Future<bool> processLoggedInData(Response json) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('auth_token', json.data['token']);
    pref.setString('role_name', json.data['roleName']);
    await prepareUserSession();
    return true;
  }

// Clear user session
  Future logout() async {
    _isAuthorized = false;
    await SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
    });
  }
}
