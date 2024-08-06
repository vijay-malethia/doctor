import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../model/medicine_model.dart';

buildPrintableData(
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
  List<MedicineModel> med,
) =>
    pw.Padding(
        padding: const pw.EdgeInsets.all(10),
        child: pw.ListView(children: [
          pw.SizedBox(
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('$doctor',
                          style: pw.TextStyle(
                              fontSize: 21,
                              fontWeight: pw.FontWeight.bold,
                              color: const PdfColor.fromInt(0xff1765ae))),
                      pw.Text(specialization,
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 16)),
                      pw.Text("Contact:$number",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 16))
                    ])
              ])),
          pw.SizedBox(height: 40),
          pw.Container(
              padding: const pw.EdgeInsets.all(10),
              height: 90,
              decoration: pw.BoxDecoration(
                  color: const PdfColor.fromInt(0xfff2f4ff),
                  borderRadius: pw.BorderRadius.circular(8)),
              child: pw.Column(children: [
                pw.Row(children: [
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text("HPLXDEM043796595:",
                          style: pw.TextStyle(
                              fontSize: 16,
                              color: const PdfColor.fromInt(0xFF000000),
                              fontWeight: pw.FontWeight.bold))),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text('$username ($age.$gender) - $phoneNumber',
                          style: pw.TextStyle(
                              color: const PdfColor.fromInt(0xFF000000),
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 16)))
                ]),
                pw.SizedBox(height: 15),
                pw.Row(children: [
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text("Date:",
                          style: pw.TextStyle(
                              fontSize: 16,
                              color: const PdfColor.fromInt(0xFF000000),
                              fontWeight: pw.FontWeight.bold))),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Text("$activeStep",
                          style: pw.TextStyle(
                              color: const PdfColor.fromInt(0xFF000000),
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 16)))
                ])
              ])),
          pw.SizedBox(height: 40),
          pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(children: [
                pw.Row(children: [
                  pw.Expanded(
                      flex: 1,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Height:",
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16)),
                            pw.SizedBox(width: 5),
                            pw.Text('$height',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16))
                          ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Pulse:",
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16)),
                            pw.SizedBox(width: 5),
                            pw.Text('$pulse',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16))
                          ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Weight:",
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16)),
                            pw.SizedBox(width: 5),
                            pw.Text('$weight',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16))
                          ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("Temperature:",
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16)),
                            pw.SizedBox(width: 5),
                            pw.Text('$temperature',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16))
                          ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("BP:",
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16)),
                            pw.SizedBox(width: 5),
                            pw.Text('$bp',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16))
                          ]))
                ]),
                pw.SizedBox(height: 20),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Symptoms:",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                  color: const PdfColor.fromInt(0xFF000000)))),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text('$complaints',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xFF000000),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16)))
                    ]),
                pw.SizedBox(height: 20),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Diagnosis:",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                  color: const PdfColor.fromInt(0xFF000000)))),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text('$diagnosis',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xFF000000),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16)))
                    ]),
                pw.SizedBox(height: 20),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Text("Reports:",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                  color: const PdfColor.fromInt(0xFF000000)))),
                      pw.Expanded(
                          flex: 3,
                          child: pw.Text('$reports',
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xFF000000),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16)))
                    ]),
                pw.SizedBox(height: 40),
                pw.Column(children: [
                  pw.Container(
                      child: renderRow(
                          medicine: 'Medicine',
                          dose: 'Dosage',
                          when: 'When',
                          frequency: "Frequency",
                          duration: "Duration",
                          instruction: "Instruction",
                          textStyle: pw.TextStyle(
                              color: const PdfColor.fromInt(0xFF000000),
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 16))),
                  pw.SizedBox(height: 15),
                  pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      decoration: pw.BoxDecoration(
                          color: const PdfColor.fromInt(0xffF2F4FF),
                          borderRadius: pw.BorderRadius.circular(5)),
                      child: pw.ListView.builder(
                          itemCount: med.length,
                          itemBuilder: (context, index) {
                            return renderRow(
                                medicine: med[index].medicine,
                                dose: med[index].dose,
                                when: med[index].when,
                                frequency: med[index].frequency,
                                duration: med[index].duration,
                                instruction: med[index].instruction,
                                textStyle: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16));
                          })),
                ]),
                pw.SizedBox(height: 20)
              ])),
          pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                        child: pw.RichText(
                            text: pw.TextSpan(
                                text: 'Advice:  ',
                                style: pw.TextStyle(
                                    color: const PdfColor.fromInt(0xFF000000),
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold),
                                children: [
                          pw.TextSpan(
                              text: advice,
                              style: pw.TextStyle(
                                  color: const PdfColor.fromInt(0xFF000000),
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 17))
                        ])))
                  ]))
        ]));

pw.Widget renderRow(
    {required String medicine,
    required String dose,
    required String when,
    required String frequency,
    required String duration,
    required pw.TextStyle textStyle,
    required String instruction}) {
  return pw.Row(children: [
    pw.Expanded(child: pw.Text(medicine, maxLines: 1, style: textStyle)),
    pw.Expanded(
        child: pw.Text(dose == 'Select' ? '' : dose,
            maxLines: 1, style: textStyle)),
    pw.Expanded(
        child: pw.Text(when == 'Select' ? '' : when,
            maxLines: 1, style: textStyle)),
    pw.Expanded(
        child: pw.Text(frequency == 'Select' ? '' : frequency,
            maxLines: 1, style: textStyle)),
    pw.Expanded(
        child: pw.Text(duration.split(' ').last == 'Select' ? '' : duration,
            maxLines: 1, style: textStyle)),
    pw.Expanded(child: pw.Text(instruction, maxLines: 1, style: textStyle)),
  ]);
}
