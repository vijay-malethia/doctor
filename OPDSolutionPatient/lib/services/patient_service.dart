import 'package:dio/dio.dart';
import '/api/endpoints.dart';
import '/api/http_request.dart';

class PatientService {
  //Get doc list of patient
  Future<Response> getDataDoc() async {
    return httpRequest.get(Endpoints.getDoc);
  }

  //Get doc list by id of patient
  Future<Response> getDataDocById(id) async {
    return httpRequest.get(Endpoints.getDoc + '?Id=$id');
  }

  //Get patient info
  Future<Response> getPatientInfo() async {
    return httpRequest.get(Endpoints.getPatinetInfo);
  }

  //Get patient list
  Future<Response> getPatientList() async {
    return httpRequest.get(Endpoints.patientList);
  }

  //Update Patient Details
  Future<Response> updatePatient(data) async {
    return httpRequest.put(Endpoints.updatePatientDetails, data: data);
  }

  //get Appointments
  Future<Response> getDataAppointment(id, userProfileId) async {
    return httpRequest.get(Endpoints.getpatientAppointment +
        '?DoctorId=$id' +
        '&UserProfileId=$userProfileId');
  }

  // get list of reports name
  Future<Response> updateProfilePic(id, data) async {
    return httpRequest.post(Endpoints.updateProfilePic + '$id',
        data: data,
        options: Options(
            headers: {"Content-Type": "multipart/form-data"},
            responseType: ResponseType.json,
            validateStatus: (statusCode) {
              if (statusCode == null) {
                return false;
              }
              if (statusCode == 400) {
                return true;
              } else {
                return statusCode >= 200 && statusCode < 300;
              }
            }));
  }

  //Upload report camera Image
  Future<Response> uploadReportFile(
      {filename, filepath, id, reportName}) async {
    FormData formData = FormData.fromMap({
      'Id': id,
      'ReportName': reportName,
      'Report': await MultipartFile.fromFile(filepath, filename: filename)
    });
    return httpRequest.post(Endpoints.uploadReport, data: formData);
  }

  // get list of image url
  Future<Response> getListImageUrl(id) async {
    return httpRequest.get(Endpoints.getImageUrl + '$id');
  }

  //Update Vitals
  Future<Response> updateUserVitals(data) {
    return httpRequest.post(Endpoints.updateUserVitals, data: data);
  }

  //Cancel Patient profile
  Future<Response> deleteProfile(id) async {
    return httpRequest.post(Endpoints.deleteProfile + '?Id=$id');
  }

  //// Patient details by id
  Future<Response> getProfileById(profileId) async {
    return httpRequest.get(Endpoints.patientById + '?Id=$profileId');
  }

  // get all reports
  Future<Response> getAllReports(id) async {
    return httpRequest.get(Endpoints.getAllReport + '$id');
  }

  // get all journey details
  Future<Response> getAllJourney(id) async {
    return httpRequest.get(Endpoints.getAllJourney + '$id');
  }

  //Upload report camera Image
  Future<Response> uploadHistoryReport(
      {required List<dynamic> files, id, reportName, date}) async {
    Map<String, dynamic> data = {
      'UserId': id,
      'ReportName': reportName,
      'Date': date
    };
    FormData formData = FormData.fromMap(data);
    files.forEach((element) {
      formData.files.add(MapEntry('file', element));
    });
    formData.files.forEach((element) {});

    return httpRequest.post(Endpoints.historyReport, data: formData);
  }

  //Upload journey details
  Future<Response> uploadHistoryjourney(
      {required List<dynamic> files, id, doctorName, date}) async {
    Map<String, dynamic> data = {
      'UserId': id,
      'DoctorName': doctorName,
      'Date': date
    };
    FormData formData = FormData.fromMap(data);
    files.forEach((element) {
      formData.files.add(MapEntry('file', element));
    });
    formData.files.forEach((element) {});

    return httpRequest.post(Endpoints.historyJourney, data: formData);
  }
}
