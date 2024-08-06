import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opd_doctor/ui/common/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/widgets/drawer_navigator.dart';
import '../../common/index.dart';
import 'patient_viewmodel.dart';
import 'patient_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'advice'),
  FormTextField(name: 'instruction'),
  FormTextField(name: 'search'),
])
class PatientView extends StackedView<PatientViewModel> with $PatientView {
  final String? userName;
  final String? gender;
  final String? age;
  final String? phoneNumber;
  final String? id;
  final String? appointId;
  const PatientView(
      {required this.userName,
      required this.age,
      required this.gender,
      required this.phoneNumber,
      required this.id,
      required this.appointId,
      Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: renderAppBar(context, theme, viewModel),
        drawer: DrawerNavigator(),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                child: ListView(
                  children: [
                    verticalSpaceSmall,
                    renderAppointments(
                        viewModel, theme, context), //appointment dates
                    verticalSpaceMedium,
                    renderVitals(context, viewModel), //vitals
                    const SizedBox(height: 15),
                    renderSympOrDiagnosis(
                        viewModel, context), //Render Symptoms or Diagnosis
                    const SizedBox(height: 15),
                    renderReport(context, viewModel), //Render Report
                    const SizedBox(height: 15),
                    renderMedicines(viewModel, context,
                        theme: theme), //Render Medicines
                    const SizedBox(height: 15),
                    renderAdvice(context, viewModel), //Advice
                    const SizedBox(height: 15),
                    renderNextAppointmnet(
                        context, viewModel), //Render Next Appointment
                  ],
                )));
  }

