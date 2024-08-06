class DoctorProfileModel {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String age;
  String gender;
  String base64Image;
  String specialization;
  String? experience;
  String? appointmentCount;
  Map? doctorScheduleDetails;

  DoctorProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.age,
    required this.base64Image,
    required this.gender,
    required this.specialization,
    this.experience,
    this.appointmentCount,
    this.doctorScheduleDetails,
  });

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        age: json['age'],
        base64Image: json['userProfile'],
        specialization: json["specialization"],
        gender: json['gender'],
        experience: json['experience'],
        appointmentCount: json['appointmentCount'],
        doctorScheduleDetails: json['doctorScheduleDetails']);
  }
}
