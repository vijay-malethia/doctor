class Endpoints {
//Auth
  static const login = '/Login/UserLogin'; //post
  static const otpVerify = "/Login/OTPVerify"; //post
  static const logout = '';

//Diagnosis Api
  static const getDiagnosis =
      'medicinesymptomsdiagnosis/medicneDiganosisSymotoms'; //get
  static const addDiagnosis = 'Diagnosis/AddDiagnosis'; //post

  //Medicine Api
  static const getMedicine =
      'medicinesymptomsdiagnosis/medicneDiganosisSymotoms'; //get
  static const addMedicine = 'Medicine/AddMedicines'; //post

  //Patient Advice Api
  static const addPatientAdvice = 'PatientAdvice/AddPatientAdvice'; //post

  //Symptom Api
  static const getSymptoms =
      'medicinesymptomsdiagnosis/medicneDiganosisSymotoms'; //get
  static const addSymptoms = 'Symptom/AddSymptoms'; //post

  //Report Api
  static const getReport =
      'medicinesymptomsdiagnosis/medicneDiganosisSymotoms'; //get
  static const addReport = 'Report/AddReport'; //post

  //Record Api
  static const getRecord =
      'medicinesymptomsdiagnosis/medicneDiganosisSymotoms'; //get
  static const addRecord = 'MedicalRecords/AddRecords'; //post

  //Token Api
  static const token = 'Token/auth'; //post

  //Vitals Api
  static const vitals = 'Vitals/AddVitals'; //post

//Appointment
  static const addAppointment = 'Appointment/AddAppointments';
  static const rescheduleAppointment = 'Appointment/RescheduleAppointment';

  //User Api
  static const getUser = 'Appointment/GetAppointments'; //get
  static const addUser = 'User/AddUser'; //post
  static const getUserById = 'User/GetUserById'; //get
  static const updateUser = 'User/UpdateUser'; //put
  static const updateVital = 'User/UpdateVitals'; //put
  static const cancelAppointment = 'User/CancelAppointment'; //put

  //Search User
  static const searchUser = 'User/GetPatientByPhone';

  //Get Appointments Date
  static const getAppointmentDate = 'Appointment/GetAppointmenDetailsByid';

  //Get Medical Records
  static const getMedicalRecords = 'MedicalRecords/GetMedicalRecordById';

  //Complete Consultation
  static const completeConsul = 'Appointment/CompleteAppointment';

  //Get Reports
  static const getReportsByAppointmentId =
      'MedicalRecords/GetReportsByAppointmentId';

  //Get Report Network Url
  static const getRoportUrl = 'FilePath/GetFile/';

  //Get List
  static const getSymptomsById = 'Symptom/GetSymptomsById';
  static const getDiagnosisById = "Diagnosis/GetDiagnosisById";
  static const getReportsById = 'Report/GetReportById';
  static const getMedicineById = "Medicine/GetMedicinesById";

  //Post Status
  static const postDiagnosisStatus = 'Diagnosis/TurnOnOffDiagnosis';
  static const postMedicineStatus = 'Medicine/TurnOnOffMedicine';
  static const postReportStatus = 'Report/TurnOnOffReport';
  static const postSymptomStatus = 'Symptom/TurnOnOffSymptom';

  //Get Doctor Details
  static const getDoctorInfo = 'Doctor/GetDoctorInfo';
  static const updateDoctor = 'Doctor/UpdateDoctorInfo';

  //udate profile pic
  static const updateProfilePic = 'PatientAppointment/UploadPicture?Id=';
}
