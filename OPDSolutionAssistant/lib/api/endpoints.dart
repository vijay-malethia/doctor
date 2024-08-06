class Endpoints {
  //Auth Api
  static const login = 'Login/UserLogin'; //post
  static const otpVerify = 'Login/OTPVerify'; //post

  //Appointment Api
  static const addAppointment = 'Appointment/AddAppointment'; //post
  // static const rescheduleAppointment =
  //     'Appointment/RescheduleAppointment'; //put

  //Diagnosis Api
  static const getDiagnosis = 'Diagnosis/GetDiagnosis'; //get
  static const addDiagnosis = 'Diagnosis/AddDiagnosis'; //post

  //Medicine Api
  static const getMedicine = 'Medicine/GetMedicines'; //get
  static const addMedicine = 'Medicine/AddMedicines'; //post

  //Patient Advice Api
  static const addPatientAdvice = 'PatientAdvice/AddPatientAdvice'; //post

  //Report Api
  static const getReport = 'Report/GetReport'; //get
  static const addReport = 'Report/AddReport'; //post

  //Symptom Api
  static const getSymptom = 'Symptom/GetSymptoms'; //get
  static const addSymptom = 'Symptom/AddSymptoms'; //post

  //Token Api
  static const token = 'Token/auth'; //post

  //Vitals Api
  static const vitals = 'Vitals/AddVitals'; //post

  //User Api
  static const getUser = 'User/GetListofPatient'; //get
  static const addUser = 'User/AddPatient'; //post
  static const getUserById = 'User/GetUserById'; //get
  static const updateUser = 'User/UpdatePatient'; //put
  static const updateUserVitals = "User/UpdateOnlyVitals";
  static const updateVital = 'User/UpdatePatientVitals'; //post
  static const updateAppointentDate = 'Appointment/UpdateAppointmentDate';
  static const cancelAppointment = 'Appointment/CancelAppointment'; //put
  static const getPatientDetailsById = "User/GetPatientDetailsById"; //get

  //Search User
  static const searchUser = 'User/GetPatientByPhone';
}