////////////////////////////////////////////////////////////////Next Appointment/////////////////////////////////////////////////
  Container renderNextAppointmnet(
      BuildContext context, PatientViewModel viewModel) {
    return Container(
      height: 147,
      padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: bglightColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Next Appointment:',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color.fromARGB(255, 3, 116, 237),
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  horizontalSpaceSmall,
                  Text(
                      '${viewModel.selectedDate.toString().split(' ').first}  (${viewModel.nextAppointRange.toString().split('.').first} ${viewModel.checkMonthOrDay})',
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700))
                ],
              ),
              Container(
                height: 47,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(63)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!viewModel.isConsultationComplete) {
                          viewModel.toggleDayMonth('Day');
                        }
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(63),
                            color: viewModel.checkMonthOrDay == 'Day'
                                ? primaryColor
                                : Colors.white),
                        alignment: Alignment.center,
                        child: Text('Day',
                            style: TextStyle(
                                color: viewModel.checkMonthOrDay == 'Day'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!viewModel.isConsultationComplete) {
                          viewModel.toggleDayMonth('Month');
                        }
                      },
                      child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(63),
                              color: viewModel.checkMonthOrDay == 'Month'
                                  ? primaryColor
                                  : Colors.white),
                          child: Text('Month',
                              style: TextStyle(
                                  color: viewModel.checkMonthOrDay == 'Month'
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 47,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.nextAppoinmentList.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              if (!viewModel.isConsultationComplete) {
                                viewModel.customRange.clear();
                                viewModel.selectRange(
                                    int.parse(
                                        viewModel.nextAppoinmentList[index]),
                                    index: index);
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: viewModel.nextAppointRange
                                              .toString()
                                              .split('.')
                                              .first ==
                                          viewModel.nextAppoinmentList[index]
                                      ? primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                '${viewModel.checkMonthOrDay == 'Day' ? viewModel.nextAppoinmentList[index] : viewModel.nextAppointmentMonth[index]} ${viewModel.checkMonthOrDay}s',
                                style: TextStyle(
                                    color: viewModel.nextAppointRange
                                                .toString()
                                                .split('.')
                                                .first ==
                                            viewModel.nextAppoinmentList[index]
                                        ? Colors.white
                                        : primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ))),
                ),
              ),
              horizontalSpaceMedium,
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 47,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 47,
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                controller: viewModel.customRange,
                                readOnly: !viewModel.isConsultationComplete
                                    ? false
                                    : true,
                                maxLines: 1,
                                onTapOutside: (value) {},
                                onEditingComplete: () {
                                  viewModel.postPatientData();
                                  dismissKeyboard();
                                },
                                onChanged: (value) {
                                  viewModel.selectRange(
                                      int.parse(value.isEmpty ? '0' : value));
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700)))),
                    Text(
                      'Custom ${viewModel.checkMonthOrDay}s',
                      style: const TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

//////////////////////////////////////////////////////////////////Advice/////////////////////////////////////////////////
  Container renderAdvice(BuildContext context, PatientViewModel viewModel) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: bglightColor),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text('Advice:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700))),
          Expanded(
            child: TextFormField(
              controller: viewModel.adviceCtrl,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              readOnly: !viewModel.isConsultationComplete ? false : true,
              autofocus: false,
              onTapOutside: (value) {
                // viewModel.onInputSubmit(advice: viewModel.adviceCtrl.text);
              },
              onEditingComplete: () {
                viewModel.onInputSubmit(advice: viewModel.adviceCtrl.text);
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type here advice for patient...",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 23, 24, 26),
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0)),
              style: const TextStyle(
                  color: Color.fromARGB(255, 23, 24, 26),
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////Report///////////////////////////////////////////////////////////
  Container renderReport(BuildContext context, PatientViewModel viewModel) {
    return Container(
      // height: 290,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: bglightColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4.0, top: 7),
              child: const Text('Reports:',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700)),
            ),
            Row(children: [
              if (viewModel.checkPreviousDataList['reports'].toString() !=
                      '[]' &&
                  viewModel.checkPreviousDataList.isNotEmpty &&
                  !viewModel.isConsultationComplete)
                renderCopyButton(onTap: () {
                  viewModel.copyDataLastAppointment(listName: 'Add Report');
                }),
              horizontalSpaceSmall,
              if (!viewModel.isConsultationComplete)
                renderAddButton(onTap: () {
                  viewModel.showReportBottomSheet();
                })
            ])
          ]),
          verticalSpaceSmall,
          selectedReportList.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 195,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedReportList.length,
                      itemBuilder: (context, index) => selectedReportList[index]
                                      ['reportName']
                                  .toString()
                                  .trim() ==
                              ""
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                if (selectedReportList[index]['filePath'] !=
                                    '') {
                                  viewModel.goToReportView(
                                      reportUrl: selectedReportList[index]
                                          ['filePath'],
                                      reportName: selectedReportList[index]
                                          ['reportName']);
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 15, bottom: 10),
                                // padding: EdgeInsets.only(
                                //     top: selectedReportList[index]
                                //                 ['filePath'] ==
                                //             ''
                                //         ? 5
                                //         : 30,
                                //     right: 10,
                                //     left: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                width: 167,
                                child: Column(
                                  children: [
                                    selectedReportList[index]['filePath'] ==
                                                '' &&
                                            !viewModel.isConsultationComplete
                                        ? InkWell(
                                            onTap: () {
                                              viewModel.onReportsChipDisplayTap(
                                                  index);
                                            },
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  height: 22,
                                                  width: 22,
                                                  // margin: const EdgeInsets.only(
                                                  //     right: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: bglightColor),
                                                  child: const Icon(Icons.close,
                                                      size: 18)),
                                            ),
                                          )
                                        : const SizedBox(height: 22, width: 22),
                                    // if (viewModel.isConsultationComplete)
                                    //   const SizedBox(height: 25, width: 25),
                                    selectedReportList[index]['filePath'] != ''
                                        ? SvgPicture.asset(Images().reportIcon)
                                        : SvgPicture.asset(
                                            Images().reportNotUploade),
                                    verticalSpaceSmall,
                                    Expanded(
                                      child: Text(
                                          selectedReportList[index]
                                              ['reportName'],
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 23, 24, 26),
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                            )))
        ],
      ),
    );
  }

  InkWell renderAddButton({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56), color: Colors.white),
          child: const Icon(Icons.add, color: primaryColor)),
    );
  }

  InkWell renderCopyButton({void Function()? onTap}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56), color: Colors.white),
            child: const Icon(Icons.copy, color: primaryColor, size: 18)));
  }

