class UserModel {
  String? firstName;
  String? lastName;
  String phoneNumber;
  var height;
  var weight;
  var pulse;
  var bp;
  var bph;
  var temperature;
  String? gender;
  var age;
  String? id;
  String base64Image;

  UserModel(
      {this.firstName,
      this.lastName,
      required this.phoneNumber,
      this.gender,
      this.height,
      this.weight,
      this.pulse,
      this.bp,
      this.bph,
      this.temperature,
      this.age,
      this.id,
      required this.base64Image});
}
