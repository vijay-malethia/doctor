import 'package:dio/dio.dart';
import 'package:doc_ease/models/response/patient_response.dart';

import '/api/endpoints.dart';
import '/api/http_request.dart';

class UserService {
  //Search User By Phone Number
  Future<Response> searchUser(String phoneNumber) async {
    var data = '?phoneNumber=$phoneNumber';
    return httpRequest.get(Endpoints.searchUser + data,
        options: Options(
            responseType: ResponseType.json,
            validateStatus: (statusCode) {
              if (statusCode == null) {
                return false;
              }
              if (statusCode == 200) {
                return true;
              } else {
                return statusCode >= 200 && statusCode < 300;
              }
            }));
  }

  //get Patient Deatils BY Id
  Future<Response> getPatientDetailsById(String id) async {
    return httpRequest.get(Endpoints.getPatientDetailsById + '?id=$id');
  }

  //Update User
  Future<Response> updateUser(data) {
    return httpRequest.put(Endpoints.updateUser, data: data);
  }

//Update Vitals
  Future<Response> updateUserVitals(data) {
    return httpRequest.post(Endpoints.updateUserVitals, data: data);
  }

  // Set data in storage after search
  Future<dynamic> processSearchData(Response json) async {
    List searchedUser = [];
    var data = json.data;
    searchedUser =
        data.map((companies) => PatientResponse.fromJson(companies)).toList();
    return searchedUser;
  }

//Add User
  Future<Response> addUser(data) async {
    return httpRequest.post(Endpoints.addUser, data: data);
  }

  //Edit User
  Future<Response> editUser(data, String id) async {
    return httpRequest.put(Endpoints.updateUser + '?id=$id', data: data);
  }

  //Edit User Appointment
  Future<Response> editUserAppointment(data) async {
    return httpRequest.post(Endpoints.updateVital, data: data);
  }

  //Edit User Appointment Date
  Future<Response> editUserAppointmentDate(data) async {
    return httpRequest.post(Endpoints.updateAppointentDate, data: data);
  }

  //Cancel Patient Appointment
  Future<Response> cancelAppointment(id) async {
    return httpRequest.put(Endpoints.cancelAppointment + '?Id=$id');
  }
}