////////////////////////////////////////////////////////////////////////Render Symptom and Diagnosis//////////////////////////////////////////////////////////
  renderSympOrDiagnosis(PatientViewModel viewModel, BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: renderSympOrDiagChip(
                viewModel: viewModel,
                list: selectedSymptomsList,
                name: 'Symptoms',
                context: context,
                isVisibale:
                    viewModel.checkPreviousDataList['symptoms'].toString() !=
                            '[]' &&
                        viewModel.checkPreviousDataList.isNotEmpty,
                onTap: () {
                  viewModel.copyDataLastAppointment(listName: 'Add Symptoms');
                },
                onAddButtonTap: () {
                  viewModel.showSymtomBottomSheet();
                }),
          ),
          horizontalSpaceMedium,
          Expanded(
            child: renderSympOrDiagChip(
                viewModel: viewModel,
                list: selectedDiagnosisList,
                name: 'Diagnosis',
                context: context,
                isVisibale:
                    viewModel.checkPreviousDataList['diagnosis'].toString() !=
                            '[]' &&
                        viewModel.checkPreviousDataList.isNotEmpty,
                onTap: () {
                  viewModel.copyDataLastAppointment(listName: 'Add Diagnosis');
                },
                onAddButtonTap: () {
                  viewModel.showDiagnosisBottomSheet();
                }),
          ),
        ],
      ),
    );
  }

  Container renderSympOrDiagChip(
      {required PatientViewModel viewModel,
      list,
      name,
      context,
      required bool isVisibale,
      onTap,
      onAddButtonTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: bglightColor),
      // height: 205,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4.0, top: 7),
              child: Text('$name:',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 18,
                      fontFamily: 'Lato',
                      height: 1,
                      fontWeight: FontWeight.w700)),
            ),
            Row(
              children: [
                isVisibale && !viewModel.isConsultationComplete
                    ? renderCopyButton(onTap: onTap)
                    : const SizedBox(),
                horizontalSpaceSmall,
                if (!viewModel.isConsultationComplete)
                  InkWell(
                    onTap: onAddButtonTap,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: Colors.white),
                        child: const Icon(Icons.add, color: primaryColor)),
                  ),
              ],
            )
          ]),
          verticalSpaceSmall,
          Wrap(
              spacing: 5.0,
              runSpacing: 8.0,
              children: List.generate(
                  list.length,
                  (index) => InkWell(
                        onTap: () {
                          if (!viewModel.isConsultationComplete) {
                            name == 'Symptoms'
                                ? viewModel.onSymptomChipDisplayTap(index)
                                : viewModel.onDiagnosisChipDisplayTap(index);
                          }
                        },
                        child: Container(
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
                                    fontSize: 18,
                                    fontFamily: 'Lato',
                                    height: 1,
                                    fontWeight: FontWeight.w500)),
                            if (!viewModel.isConsultationComplete) ...[
                              horizontalSpaceTiny,
                              const Icon(Icons.close, size: 18)
                            ]
                          ]),
                        ),
                      ))),
          verticalSpaceSmall
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////Vitals////////////////////////////////////////////////////////////////////////////////
  Container renderVitals(context, PatientViewModel viewModel) {
    var theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: primaryColorLight),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          renderVitalChip(theme, 'Height', viewModel.height),
          renderVitalChip(theme, 'Weight', viewModel.weight),
          renderVitalChip(theme, 'Temperature', viewModel.temp),
          renderVitalChip(theme, 'Pulse', viewModel.pulse),
          renderVitalChip(theme, 'BP', viewModel.bp),
        ],
      ),
    );
  }

  Container renderVitalChip(TextTheme theme, name, value) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name, style: theme.labelSmall),
          horizontalSpaceSmall,
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(16)),
              alignment: Alignment.center,
              child: Text(
                  '$value ${name == 'Height' ? 'inch' : name == 'Weight' ? 'kg' : name == 'Pulse' ? '/min' : name == 'BP' ? '' : '°F'}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 3, 116, 237),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }

/////////////////////////////////////////////////////////////////////Appointment Dates/////////////////////////////////////////////////////////////////////////

  SizedBox renderAppointments(
      PatientViewModel viewModel, TextTheme theme, context) {
    return SizedBox(
      height: 118,
      // width: screenWidth(context),
      child: ListView.builder(
        // shrinkWrap: true,
        controller: viewModel.scrollController,
        itemCount: viewModel.dateGroups.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String year = viewModel.dateGroups.keys.elementAt(index);
          List datesInYear = viewModel.dateGroups[year]!;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 33,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: primaryColorLight),
                margin: EdgeInsets.only(right: 10, left: index == 0 ? 0 : 10),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    year,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                        color: primaryColor),
                  ),
                ),
              ),
              ...datesInYear.asMap().entries.map((data) => GestureDetector(
                    onTap: () {
                      viewModel.getMedicalRecords(data.value['id'], data.value,
                          isComplete: data.value['isComplete']);
                      viewModel.getLastAppointmentId(data, index, datesInYear);
                    },
                    child: Container(
                      width: 63,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 13),
                      decoration: BoxDecoration(
                        color: appointmentId == data.value['id']
                            ? primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 1.0,
                              spreadRadius: 1,
                              offset: const Offset(2, 2))
                        ],
                      ),
                      child: Column(children: [
                        Container(
                            width: double.infinity,
                            height: 46,
                            decoration: BoxDecoration(
                                color: appointmentId == data.value['id']
                                    ? Colors.white12
                                    : primaryColorLight,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(
                                data.value['appointmentDate'].substring(8, 10),
                                style: TextStyle(
                                    color: appointmentId == data.value['id']
                                        ? Colors.white
                                        : primaryColor,
                                    fontSize: 21,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700))),
                        const SizedBox(height: 5),
                        Text(viewModel.formattedMonth(index),
                            style: TextStyle(
                                color: appointmentId == data.value['id']
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600))
                      ]),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////AppBar/////////////////////////////////////////////////////////////////////

  AppBar renderAppBar(context, theme, PatientViewModel viewModel) {
    return AppBar(
      backgroundColor: primaryColor,
      toolbarHeight: 77,
      leadingWidth: 80,
      centerTitle: true,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.black),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Text("$userName",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700)),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$age | $gender | $phoneNumber', style: theme.titleSmall)
                ],
              )
            ],
          ),
        ],
      ),
      leading: Builder(
        builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(Images().menuIcon),
            )),
      ),
      actions: [
        InkWell(
            onTap: () {
              viewModel.goToPrint(
                  userName: userName,
                  age: age,
                  gender: gender,
                  phoneNumber: phoneNumber,
                  id: id,
                  appointId: appointId,
                  adviceText: viewModel.adviceCtrl.text);
            },
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(Images().printIcon))),
        if (!viewModel.isConsultationComplete)
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 0),
              // width: 220,
              child: InkWell(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('End Consultation',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)))),
                  onTap: () {
                    viewModel.goback();
                  }))
      ],
    );
  }

  @override
  PatientViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PatientViewModel()..getAllAppointDates(id: id);
}

