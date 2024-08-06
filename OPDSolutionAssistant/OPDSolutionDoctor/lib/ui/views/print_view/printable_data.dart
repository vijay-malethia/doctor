import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

buildPrintableData(
        doctorlistfirstName,
        doctorlistlastName,
        doctorlistspecialization,
        doctorlistgender,
        doctorlistage,
        doctorlistphoneNumber,
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
        advice) =>
    pw.Container(
        child: pw.ListView(children: [
      renderDoctorInfo(
          doctorlistfirstName,
          doctorlistlastName,
          doctorlistspecialization,
          doctorlistgender,
          doctorlistage,
          doctorlistphoneNumber), // Render Doctor Info
      pw.SizedBox(height: 10),
      renderVitals(userName, age, gender, phoneNumber, appointmentDate, height,
          weight, pulse, bp, temperature),
      pw.SizedBox(height: 10), //vitals
      renderSympOrDiagnosis(diagnosis, symptoms),
      pw.SizedBox(height: 10), //Render Symptoms or Diagnosis
      renderMedicines(medicine),
      pw.SizedBox(height: 10), //Render Medicines
      if (advice != null && advice != "") renderAdvice(advice),
      pw.SizedBox(height: 10), //Advice
    ]));

////////////////////////////////////////////////////////////////////////Doctor Info//////////////////////////////////////////////////////////////////////////////////
renderDoctorInfo(
  doctorlistfirstName,
  doctorlistlastName,
  doctorlistspecialization,
  doctorlistgender,
  doctorlistage,
  doctorlistphoneNumber,
) {
  return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('$doctorlistfirstName $doctorlistlastName',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: const PdfColor.fromInt(0xFF0374ED))),
            pw.Text(doctorlistspecialization,
                style: const pw.TextStyle(fontSize: 12)),
            pw.Text(doctorlistgender, style: const pw.TextStyle(fontSize: 12)),
            pw.Text(doctorlistage, style: const pw.TextStyle(fontSize: 12)),
            pw.Text(doctorlistphoneNumber,
                style: const pw.TextStyle(fontSize: 12))
          ]));
}

/////////////////////////////////////////////////////////////////////////////Vitals////////////////////////////////////////////////////////////////////////////////
renderVitals(
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
) {
  return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(16),
          color: const PdfColor.fromInt(0xFFCFE4FC)),
      height: 100,
      child: pw.Column(children: [
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Expanded(
              flex: 2,
              child: pw.Text('HPLXDEMO43796595:',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 4,
              child: pw.Text('Mr. $userName  ( $age , $gender )-$phoneNumber',
                  style: const pw.TextStyle(fontSize: 12)))
        ]),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Expanded(
              flex: 2,
              child: pw.Text('Date',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 4,
              child: pw.Text(appointmentDate.toString(),
                  style: const pw.TextStyle(fontSize: 12)))
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          renderVitalChip(' Height', '$height'),
          renderVitalChip(' Weight', weight),
          renderVitalChip(' Temprature', pulse),
          renderVitalChip(' Pulse', bp),
          renderVitalChip(' BP', temperature)
        ])
      ]));
}

renderVitalChip(name, value) {
  return pw.Container(
      height: 30,
      margin: const pw.EdgeInsets.symmetric(vertical: 10),
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(10),
          color: const PdfColor.fromInt(0xFFFFFF)),
      child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
          children: [
            pw.Text(name),
            pw.SizedBox(width: 10),
            pw.Container(
                height: 35,
                padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                margin: const pw.EdgeInsets.symmetric(vertical: 5),
                decoration: pw.BoxDecoration(
                    color: const PdfColor.fromInt(0xFFCFE4FC),
                    borderRadius: pw.BorderRadius.circular(11)),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    '$value${name == 'Height' ? 'inch' : name == 'Weight' ? 'kg' : name == 'Pulse ' ? '/min' : name == 'BP' ? '/80' : '°F'}',
                    style: const pw.TextStyle(
                        fontSize: 10, color: PdfColor.fromInt(0xFF0374ED))))
          ]));
}

/////////////////////////////////////////////////////////////////////Render Symptom and Diagnosis//////////////////////////////////////////////////////////
renderSympOrDiagnosis(diagnosis, symptoms) {
  return pw.Container(
      child: pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
        pw.Expanded(
            child: renderSympOrDiagChip(
                list: symptoms, name: 'Symptom', isVisibale: true)),
        pw.SizedBox(width: 10),
        pw.Expanded(
            child: renderSympOrDiagChip(
                list: diagnosis, name: 'Diagnosis', isVisibale: true))
      ]));
}

