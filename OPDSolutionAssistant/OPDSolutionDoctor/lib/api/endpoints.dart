class Endpoints {
//Auth
  static const login = 'Login/UserLogin?phoneNumber='; //post
  static const otpVerify = "Login/OTPVerify"; //post
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

  // static const updateVital = 'User/UpdateVitals'; //put
  static const cancelAppointment = 'User/CancelAppointment'; //put

  //Search User
  static const searchUser = 'User/SearchPatientByPhoneNumber';
  static const addNewUser = "User/AddPatient";
  static const updateUser = "User/UpdatePatient";
  static const updateUserVitals = "User/UpdateOnlyVitals";
  static const bookConsultation = "User/UpdatePatientVitals";

  //Get Appointments Date
  static const getAppointmentDate = 'Appointment/GetAppointmenDetailsByid';

  //Get Appointments Date
  static const getUserDetails = 'User/GetPatientDetailsById';

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
  static const getDoctorInfo = 'Doctor/GetAllDoctorinfo';
  static const updateDoctor = 'Doctor/UpdateDoctorInfo';
  static const getDoctorDetails = "Doctor/GetDoctorInfo";
  //udate doctor profile pic
  static const updateProfilePic = 'PatientAppointment/UploadPicture?Id=';
  //update doctor Schedule
  static const updateDoctorSchedule = 'Doctor/AddDoctorSchedule';

  //Update assistant details
  static const updateAssistant = 'Assistant/UpdateAssistantinfo';

  //Add assistant details
  static const addAssistant = 'Assistant/AddAssistantByDoctor';

  //Update clinic details
  static const updateClinicDetail = 'Clinic/UpdateClinicInfo';
  static const updateClinicPic = 'Clinic/AddClinicProfile';
  //Add clinic details
  static const addClinic = 'Clinic/AddClinic';
}
