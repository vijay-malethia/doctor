class UserModel {
  String? id;
  String? username;
  var age;
  String? gender;
  String? phone;
  var height;
  var weight;
  var pulse;
  var bp;
  var bph;
  var temperature;
  var bloodPressure;
  var bloodPressureHigh;

  String? dateofAppointment;
  bool? reportCheck;
  bool? consultation;
  String? appointmentsId;

  UserModel(
      {this.id,
      this.username,
      this.age,
      this.gender,
      this.phone,
      this.height,
      this.weight,
      this.pulse,
      this.bloodPressure,
      this.bloodPressureHigh,
      this.temperature,
      this.dateofAppointment,
      this.reportCheck,
      this.consultation,
      this.appointmentsId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['userName'],
      phone: json['phoneNumber'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      pulse: json['pulse'],
      bloodPressure: json['bloodPressure'],
      bloodPressureHigh: json['bloodPressureHigh'],
      temperature: json['temperature'],
      gender: json['gender'],
    );
  }
}
