import 'dart:developer';

import 'package:opd_doctor/ui/views/print_view/printable_data.dart';

import 'package:printing/printing.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pdf/pdf.dart';

import '../../../app/app.locator.dart';
import '../../../model/doctor_profile_model.dart';
import '../../../services/user_service.dart';
import 'package:pdf/widgets.dart' as pw;

class PrintViewViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  List<DoctorProfileModel> doctorlist = [];

//Printing
  Future<void> printDoc(
      userName,
      age,
      gender,
      phoneNumber,
      appointmentDate,
      height,
      weight,
      pulse,
      bp,
      temperature,
      diagnosis,
      symptoms,
      medicine,
      advice) async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(
              doctorlist[0].firstName,
              doctorlist[0].lastName,
              doctorlist[0].specialization,
              doctorlist[0].gender,
              doctorlist[0].age,
              doctorlist[0].phoneNumber,
              userName,
              age,
              gender,
              phoneNumber,
              appointmentDate,
              height,
              weight,
              pulse,
              bp,
              temperature,
              diagnosis,
              symptoms,
              medicine,
              advice);
        }));
    await Printing.layoutPdf(onLayout: (format) async => doc.save());
    notifyListeners();
  }

  //navigation to go back
  goBack() {
    _navigationService.back();
  }

/////////////////////////////////////////////////////////////////////////////API WORK////////////////////////////////////////////////////////////////////////////////////
  //Get Doctor Info
  Future<void> getDoctor() async {
    try {
      setBusy(true);
      var res = await _userService.getDoctorDetails();
      if (res.statusCode == 200) {
        doctorlist.add(DoctorProfileModel(
          id: res.data['id'].toString(),
          firstName: res.data['firstName'].toString(),
          lastName: res.data['lastName'] ?? '',
          phoneNumber: res.data['phoneNumber'].toString(),
          age: res.data['age'].toString(),
          base64Image: res.data['userProfile'].toString(),
          gender: res.data['gender'].toString(),
          specialization: res.data['specialization'] ?? '',
        ));
        notifyListeners();
      }
    } on Error catch (err) {
      log('$err');
    } finally {
      setBusy(false);
    }
  }
}
