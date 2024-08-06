import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/medicine_model.dart';
import 'print_viewmodel.dart';

class PrintView extends StackedView<PrintViewModel> {
  final String? userName;
  final String? gender;
  final String? age;
  final String? phoneNumber;
  final String? height;
  final String? weight;
  final String? bp;
  final String? complaints;
  final String? diagnosis;
  final String? advice;
  final String? reports;
  final String? activeStep;
  final String? doctor;
  final String? number;
  final String? pulse;
  final String? temperature;
  final String? specialization;

  final List<MedicineModel> medicine;

  const PrintView(
      {Key? key,
      required this.advice,
      required this.reports,
      required this.age,
      required this.bp,
      required this.complaints,
      required this.diagnosis,
      required this.gender,
      required this.height,
      required this.medicine,
      required this.phoneNumber,
      required this.userName,
      required this.weight,
      required this.doctor,
      required this.number,
      required this.pulse,
      required this.temperature,
      required this.activeStep,
      required this.specialization})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PrintViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: ListView(
            children: [
              const Text("Print Preview",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              Divider(thickness: 2, color: Colors.grey.shade200),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$doctor',
                            style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1765ae)),
                          ),
                          Text(
                            "$specialization",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Contact:$number",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                  padding: const EdgeInsets.all(10),
                  height: 90,
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f4ff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(children: [
                    Row(children: [
                      const Expanded(
                          flex: 1,
                          child: Text("HPLXDEM043796595:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Expanded(
                          flex: 3,
                          child: Text('$userName ($age.$gender) - $phoneNumber',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)))
                    ]),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Expanded(
                          flex: 1,
                          child: Text("Date:",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Expanded(
                          flex: 3,
                          child: Text("$activeStep",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)))
                    ])
                  ])),
              const SizedBox(height: 40),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Height:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                const SizedBox(width: 20),
                                Text('$height',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Pulse:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                const SizedBox(width: 20),
                                Text('$pulse',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Weight:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                const SizedBox(width: 20),
                                Text('$weight',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Temperature:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                const SizedBox(width: 20),
                                Text('$temperature',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("BP:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                const SizedBox(width: 20),
                                Text('$bp',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ])),
                    ]),
                    const SizedBox(height: 20),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Symptoms:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black))),
                          Expanded(
                              flex: 7,
                              child: Text('$complaints',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))
                        ]),
                    const SizedBox(height: 20),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Diagnosis:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black))),
                          Expanded(
                              flex: 7,
                              child: Text('$diagnosis',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))
                        ]),
                    const SizedBox(height: 20),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Reports:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black))),
                          Expanded(
                              flex: 7,
                              child: Text('$reports',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))
                        ]),
                    const SizedBox(height: 40),
                    Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Column(children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: renderRow(
                                  medicine: 'Medicine',
                                  dose: 'Dosage',
                                  when: 'When',
                                  frequency: "Frequency",
                                  duration: "Duration",
                                  instruction: "Instruction",
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16))),
                          const SizedBox(height: 15),
                          Container(
                              padding: const EdgeInsets.all(10),
                              // height: 200,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF2F4FF),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: medicine.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, index) {
                                    return renderRow(
                                        medicine:
                                            medicine[index].medicine.toString(),
                                        dose: medicine[index].dose.toString(),
                                        when: medicine[index].when.toString(),
                                        frequency: medicine[index]
                                            .frequency
                                            .toString(),
                                        duration:
                                            medicine[index].duration.toString(),
                                        instruction: medicine[index]
                                            .instruction
                                            .toString(),
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16));
                                  })),
                        ])),
                    const SizedBox(height: 40),
                  ])),
              advice == ''
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: RichText(
                          text: TextSpan(
                              text: 'Advice:  ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                            TextSpan(
                                text: advice,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17))
                          ])),
                    ),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff848484)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                        onPressed: viewModel.goToBack,
                        child: const Center(
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))))),
                const SizedBox(width: 5),
                SizedBox(
                    height: 50,
                    width: 90,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff1765ae)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                        onPressed: () {
                          viewModel.printDoc(
                              userName,
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
                              medicine
                              // specialization
                              );
                        },
                        child: const Center(
                            child: Text('Print',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)))))
              ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  PrintViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrintViewModel();
}

Widget renderRow(
    {required String medicine,
    required String dose,
    required String when,
    required String frequency,
    required String duration,
    required TextStyle textStyle,
    required String instruction}) {
  return Row(children: [
    Expanded(child: Text(medicine, style: textStyle)),
    Expanded(child: Text(dose == 'Select' ? '' : dose, style: textStyle)),
    Expanded(child: Text(when == 'Select' ? '' : when, style: textStyle)),
    Expanded(
        child: Text(frequency == 'Select' ? '' : frequency, style: textStyle)),
    Expanded(
        child: Text(duration.split(' ').last == 'Select' ? '' : duration,
            style: textStyle)),
    Expanded(child: Text(instruction, style: textStyle)),
  ]);
}
