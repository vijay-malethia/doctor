class MedicineModel {
  String medicine;
  String dose;
  String when;
  String frequency;
  String duration;
  String instruction;
  MedicineModel(
      {required this.medicine,
      required this.dose,
      required this.when,
      required this.frequency,
      required this.duration,
      required this.instruction});

  Map<String, dynamic> toJson() {
    return {
      'medicine': medicine,
      'dose': dose,
      'when': when,
      'frequency': frequency,
      'duration': duration,
      'instruction': instruction,
    };
  }
}