renderSympOrDiagChip({list, name, context, required bool isVisibale}) {
  return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(16),
          color: const PdfColor.fromInt(0xFFF0F7FE)),
      child:
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('$name:',
              style: pw.TextStyle(
                  color: const PdfColor.fromInt(0xFF0374ED),
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold))
        ]),
        pw.SizedBox(height: 10),
        pw.Wrap(
            spacing: 5.0,
            runSpacing: 8.0,
            children: List.generate(
                list.length,
                (index) => pw.Container(
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFFCFE4FC)),
                        borderRadius: pw.BorderRadius.circular(16),
                        color: const PdfColor.fromInt(0xFFFFFF)),
                    height: 30,
                    padding: const pw.EdgeInsets.symmetric(horizontal: 15),
                    child: pw.Row(mainAxisSize: pw.MainAxisSize.min, children: [
                      pw.Text('${list[index]}',
                          style: const pw.TextStyle(fontSize: 12))
                    ]))))
      ]));
}

//////////////////////////////////////////////////////////////////////////Render Medicine///////////////////////////////////////////////////////////////////////////////////////
renderMedicines(medicine) {
  return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(16),
          color: const PdfColor.fromInt(0xFFF0F7FE)),
      child: pw.Column(children: [
        pw.SizedBox(height: 15),
        pw.Container(
            height: 42,
            padding: const pw.EdgeInsets.symmetric(horizontal: 25),
            decoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xFF0374ED),
                borderRadius: pw.BorderRadius.only(
                    topRight: pw.Radius.circular(16),
                    topLeft: pw.Radius.circular(16))),
            child: pw.Row(children: [
              pw.Expanded(
                  child: pw.Text('Medicine',
                      style: pw.TextStyle(
                          color: const PdfColor.fromInt(0xFFFFFF),
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold))),
              pw.Expanded(
                  child: pw.Text('Dose',
                      style: pw.TextStyle(
                          color: const PdfColor.fromInt(0xFFFFFF),
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold))),
              pw.Expanded(
                  child: pw.Text('When',
                      style: pw.TextStyle(
                          color: const PdfColor.fromInt(0xFFFFFF),
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold))),
              pw.Expanded(
                  child: pw.Text('Frequency',
                      style: pw.TextStyle(
                          color: const PdfColor.fromInt(0xFFFFFF),
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold))),
              pw.Expanded(
                  child: pw.Text('Duration',
                      style: pw.TextStyle(
                          color: const PdfColor.fromInt(0xFFFFFF),
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold)))
            ])),
        medicine.isEmpty
            ? pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Text('No Record Found',
                    style: const pw.TextStyle(fontSize: 16)))
            : pw.ListView.builder(
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return renderMedicineRow(
                      index: index,
                      medicine: medicine[index].medicine,
                      dose: medicine[index].dose,
                      when: medicine[index].when,
                      frequency: medicine[index].frequency,
                      duration: medicine[index].duration);
                })
      ]));
}

renderMedicineRow(
    {required int index,
    required String medicine,
    required String dose,
    required String when,
    required String frequency,
    required String duration}) {
  return pw.Container(
      margin: pw.EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: medicine.length - 1 == index ? 10 : 0),
      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(8),
          color: index % 2 != 0
              ? const PdfColor.fromInt(0xFFF0F7FE)
              : const PdfColor.fromInt(0xFFf9f9f9)),
      child: pw.SizedBox(
          height: 45,
          child: pw.Row(children: [
            pw.Expanded(child: pw.Text(medicine, maxLines: 1)),
            pw.Expanded(child: pw.Text(dose, maxLines: 1)),
            pw.Expanded(child: pw.Text(when, maxLines: 1)),
            pw.Expanded(child: pw.Text(frequency, maxLines: 1)),
            pw.Expanded(child: pw.Text(duration, maxLines: 1))
          ])));
}

/////////////////////////////////////////////////////////////////////////////Advice/////////////////////////////////////////////////////////////////////////////////////////
renderAdvice(advice) {
  return pw.Container(
      height: 80,
      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(16),
          color: const PdfColor.fromInt(0xFFF0F7FE)),
      child: pw.Column(children: [
        pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text('Advice:',
                style: pw.TextStyle(
                    color: const PdfColor.fromInt(0xFF0374ED),
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold))),
        pw.Expanded(
            child: pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(advice.toString(),
                    style: const pw.TextStyle(fontSize: 12))))
      ]));
}
