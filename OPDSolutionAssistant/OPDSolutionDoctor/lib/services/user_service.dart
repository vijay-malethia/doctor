import 'package:dio/dio.dart';

import '../api/index.dart';

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

  //Adding New User
  Future<Response> addNewUser(data) {
    return httpRequest.post(Endpoints.addNewUser, data: data);
  }

  //Update User
  Future<Response> updateUser(data) {
    return httpRequest.put(Endpoints.updateUser, data: data);
  }

//Update Vitals
  Future<Response> updateUserVitals(data) {
    return httpRequest.post(Endpoints.updateUserVitals, data: data);
  }

//Getting Symptoms
  Future<Response> getSymptoms() {
    return httpRequest.get(Endpoints.getSymptoms);
  }

//Adding Symptoms
  Future<Response> addSymptoms(data) {
    return httpRequest.post(Endpoints.addSymptoms, data: data);
  }

//Get Report
  // Future<Response> getReport() {
  //   return httpRequest.get(Endpoints.getReport);
  // }

//Add Report
  Future<Response> addReport(data) {
    return httpRequest.post(Endpoints.addReport, data: data);
  }

//Add Record
  Future<Response> addRerord(data) async {
    return httpRequest.post(Endpoints.addRecord, data: data);
  }

//Adding Patient Advice
  Future<Response> addPatientAdvice(data) {
    return httpRequest.post(Endpoints.addPatientAdvice, data: data);
  }

//Get Medicine
  // Future<Response> getMedicine() {
  //   return httpRequest.get(Endpoints.getMedicine);
  // }

//Add Medicine
  Future<Response> addMedicine(data) {
    return httpRequest.post(Endpoints.addMedicine, data: data);
  }

//Add Diagnosis
  Future<Response> addDiagnosis(data) {
    return httpRequest.post(Endpoints.addDiagnosis, data: data);
  }

//Get Diagnosis
  // Future<Response> getDiagnosis() {
  //   return httpRequest.get(Endpoints.getDiagnosis);
  // }

//Get Appointments Dates
  Future<Response> getAppointmentDatesById(id) {
    return httpRequest.get('${Endpoints.getAppointmentDate}?Id=$id');
  }

//Get Appointments Dates
  Future<Response> getUserDeatilsById(id) {
    return httpRequest.get('${Endpoints.getUserDetails}?Id=$id');
  }

  //Get List of Medicines By Id
  Future<Response> getMedicalRecords(id) {
    return httpRequest.get('${Endpoints.getMedicalRecords}?id=$id');
  }

  //Complete Appointment
  // Future<Response> completeConsul(id) {
  //   return httpRequest.put(Endpoints.completeConsul + '?id=$id');
  // }

  //Get Reports By appointment Id
  Future<Response> getReports({appointmentId, reportName}) {
    return httpRequest.get(
        Endpoints.getReportsByAppointmentId +
            '?Id=$appointmentId&ReportName=$reportName',
        options: Options(
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

  //Get All Patient
  Future<Response> getAllPatient() async {
    return httpRequest.get(Endpoints.getUser);
  }

  //Get Report url by appointment id
  Future<Response> getReportUrl({appointmentId}) async {
    return httpRequest.get(Endpoints.getRoportUrl + '$appointmentId');
  }

  //Get All Symptoms
  Future<Response> getSymptomsById() async {
    return httpRequest.get(Endpoints.getSymptomsById);
  }

//Get All Diagnosis
  Future<Response> getDiagnosisById() async {
    return httpRequest.get(Endpoints.getDiagnosisById);
  }

  //Get All Reports
  Future<Response> getReportsById() async {
    return httpRequest.get(Endpoints.getReportsById);
  }

  //Get All Medicine
  Future<Response> getMedicineById() async {
    return httpRequest.get(Endpoints.getMedicineById);
  }

  //Post Medicine Status
  Future<Response> postMedicineStatus(id) async {
    return httpRequest.post(Endpoints.postMedicineStatus + '?id=$id');
  }

  //Post Symptom Status
  Future<Response> postSymptomStatus(id) async {
    return httpRequest.post(Endpoints.postSymptomStatus + '?id=$id');
  }

  //Post Report Status
  Future<Response> postReportStatus(id) async {
    return httpRequest.post(Endpoints.postReportStatus + '?id=$id');
  }

  //Post Diagnosis Status
  Future<Response> postDiagnosisStatus(id) async {
    return httpRequest.post(Endpoints.postDiagnosisStatus + '?id=$id');
  }

  //Get Doctor Details
  Future<Response> getDoctorInfo() async {
    return httpRequest.get(Endpoints.getDoctorInfo);
  }

  //Get Doctor Details Information
  Future<Response> getDoctorDetails() async {
    return httpRequest.get(Endpoints.getDoctorDetails);
  }

  //Update Assistant  Details
  Future<Response> updateAssistantDetail(data) async {
    return httpRequest.post(Endpoints.updateAssistant, data: data);
  }
  
  //Add Assistant Details
  Future<Response> addAssistantDetail(data) async {
    return httpRequest.post(Endpoints.addAssistant, data: data);
  }

  //Update Doctor Info
  Future<Response> updateDoctor(data) async {
    return httpRequest.post(Endpoints.updateDoctor, data: data);
  }

  //book consultation
  Future<Response> bookConsultation(data) async {
    return httpRequest.post(Endpoints.bookConsultation, data: data);
  }

  //Update Doctor Schedule
  Future<Response> updateDoctorSchedule(data) async {
    return httpRequest.post(Endpoints.updateDoctorSchedule, data: data);
  }

  //Update Clinic Details
  Future<Response> updateClinicDetail(data) async {
    return httpRequest.post(Endpoints.updateClinicDetail, data: data);
  }

//Update Clinic picture
  Future<Response> updateClinicPic(data) async {
    return httpRequest.post(Endpoints.updateClinicPic,
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

  //Add Clinic Details
  Future<Response> addClinicDetail(data) async {
    return httpRequest.post(Endpoints.addClinic, data: data);
  }

  // update doctor profile pic
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
}
