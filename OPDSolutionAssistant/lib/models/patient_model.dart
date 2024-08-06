class PatientModel {
  final String id;
  final String userName;
  final String lastVisit;
  final String? age;
  final String gender;
  final String phoneNumber;
  final String? height;
  final String? weight;
  final String? pulse;
  final String? bp;
  final String? temp;

  PatientModel(
      {required this.id,
      required this.userName,
      required this.lastVisit,
      this.age,
      required this.gender,
      required this.phoneNumber,
      this.height,
      this.weight,
      this.pulse,
      this.bp,
      this.temp});
}
