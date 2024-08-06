import 'package:flutter/material.dart';

import 'package:opd_doctor/ui/views/print_view/print_view_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../model/medicine_model.dart';
import '/widgets/button.dart';

import '../../common/index.dart';

class PrintViewView extends StackedView<PrintViewViewModel> {
  final String? userName;
  final String? gender;
  final String? age;
  final String? phoneNumber;
  final String? id;
  final String? appointId;
  final String? height;
  final String? weight;
  final String? bp;
  final String? pulse;
  final String? temperature;
  final String? advice;
  final List<dynamic> diagnosis;
  final List<dynamic> symptoms;
  final String? appointmentDate;

  final List<MedicineModel> medicine;
  const PrintViewView(
      {required this.userName,
      required this.age,
      required this.gender,
      required this.phoneNumber,
      required this.id,
      required this.appointId,
      required this.height,
      required this.weight,
      required this.pulse,
      required this.bp,
      required this.temperature,
      required this.advice,
      required this.diagnosis,
      required this.medicine,
      required this.symptoms,
      required this.appointmentDate,
      Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PrintViewViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: renderAppBar(context, theme, viewModel),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                child: ListView(children: [
                  verticalSpaceSmall,
                  renderDoctorInfo(viewModel), // Render Doctor Info
                  const SizedBox(height: 15),
                  renderVitals(context, viewModel), //vitals
                  const SizedBox(height: 15),
                  renderSympOrDiagnosis(
                      viewModel, context), //Render Symptoms or Diagnosis
                  const SizedBox(height: 15),
                  renderMedicines(viewModel, context,
                      theme: theme), //Render Medicines
                  const SizedBox(height: 15),
                  if (advice != null && advice != "")
                    renderAdvice(context, viewModel), //Advice
                  // const SizedBox(height: 15),
                  // Container(
                  //     //QR Code
                  //     alignment: Alignment.centerLeft,
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: SizedBox(
                  //         height: 130,
                  //         width: 130,
                  //         child: SfBarcodeGenerator(
                  //             value: 'Pizone Infotech',
                  //             symbology: QRCode(),
                  //             showValue: false)))
                ]),
              ));
  }

//////////////////////////////////////////////////////////////////////////Doctor Info/////////////////////////////////////////////////////////////////////////////////////
  renderDoctorInfo(PrintViewViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
                '${viewModel.doctorlist[0].firstName} ${viewModel.doctorlist[0].lastName}',
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: primaryColor)),
            Text(viewModel.doctorlist[0].specialization,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            Text(viewModel.doctorlist[0].gender,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            Text(viewModel.doctorlist[0].age,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            Text(viewModel.doctorlist[0].phoneNumber,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))
          ]),
    );
  }

/////////////////////////////////////////////////////////////////////////////Advice/////////////////////////////////////////////////////////////////////////////////
  Container renderAdvice(BuildContext context, PrintViewViewModel viewModel) {
    return Container(
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: bglightColor),
        child: Column(children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text('Advice:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700))),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(advice.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 23, 24, 26),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500))))
        ]));
  }

////////////////////////////////////////////////////////////////////////Render Symptom and Diagnosis//////////////////////////////////////////////////////////
  renderSympOrDiagnosis(PrintViewViewModel viewModel, BuildContext context) {
    return IntrinsicHeight(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: renderSympOrDiagChip(
                    viewModel: viewModel,
                    list: symptoms,
                    name: 'Symptom',
                    context: context,
                    isVisibale: true)),
            horizontalSpaceMedium,
            Expanded(
                child: renderSympOrDiagChip(
                    viewModel: viewModel,
                    list: diagnosis,
                    name: 'Diagnosis',
                    context: context,
                    isVisibale: true))
          ]),
    );
  }

  Container renderSympOrDiagChip(
      {required PrintViewViewModel viewModel,
      list,
      name,
      context,
      required bool isVisibale}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: bglightColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('$name:',
                style: const TextStyle(
                    color: Color.fromARGB(255, 3, 116, 237),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    height: 1,
                    fontWeight: FontWeight.w700))
          ]),
          verticalSpaceSmall,
          Wrap(
              spacing: 5.0,
              runSpacing: 8.0,
              children: List.generate(
                  list.length,
                  (index) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColorLight),
                          borderRadius: BorderRadius.circular(38),
                          color: Colors.white),
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(list[index],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 23, 24, 26),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                height: 1,
                                fontWeight: FontWeight.w500))
                      ]))))
        ]));
  }

