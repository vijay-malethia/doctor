import '/model/medicine_model.dart';

class ConsultationRequestModel {
  final List<dynamic>? symptoms;
  final List<dynamic>? diagnosis;
  final List<dynamic>? reports;
  final List<MedicineModel>? medicine;
  ConsultationRequestModel({
    this.diagnosis,
    this.medicine,
    this.reports,
    this.symptoms,
  });
}
