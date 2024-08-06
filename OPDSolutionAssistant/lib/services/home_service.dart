import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/api/endpoints.dart';
import '/api/http_request.dart';

class HomeService {
  Future<Response> getAllUser() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('auth_token');
    return httpRequest.get(Endpoints.getUser,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  }
}