Widget renderMedicines(PatientViewModel viewModel, context,
    {required TextTheme theme}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    decoration: BoxDecoration(
        color: bglightColor, borderRadius: BorderRadius.circular(16)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Medicines:',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 116, 237),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700)),
            Row(
              children: [
                if (viewModel.undoMedicineList.isNotEmpty &&
                    !viewModel.isConsultationComplete) ...[
                  InkWell(
                    onTap: viewModel.undoMedicine,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: Colors.white),
                        child: const Icon(Icons.undo,
                            color: primaryColor, size: 20)),
                  ),
                  horizontalSpaceSmall
                ],
                if (viewModel.checkPreviousDataList['medicineData']
                            .toString() !=
                        '[]' &&
                    !viewModel.isConsultationComplete &&
                    viewModel.checkPreviousDataList.isNotEmpty) ...[
                  InkWell(
                      onTap: () {
                        viewModel.copyDataLastAppointment(
                            listName: 'Add Medicine');
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(56),
                              color: Colors.white),
                          child: const Icon(Icons.copy,
                              color: primaryColor, size: 18))),
                  horizontalSpaceSmall
                ],
                if (!viewModel.isConsultationComplete)
                  InkWell(
                    onTap: () {
                      viewModel.showMedicineBottomSheet();
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: Colors.white),
                        child: const Icon(Icons.add, color: primaryColor)),
                  )
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
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
                            style: theme.titleMedium)),
                  ])),
              // verticalSpaceTiny,
              selectedMedicineList.isEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'No Record Found',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: selectedMedicineList.length,
                      itemBuilder: (context, index) {
                        var textTheme = const TextStyle(
                            color: Color(0xff17181A),
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500);
                        return renderMedicineRow(
                          index: index,
                          viewModel: viewModel,
                          medicine: selectedMedicineList[index].medicine,
                          dose: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                iconSize: 0.0,
                                value:
                                    selectedMedicineList[index].dose.toString(),
                                items: viewModel.doseList
                                    .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value, style: textTheme)))
                                    .toList(),
                                onChanged: (String? value) {
                                  if (!viewModel.isConsultationComplete) {
                                    viewModel.changeDoseValue(value, index);
                                  }
                                },
                              ),
                              horizontalSpaceSmall,
                              if (index < selectedMedicineList.length - 1 &&
                                  !viewModel.isConsultationComplete)
                                InkWell(
                                    onTap: () {
                                      viewModel.copydoseDropdown(index);
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(56),
                                            color: Colors.white),
                                        child: const Icon(
                                          Icons.arrow_downward,
                                          color: primaryColor,
                                          size: 18,
                                        )))
                            ],
                          ),
                          when: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                iconSize: 0.0,
                                value: selectedMedicineList[index].when,
                                items: viewModel.foodMedicine
                                    .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value, style: textTheme)))
                                    .toList(),
                                onChanged: (String? value) {
                                  if (!viewModel.isConsultationComplete) {
                                    viewModel.changeFoodMedicineValue(
                                        value, index);
                                  }
                                },
                              ),
                              horizontalSpaceSmall,
                              if (index < selectedMedicineList.length - 1 &&
                                  !viewModel.isConsultationComplete)
                                InkWell(
                                    onTap: () {
                                      viewModel.copywhenDropdown(index);
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(56),
                                            color: Colors.white),
                                        child: const Icon(Icons.arrow_downward,
                                            size: 18, color: primaryColor)))
                            ],
                          ),
                          frequency: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                iconSize: 0,
                                value: selectedMedicineList[index].frequency,
                                items: viewModel.frequencyList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: SizedBox(
                                              width: 80,
                                              child: Text(value,
                                                  style: textTheme)),
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  if (!viewModel.isConsultationComplete) {
                                    viewModel.changeFrequencyValue(
                                        value, index);
                                  }
                                },
                              ),
                              horizontalSpaceSmall,
                              if (index < selectedMedicineList.length - 1 &&
                                  !viewModel.isConsultationComplete)
                                InkWell(
                                    onTap: () {
                                      viewModel.copyfrequencyDropdown(index);
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(56),
                                            color: Colors.white),
                                        child: const Icon(Icons.arrow_downward,
                                            size: 18, color: primaryColor)))
                            ],
                          ),
                          duration: Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: MediaQuery.of(context).size.width *
                                      0.1125,
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 0),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: primaryColorLight),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          child: TextFormField(
                                              controller: durList[index],
                                              textAlign: TextAlign.center,
                                              textInputAction:
                                                  TextInputAction.done,
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLines: 1,
                                              readOnly: viewModel
                                                      .isConsultationComplete
                                                  ? true
                                                  : false,
                                              maxLength: 2,
                                              autofocus: false,
                                              // onEditingComplete: () {
                                              //   viewModel
                                              //       .setDurationCtrlValue(
                                              //           index: index);
                                              // },
                                              onChanged: (_) {
                                                viewModel.setDurationCtrlValue(
                                                    index: index);
                                              },
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  counterText: '',
                                                  border: InputBorder.none),
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 23, 24, 26),
                                                  fontSize: 16,
                                                  height: 0.75,
                                                  fontFamily: 'Lato',
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                          child: DropdownButton(
                                            underline: const SizedBox(),
                                            iconSize: 0.0,
                                            alignment: Alignment.topLeft,
                                            value: selectedMedicineList[index]
                                                .duration
                                                .toString()
                                                .split(' ')
                                                .last,
                                            items: viewModel.durationList
                                                .map((value) =>
                                                    DropdownMenuItem(
                                                      value:
                                                          value.split(' ').last,
                                                      child: Text(value,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Lato',
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 16)),
                                                    ))
                                                .toList(),
                                            onChanged: (String? value) {
                                              if (!viewModel
                                                  .isConsultationComplete) {
                                                viewModel.changeDurationValue(
                                                    value, index);
                                              }
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.005),
                                index < selectedMedicineList.length - 1 &&
                                        !viewModel.isConsultationComplete
                                    ? InkWell(
                                        onTap: () {
                                          viewModel.copydurationDropdown(index);
                                        },
                                        child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(56),
                                                color: Colors.white),
                                            child: const Icon(
                                                Icons.arrow_downward,
                                                size: 18,
                                                color: primaryColor)))
                                    : const SizedBox(width: 30),
                                horizontalSpaceTiny,
                                if (!viewModel.isConsultationComplete)
                                  InkWell(
                                      onTap: () {
                                        viewModel
                                            .onMedicineChipDisplayTap(index);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: primaryColor,
                                        size: 18,
                                      ))
                              ],
                            ),
                          ),
                        );
                      }),
            ],
          ),
        ),
      ],
    ),
  );
}

Container renderMedicineRow({
  required int index,
  required String medicine,
  required Widget dose,
  required Widget when,
  required Widget frequency,
  void Function()? onArrowDownPress,
  required Widget duration,
  required PatientViewModel viewModel,
}) {
  return Container(
    margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: selectedMedicineList.length - 1 == index ? 10 : 0),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    height: 65,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: index % 2 != 0 ? bglightColor : const Color(0xFFf9f9f9)),
    child: SizedBox(
      height: 65,
      child: Row(
        children: [
          Expanded(
              child: Text(
            medicine,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Color(0xff17181A),
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500),
          )),
          Expanded(child: dose),
          Expanded(child: when),
          Expanded(child: frequency),
          duration
        ],
      ),
    ),
  );
}
