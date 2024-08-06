import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/views/print/printable_data.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:opdsolutionui/app/app.locator.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:stacked/stacked.dart';

class PrintViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // printPaylod() {
  //   Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
  //     final doc = pw.Document();

  //     final image = await WidgetWraper.fromKey(
  //       key: printKey,
  //       pixelRatio: 2.0,
  //     );

  //     doc.addPage(pw.Page(
  //         pageFormat: format,
  //         build: (pw.Context context) {
  //           return pw.Center(
  //             child: pw.Expanded(
  //               child: pw.Image(image),
  //             ),
  //           );
  //         }));

  //     return doc.save();
  //   });
  // }

  // For making pdf

  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  Future<void> printDoc(
      username,
      gender,
      age,
      phoneNumber,
      height,
      weight,
      bp,
      //List<dynamic>
      complaints,
      // List<dynamic>
      diagnosis,
      advice,
      // List<dynamic>
      reports,
      activeStep,
      doctor,
      number,
      pulse,
      temperature,
      specialization,
      med) async {
    final image = await imageFromAssetBundle('assets/images/doctor.png');
    final imageSec = await imageFromAssetBundle('assets/images/doctor.png');

    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(
              image,
              imageSec,
              username,
              gender,
              age,
              phoneNumber,
              height,
              weight,
              bp,
              complaints,
              diagnosis,
              advice,
              reports,
              activeStep,
              doctor,
              number,
              pulse,
              temperature,
              specialization,
              med);
        }));

    await Printing.layoutPdf(onLayout: (format) async => doc.save());
    notifyListeners();
  }

  //Go To Back Page
  goToBack() {
    _navigationService.back();
  }
}
