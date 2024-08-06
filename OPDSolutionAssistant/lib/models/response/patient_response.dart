class PatientResponse {
  final String id;
  final String userName;
  final String lastVisit;
  final String age;
  final String gender;
  final String phoneNumber;
  final String consultationDate;
  final String height;
  final String weight;
  final String pulse;
  final String bp;
  final String temp;

  PatientResponse(
      {required this.id,
      required this.userName,
      required this.lastVisit,
      required this.age,
      required this.gender,
      required this.phoneNumber,
      required this.consultationDate,
      required this.height,
      required this.weight,
      required this.pulse,
      required this.bp,
      required this.temp});

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
        id: '',
        userName: json['firstName'] + ' ' + json['lastName'],
        lastVisit: json['lastVist'],
        age: json['age'],
        gender: json['gender'],
        phoneNumber: json['phoneNumber'],
        consultationDate: json['appointment'],
        height: json['height'],
        weight: json['weight'],
        pulse: json['pulse'],
        bp: json['bloodpressure'],
        temp: json['temperature']);
  }
}
