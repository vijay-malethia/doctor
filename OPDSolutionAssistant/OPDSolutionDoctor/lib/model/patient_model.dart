class PatientModel {
  String id;
  String name;
  String gender;
  String age;
  String phoneNumber;
  String appointmentId;
  PatientModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.appointmentId,
      required this.phoneNumber,
      required this.gender});
}