/////////////////////////////////////////////////////////////////////////////Vitals////////////////////////////////////////////////////////////////////////////////
  Container renderVitals(context, PrintViewViewModel viewModel) {
    var theme = Theme.of(context).textTheme;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: primaryColorLight),
        height: 155,
        child: Column(children: [
          verticalSpaceSmall,
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Expanded(
                flex: 1,
                child: Text('HPLXDEMO43796595:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
            Expanded(
                flex: 3,
                child: Text('Mr. $userName ($age, $gender) - $phoneNumber',
                    style: const TextStyle(fontSize: 18)))
          ]),
          verticalSpaceSmall,
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Expanded(
                flex: 1,
                child: Text('Date:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
            Expanded(
                flex: 3,
                child: Text(appointmentDate.toString(),
                    style: const TextStyle(fontSize: 18)))
          ]),
          verticalSpaceSmall,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            renderVitalChip(theme, 'Height', '$height'),
            renderVitalChip(theme, 'Weight', weight),
            renderVitalChip(theme, 'Temperature', pulse),
            renderVitalChip(theme, 'Pulse', bp),
            renderVitalChip(theme, 'BP', temperature)
          ])
        ]));
  }

  Container renderVitalChip(TextTheme theme, name, value) {
    return Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(name, style: theme.labelSmall),
          horizontalSpaceSmall,
          Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(50)),
              alignment: Alignment.center,
              child: Text(
                  '$value ${name == 'Height' ? 'inch' : name == 'Weight' ? 'kg' : name == 'Pulse' ? '/min' : name == 'BP' ? '/80' : '°F'}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 16,
                      fontWeight: FontWeight.w700)))
        ]));
  }

////////////////////////////////////////////////////////////////////////////////////AppBar/////////////////////////////////////////////////////////////////////

  AppBar renderAppBar(context, theme, PrintViewViewModel viewModel) {
    return AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 87,
        leadingWidth: 170,
        leading: const Padding(
            padding: EdgeInsets.all(22.0),
            child: Text("Print View",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700))),
        actions: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
              width: 100,
              child: Button(
                  height: 47,
                  onPressed: () {
                    viewModel.goBack();
                  },
                  title: 'Cancel')),
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
              width: 90,
              child: Button(
                  height: 47,
                  onPressed: () {
                    viewModel.printDoc(
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
                  },
                  title: 'Print',
                  isWhiteBg: true))
        ]);
  }

/////////////////////////////////////////////////////////////////////////render Medicines/////////////////////////////////////////////////////////////////////////////////
  Widget renderMedicines(PrintViewViewModel viewModel, context,
      {required TextTheme theme}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: bglightColor, borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          const SizedBox(height: 15),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                Container(
                    height: 62,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16))),
                    child: Row(children: [
                      Expanded(
                          child: Text('Medicine',
                              textAlign: TextAlign.start,
                              style: theme.titleMedium)),
                      Expanded(
                          child: Text('Dose',
                              style: theme.titleMedium,
                              textAlign: TextAlign.start)),
                      Expanded(
                          child: Text('When',
                              style: theme.titleMedium,
                              textAlign: TextAlign.start)),
                      Expanded(
                          child: Text('Frequency',
                              textAlign: TextAlign.start,
                              style: theme.titleMedium)),
                      Expanded(
                          child: Text('Duration',
                              textAlign: TextAlign.start,
                              style: theme.titleMedium))
                    ])),
                medicine.isEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text('No Record Found',
                            style: TextStyle(fontSize: 16)))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: medicine.length,
                        itemBuilder: (context, index) {
                          return renderMedicineRow(
                              index: index,
                              viewModel: viewModel,
                              medicine: medicine[index].medicine,
                              dose: medicine[index].dose,
                              when: medicine[index].when,
                              frequency: medicine[index].frequency,
                              duration: medicine[index].duration);
                        })
              ]))
        ]));
  }

  Container renderMedicineRow({
    required int index,
    required String medicine,
    required String dose,
    required String when,
    required String frequency,
    required String duration,
    required PrintViewViewModel viewModel,
  }) {
    return Container(
        margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: medicine.length - 1 == index ? 10 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: index % 2 != 0 ? bglightColor : const Color(0xFFf9f9f9)),
        child: SizedBox(
            height: 65,
            child: Row(children: [
              Expanded(
                  child: Text(medicine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xff17181A),
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child:
                      Text(dose, maxLines: 1, overflow: TextOverflow.ellipsis)),
              Expanded(
                  child:
                      Text(when, maxLines: 1, overflow: TextOverflow.ellipsis)),
              Expanded(
                  child: Text(frequency,
                      maxLines: 1, overflow: TextOverflow.ellipsis)),
              Expanded(
                  child: Text(duration,
                      maxLines: 1, overflow: TextOverflow.ellipsis))
            ])));
  }

  @override
  PrintViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrintViewViewModel()..getDoctor();
}
