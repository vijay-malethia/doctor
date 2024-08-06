class DoctorModel {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String age;
  String gender;
  String base64Image;
  String specialization;
  DoctorModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.age,
      required this.base64Image,
      required this.gender,
      required this.specialization});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        age: json['age'],
        base64Image: json['userProfile'],
        specialization: json["specialization"],
        gender: json['gender']);
  }
}
