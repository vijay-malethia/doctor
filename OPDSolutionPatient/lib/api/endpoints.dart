class Endpoints {
//Auth
  static const login = 'Login/UserLogin'; //post
  static const otpVerify = "/Login/OTPVerify"; //post
  static const logout = '';
  static const signUp = 'User/RegisterPatient';

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
  static const getpatientAppointment = 'PatientAppointment/Appointments'; //get

  //Search User
  static const searchUser = 'User/GetPatientByPhone';

  //Get Appointments Date
  static const getAppointmentDate = 'Appointment/GetAppointmenDetailsByid';

  //Get Medical Records
  static const getMedicalRecords = 'MedicalRecords/GetMedicalRecordById';

  //Complete Consultation
  static const completeConsul = 'Appointment/CompleteAppointment';

  //////////////////////////////////////////////////////Patient Endpoints/////////////////////////////////////////////////////////////

  static const getDoc =
      'PatientAppointment/GetListofDoctorById'; //get doctor of  patient
 
  static const getPatinetInfo =
      'PatientAppointment/PatientInfo'; // get patient info
  static const updatePatientDetails =
      'PatientAppointment/UpdatePatientDetail'; //Update Patient Details
  static const uploadReport =
      'FilePath/PostReport'; //Upload Patient Report Image

  static const getListOfReportsName =
      'PatientAppointment/GetListofReportsName'; // get list of reports(get)

  static const updateProfilePic = 'PatientAppointment/UploadPicture?Id=';

  // static const getImageUrl = 'FilePath/GetFile/';
  static const updateUserVitals = "PatientAppointment/UpdatePatientVitals";
  static const deleteProfile = "PatientAppointment/DeletePatientProfile";
  static const patientList = "PatientAppointment/GetListofRelatedPatient";
  static const patientById = "PatientAppointment/GetPatientdetailById";
  static const getImageUrl =
      'FilePath/GetFile/'; //get reports on appointment id

  static const getAllReport =
      'PatientAppointment/GetPatientUploadedReports?Id='; //get all reports
  static const historyReport =
      "PatientAppointment/PatientUploadedReport"; //post data
  static const getAllJourney = 'PatientAppointment/GetJourney?Id=';

  static const historyJourney = 'PatientAppointment/JourneyUpload';
}
