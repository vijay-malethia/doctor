import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/ui/common/widgets/button.dart';
import '../../common/app_colors.dart';
import 'consultation_view.form.dart';
import 'consultation_viewmodel.dart';
import '/ui/common/ui_helpers.dart';
import '../../common/widgets/input.dart';

@FormView(fields: [
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'temperature'),
  FormTextField(name: 'advice'),
  FormTextField(name: 'adviceText'),
  FormTextField(name: 'search'),
  FormTextField(name: 'instruction'),
  FormTextField(name: 'nextAppointment')
])
class ConsultationView extends StackedView<ConsultationViewModel>
    with $ConsultationView {
  final String? userName;
  final String? gender;
  final String? age;
  final String? phoneNumber;
  final String? id;
  final String? appointId;
  const ConsultationView(
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
    ConsultationViewModel viewModel,
    Widget? child,
  ) {
    ScrollController _scrollController = ScrollController();
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
              toolbarHeight: 75,
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              foregroundColor: Colors.black,
              centerTitle: false,
              leading: IconButton(
                  onPressed: () {
                    viewModel.goToBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: SvgPicture.asset(
                  "assets/images/q.svg",
                  semanticsLabel: 'My SVG Image',
                  height: 50,
                  width: 50,
                ),
                title: Text('$userName',
                    style: Theme.of(context).textTheme.titleLarge),
                subtitle: Text('$age |  $gender  |  $phoneNumber',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              actions: [
                Row(
                  children: [
                    if (!viewModel.isComplete)
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Button(
                            onPressed: () {
                              // viewModel.postPatientData(
                              //   advice: adviceController.text,
                              // );
                              viewModel.goToBack();
                            },
                            title: 'End Consultation'),
                      ),
                    horizontalSpaceSmall,
                    IconButton(
                        iconSize: 40,
                        color: primaryColor,
                        onPressed: () {
                          viewModel.goToPrintPreview(
                              advice: adviceController.text,
                              height: heightController.text,
                              weight: weightController.text,
                              bp: bpController.text,
                              phoneNumber: phoneNumber,
                              age: age,
                              gender: gender,
                              userName: userName,
                              pulse: pulseController.text,
                              temperature: temperatureController.text);
                        },
                        icon: const Icon(Icons.print))
                  ],
                )
              ]),
          body: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : ListView(children: [
                  renderDateStepper(viewModel),
                  renderVitals(context, viewModel),
                  verticalSpaceMedium,
                  viewModel.isComplete
                      ? completedConsultation(
                          'Symtoms', selectedSymptomsList, _scrollController)
                      : ourMultiSelect(
                          name: 'Symptoms',
                          btnName: 'Add Symptoms',
                          list: selectedSymptomsList,
                          viewModel: viewModel,
                          context: context),
                  verticalSpaceMedium,
                  viewModel.isComplete
                      ? completedConsultation(
                          'Diagonsis', selectedDiagnosisList, _scrollController)
                      : ourMultiSelect(
                          name: 'Diagnosis',
                          btnName: 'Add Diagnosis',
                          list: selectedDiagnosisList,
                          viewModel: viewModel,
                          context: context),
                  verticalSpaceMedium,
                  viewModel.isComplete
                      ? completedConsultation(
                          'Reports', selectedReportList, _scrollController,
                          viewModel: viewModel)
                      : ourMultiSelectReport(
                          name: 'Reports',
                          btnName: 'Add Report',
                          list: selectedReportList,
                          controller: _scrollController,
                          viewModel: viewModel,
                          context: context),
                  verticalSpaceMedium,
                  viewModel.isComplete
                      ? const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Medicines:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15)))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Medicines',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15)),
                              Row(
                                children: [
                                  if (viewModel.reloadCount != 1 &&
                                      viewModel
                                              .checkPreviousDataList['medicine']
                                              .toString() !=
                                          '[]')
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.copyDataLastAppointment(
                                            index:
                                                viewModel.lastAppointmentIndex -
                                                    1,
                                            listName: 'Add Medicine');
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.copy,
                                              color: primaryColor, size: 18),
                                          Text('Copy Previous Medicine',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  color: Color(0xff1765AE))),
                                        ],
                                      ),
                                    ),
                                  horizontalSpaceSmall,
                                  GestureDetector(
                                    onTap: viewModel.showMedicineBottomSheet,
                                    child: Row(
                                      children: const [
                                        Icon(Icons.add, color: primaryColor),
                                        Text('Add Medicine',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Color(0xff1765AE))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                  verticalSpaceSmall,
                  viewModel.isComplete
                      ? renderMedicines(viewModel.initMedicineList, viewModel)
                      : Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 225, 230),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 224, 225, 230)),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 248, 249, 255),
                                        blurRadius: 2,
                                        spreadRadius: -1,
                                        offset: Offset(3, 3))
                                  ]),
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent),
                                  child: Column(children: [
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: RenderRow(
                                            isComplete: true,
                                            medicine: 'Medicine',
                                            dose: const Text('Dose',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            whenDose: const Text('When',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            frequency: const Text('Frequency',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            duration: const Text('Duration',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            notes: 'Instruction',
                                            trailing: viewModel
                                                    .undoMedicineList.isEmpty
                                                ? Container()
                                                : GestureDetector(
                                                    onTap:
                                                        viewModel.undoMedicine,
                                                    child: const Row(
                                                      children:  [
                                                        Icon(Icons.undo,
                                                            color:
                                                                primaryColor),
                                                        horizontalSpaceTiny,
                                                        Text(
                                                          'Undo',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ))),
                                    const SizedBox(height: 10),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: selectedMedicineList.length,
                                        itemBuilder: (context, index) {
                                          return selectedMedicineList[index]
                                                      .medicine
                                                      .toString() ==
                                                  ''
                                              ? Container()
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF2F4FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: RenderRow(
                                                      index: index,
                                                      model: viewModel,
                                                      ctrl: instructionList[
                                                          index],
                                                      isComplete:
                                                          viewModel.isComplete,
                                                      medicine:
                                                          selectedMedicineList[
                                                                  index]
                                                              .medicine
                                                              .toString(),
                                                      dose: Row(
                                                        children: [
                                                          DropdownButton(
                                                            underline:
                                                                const SizedBox(),
                                                            iconSize: 0.0,
                                                            value: selectedMedicineList[
                                                                            index]
                                                                        .dose
                                                                        .toString() ==
                                                                    ''
                                                                ? 'Select'
                                                                : selectedMedicineList[
                                                                        index]
                                                                    .dose
                                                                    .toString(),
                                                            items: viewModel
                                                                .doseList
                                                                .map((value) => DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                        style: const TextStyle(
                                                                            color: Color(
                                                                                0xff17181A),
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600))))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              viewModel
                                                                  .changeDoseValue(
                                                                      value,
                                                                      index);
                                                            },
                                                          ),
                                                          horizontalSpaceTiny,
                                                          index ==
                                                                  selectedMedicineList
                                                                          .length -
                                                                      1
                                                              ? const SizedBox()
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    viewModel
                                                                        .copydoseDropdown(
                                                                            index);
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .arrow_downward))
                                                        ],
                                                      ),
                                                      whenDose: Row(
                                                        children: [
                                                          DropdownButton(
                                                            underline:
                                                                const SizedBox(),
                                                            iconSize: 0.0,
                                                            value: selectedMedicineList[
                                                                            index]
                                                                        .when
                                                                        .toString() ==
                                                                    ''
                                                                ? 'Select'
                                                                : selectedMedicineList[
                                                                        index]
                                                                    .when
                                                                    .toString(),
                                                            items: viewModel
                                                                .foodMedicine
                                                                .map((value) => DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value,
                                                                        style: const TextStyle(
                                                                            color: Color(
                                                                                0xff17181A),
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600))))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              viewModel
                                                                  .changeFoodMedicineValue(
                                                                      value,
                                                                      index);
                                                            },
                                                          ),
                                                          horizontalSpaceTiny,
                                                          index ==
                                                                  selectedMedicineList
                                                                          .length -
                                                                      1
                                                              ? const SizedBox()
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    viewModel
                                                                        .copywhenDropdown(
                                                                            index);
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .arrow_downward))
                                                        ],
                                                      ),
                                                      frequency: Row(
                                                        children: [
                                                          DropdownButton(
                                                            underline:
                                                                const SizedBox(),
                                                            iconSize: 0,
                                                            value: selectedMedicineList[
                                                                            index]
                                                                        .frequency
                                                                        .toString() ==
                                                                    ''
                                                                ? 'Select'
                                                                : selectedMedicineList[
                                                                        index]
                                                                    .frequency
                                                                    .toString(),
                                                            items: viewModel
                                                                .frequencyList
                                                                .map((value) =>
                                                                    DropdownMenuItem(
                                                                      value:
                                                                          value,
                                                                      child: Text(
                                                                          value,
                                                                          style: const TextStyle(
                                                                              color: Color(0xff17181A),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600)),
                                                                    ))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              viewModel
                                                                  .changeFrequencyValue(
                                                                      value,
                                                                      index);
                                                            },
                                                          ),
                                                          // horizontalSpaceTiny,
                                                          index ==
                                                                  selectedMedicineList
                                                                          .length -
                                                                      1
                                                              ? const SizedBox()
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    viewModel
                                                                        .copyfrequencyDropdown(
                                                                            index);
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .arrow_downward))
                                                        ],
                                                      ),
                                                      duration: Row(
                                                        children: [
                                                          DropdownButton(
                                                            underline:
                                                                const SizedBox(),
                                                            iconSize: 0.0,
                                                            value: selectedMedicineList[
                                                                            index]
                                                                        .duration
                                                                        .toString() ==
                                                                    ''
                                                                ? 'Select'
                                                                : selectedMedicineList[
                                                                        index]
                                                                    .duration
                                                                    .toString()
                                                                    .split(' ')
                                                                    .last,
                                                            items: viewModel
                                                                .durationList
                                                                .map((value) =>
                                                                    DropdownMenuItem(
                                                                      value: value
                                                                          .split(
                                                                              ' ')
                                                                          .last,
                                                                      child: Text(
                                                                          value,
                                                                          style: const TextStyle(
                                                                              color: Color(0xff17181A),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600)),
                                                                    ))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              viewModel
                                                                  .changeDurationValue(
                                                                      value,
                                                                      index);
                                                            },
                                                          ),
                                                          horizontalSpaceTiny,
                                                          GestureDetector(
                                                              onTap: () {
                                                                if (index !=
                                                                    selectedMedicineList
                                                                            .length -
                                                                        1) {
                                                                  viewModel
                                                                      .copydurationDropdown(
                                                                          index);
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_downward,
                                                                color: index !=
                                                                        selectedMedicineList.length -
                                                                            1
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                              )),
                                                        ],
                                                      ),
                                                      notes: !viewModel
                                                              .isComplete
                                                          ? ''
                                                          : selectedMedicineList[
                                                                  index]
                                                              .instruction
                                                              .toString(),
                                                      trailing: Row(
                                                        children: [
                                                          horizontalSpaceTiny,
                                                          GestureDetector(
                                                              onTap: () {
                                                                if (index !=
                                                                    selectedMedicineList
                                                                            .length -
                                                                        1) {
                                                                  viewModel
                                                                      .copyInstruction(
                                                                          index);
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_downward,
                                                                color: index !=
                                                                        selectedMedicineList.length -
                                                                            1
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                              )),
                                                          IconButton(
                                                              icon: const Icon(
                                                                  Icons.close,
                                                                  size: 15),
                                                              onPressed: () {
                                                                viewModel
                                                                    .onMedicineChipDisplayTap(
                                                                        index);
                                                              }),
                                                        ],
                                                      )));
                                        })
                                  ])))),
                  verticalSpaceMedium,
                  Text(
                    "Advice",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                          child: Input(
                              autofocus: false,
                              readOnly: viewModel.isComplete ? true : false,
                              hintText: "Type here advice for patient",
                              textStyle: const TextStyle(color: Colors.black),
                              controller: adviceController,
                              maxLines: 3,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                viewModel.onInputSubmit(
                                    advice: adviceController.text);
                              }))
                    ],
                  ),
                  verticalSpaceMedium,
                  // Row(children: [
                  //   SizedBox(
                  //       width: 250,
                  //       child: Container(
                  //           height: 40,
                  //           decoration: BoxDecoration(
                  //               color: const Color.fromARGB(255, 248, 249, 255),
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: TextButton(
                  //                 onPressed: () {
                  //                   if (!viewModel.isComplete) {
                  //                     viewModel.adviceText(adviceController);
                  //                   }
                  //                 },
                  //                 child: const Text(
                  //                   "Diabtic Advice English",
                  //                   style: TextStyle(
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.bold,
                  //                       color:
                  //                           Color.fromARGB(255, 51, 119, 183)),
                  //                 )),
                  //           ))),
                  //   const Expanded(child: SizedBox())
                  // ]),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Next Appointmet: ${viewModel.selectedDate.toString().split(' ').first} (${viewModel.nextAppointRange.toString().split('.').first} ${viewModel.checkMonthOrDay})',
                          style: Theme.of(context).textTheme.titleLarge),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                viewModel.toggleDayMonth('Day');
                              },
                              child: Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.center,
                                color: viewModel.checkMonthOrDay == 'Day'
                                    ? const Color.fromARGB(255, 178, 221, 252)
                                    : Colors.white,
                                child: const Text('Day'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                viewModel.toggleDayMonth('Month');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text('Month'),
                                width: 70,
                                height: 40,
                                color: viewModel.checkMonthOrDay == 'Month'
                                    ? const Color.fromARGB(255, 178, 221, 252)
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      // Expanded(
                      //     flex: 1,
                      //     child: Input(
                      //         controller: nextAppointmentController,
                      //         readOnly: true,
                      //         suffixIcon: IconButton(
                      //           icon: const Icon(Icons.calendar_month),
                      //           onPressed: () {
                      //                               viewModel.pickNextAppointment(
                      //                 context, nextAppointmentController);
                      //           },
                      //         ))),
                      // Expanded(
                      //     flex: 2,
                      //     child: Slider(
                      //         activeColor: primaryColor,
                      //         // divisions: 45,
                      //         // label: '${viewModel.nextAppointRange}',
                      //         autofocus: true,
                      //         value: viewModel.nextAppointRange,
                      //         onChanged: (value) {
                      //           viewModel.selectRange(value);
                      //         },
                      //         min: 0.0,
                      //         max: 45)),
                      Expanded(
                        flex: 2,
                        child: SfSlider(
                          min: 0.0,
                          max: viewModel.checkMonthOrDay == 'Day' ? 90.0 : 12.0,
                          value: viewModel.nextAppointRange,
                          interval: viewModel.checkMonthOrDay == 'Day' ? 3 : 1,
                          showTicks: true,
                          activeColor: primaryColor,
                          showLabels: true,
                          enableTooltip: true,
                          tooltipShape: const SfRectangularTooltipShape(),
                          minorTicksPerInterval:
                              viewModel.checkMonthOrDay == 'Day' ? 1 : 0,
                          onChanged: (dynamic value) {
                            viewModel.selectRange(value.toInt());
                          },
                        ),
                      ),
                      // Text('${viewModel.newDateTime}'),
                      // const Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                  verticalSpaceMassive,
                ]),
        ));
  }

  Row renderVitals(BuildContext context, ConsultationViewModel viewModel) {
    TextStyle? tempStyle = Theme.of(context).textTheme.titleMedium;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Height:', style: tempStyle),
            horizontalSpaceSmall,
            Text('${viewModel.height == "null" ? "" : viewModel.height}')
          ],
        ),
        Row(
          children: [
            Text('Weight:', style: tempStyle),
            horizontalSpaceSmall,
            Text('${viewModel.weight == "null" ? "" : viewModel.weight}')
          ],
        ),
        Row(
          children: [
            Text('BloodPressure:', style: tempStyle),
            horizontalSpaceSmall,
            Text('${viewModel.bp == "null" ? "" : viewModel.bp}')
          ],
        ),
        Row(
          children: [
            Text('Temprature:', style: tempStyle),
            horizontalSpaceSmall,
            Text('${viewModel.temp == "null" ? "" : viewModel.temp}')
          ],
        ),
        Row(
          children: [
            Text('Pulse:', style: tempStyle),
            horizontalSpaceSmall,
            Text('${viewModel.pulse == "null" ? "" : viewModel.pulse}')
          ],
        ),
      ],
    );
  }

  EasyStepper renderDateStepper(ConsultationViewModel viewModel) {
    return EasyStepper(
        activeStep: viewModel.activeStep,
        lineLength: 120,
        lineSpace: 0,
        finishedLineColor: const Color(0xfff2f4ff),
        activeStepTextColor: Colors.white,
        finishedStepTextColor: Colors.black87,
        showLoadingAnimation: false,
        stepRadius: 16,
        borderThickness: 1,
        lineDotRadius: 1,
        disableScroll: false,
        finishedStepBackgroundColor: const Color(0xffdfe0eb),
        unreachedStepBackgroundColor: const Color(0xffdfe0eb),
        showStepBorder: false,
        defaultLineColor: const Color(0xffdfe0eb),
        steps: [
          for (int i = 0; i < viewModel.dateList.length; i++)
            renderEasyStep(
                viewModel,
                viewModel.formattedMonth(i).toString().split(' ').last,
                viewModel.formattedMonth(i).toString().split(' ').first,
                viewModel.activeStep - 1 == i,
                i),
        ],
        onStepReached: (index) async {
          viewModel.getDate(index);
          // await viewModel.postPatientData();
          viewModel.getAllMedicalRecords(index);
          viewModel.stepperIndexChange(index);
        });
  }

  renderEasyStep(ConsultationViewModel viewModel, String day, String month,
      bool isSelected, int index) {
    return EasyStep(
        customStep: Padding(
            padding: isSelected
                ? const EdgeInsets.all(0)
                : const EdgeInsets.only(left: 4.5, top: 3.5),
            child: CircleAvatar(
                radius: 21.8,
                backgroundColor: isSelected
                    ? const Color(0xff1765ae)
                    : const Color(0xfff2f4ff),
                child: Text(day,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w700)))),
        customTitle: Text(month,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                color: Color(0xff17181A),
                fontWeight: FontWeight.w700)));
  }

  @override
  ConsultationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConsultationViewModel()
        ..getAppointDatesById(id: id)
        ..getId(id, appointId)
        ..getSymptoms()
        ..getControllers(
          // nextAppointCtr: nextAppointmentController,
          adviceCtr: adviceController,
          // heightCtr: heightController,
          // weightCtr: weightController,
          // pulseCtr: pulseController,
          // bpCtr: bpController,
          // tempCtr: temperatureController
        );
}

// Widget renderVital(context, vital, String text, ConsultationViewModel viewModel,
//     String label) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(label),
//       verticalSpaceSmall,
//       Input(
//         readOnly: viewModel.isComplete ? true : false,
//         autofocus: false,
//         keyboardType: TextInputType.number,
//         textInputAction: TextInputAction.done,
//         onEditingComplete: viewModel.onInputSubmit,
//         controller: vital,
//         trailing: Container(
//           height: 80,
//           alignment: Alignment.center,
//           width: 105,
//           color: Colors.white,
//           child: Text(text, style: Theme.of(context).textTheme.displayMedium),
//         ),
//       ),
//     ],
//   );
// }

// Widget vitalsInfo(String header, double values, String dataType, context) {
//   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//     Text(header,
//         style: const TextStyle(
//             color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16)),
//     const SizedBox(height: 10),
//     Container(
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(224, 225, 230, 1),
//             borderRadius: BorderRadius.circular(10)),
//         child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 1, color: const Color.fromARGB(255, 224, 225, 230)),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                       color: Color.fromARGB(255, 248, 249, 255),
//                       blurRadius: 2,
//                       spreadRadius: -1,
//                       offset: Offset(3, 3))
//                 ]),
//             padding: const EdgeInsets.only(top: 5, left: 5),
//             child: Container(
//                 width: MediaQuery.of(context).size.width * 0.28,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.transparent),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(values.toString(),
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w700))),
//                       Container(
//                           height: 50,
//                           width: 50,
//                           alignment: Alignment.center,
//                           color: Colors.white,
//                           child: Text(dataType,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w700, fontSize: 16)))
//                     ]))))
//   ]);
// }

////////////////////////////////////////////////////////////previous data set///////////////////////////////////////
Widget completedConsultation(String name, List list, scrollController,
    {ConsultationViewModel? viewModel}) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 225, 230),
        borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromRGBO(224, 225, 230, 1)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 248, 249, 255),
                blurRadius: 2,
                spreadRadius: -1,
                offset: Offset(3, 3))
          ]),
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
        ),
        verticalSpaceMedium,
        // if (list[0].toString() != "" && list.isNotEmpty)
        SizedBox(
          height: 33,
          child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return list[index].toString() == ""
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 178, 221, 252),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            if (name == 'Reports') {
                              // Scaffold.of(context).openEndDrawer();
                              // viewModel?.getReportName(list[index].toString());
                              if (selectedReportList[index]['isActive']) {
                                viewModel!.goToReportView(
                                    reportUrl: selectedReportList[index]
                                        ['path'],
                                    reportName: selectedReportList[index]
                                        ['name']);
                              }
                            }
                          },
                          child: Text(
                              name == 'Reports'
                                  ? list[index]['name']
                                  : list[index].toString(),
                              style: const TextStyle(
                                  color: Colors.black, height: 1)),
                        ),
                      );
              }),
        ),
      ]),
    ),
  );
}

Widget renderMedicines(List medList, ConsultationViewModel viewModel) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 225, 230),
        borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 224, 225, 230)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 248, 249, 255),
                blurRadius: 2,
                spreadRadius: -1,
                offset: Offset(3, 3))
          ]),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
            padding: const EdgeInsets.all(5),
            child: RenderRow(
                isComplete: viewModel.isComplete,
                medicine: 'Medicine',
                dose: const Text('Dose',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                whenDose: const Text('When',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                frequency: const Text('Frequency',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                duration: const Text('Duration',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                notes: 'Instruction',
                trailing: Container())),
        verticalSpaceMedium,
        SizedBox(
          height: 160,
          child: ListView.builder(
              itemCount: medList.length,
              itemBuilder: ((context, index) {
                return RenderRow(
                    isComplete: viewModel.isComplete,
                    medicine: medList[index]['medicine'].toString(),
                    dose: Text(medList[index]['dose'].toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    whenDose: Text(medList[index]['when'].toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    frequency: Text(medList[index]['frequency'].toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    duration: Align(
                      child: Text(medList[index]['duration'].toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                    notes: medList[index]['instruction'].toString(),
                    trailing: Container());
              })),
        )
      ]),
    ),
  );
}

///////////////////////////////////////////////////OUR MultiSelect////////////////////////////////////////////////
Widget ourMultiSelect(
    {name, btnName, list, required ConsultationViewModel viewModel, context}) {
  return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 225, 230),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: const Color.fromRGBO(224, 225, 230, 1)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 248, 249, 255),
                  blurRadius: 2,
                  spreadRadius: -1,
                  offset: Offset(3, 3))
            ]),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$name',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15)),
                Row(
                  children: [
                    if (viewModel.reloadCount != 1 &&
                        viewModel.checkPreviousDataList['symptoms']
                                .toString() !=
                            '[]' &&
                        name == 'Symptoms')
                      GestureDetector(
                        onTap: () {
                          viewModel.copyDataLastAppointment(
                              index: viewModel.lastAppointmentIndex - 1,
                              listName: btnName);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.copy,
                                color: primaryColor, size: 18),
                            Text(
                                'Copy Previous ${btnName.toString().split(' ').last}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Color(0xff1765AE))),
                          ],
                        ),
                      ),
                    if (viewModel.reloadCount != 1 &&
                        viewModel.checkPreviousDataList['diagnosis']
                                .toString() !=
                            '[]' &&
                        name == 'Diagnosis')
                      GestureDetector(
                        onTap: () {
                          viewModel.copyDataLastAppointment(
                              index: viewModel.lastAppointmentIndex - 1,
                              listName: btnName);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.copy,
                                color: primaryColor, size: 18),
                            Text(
                                'Copy Previous ${btnName.toString().split(' ').last}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Color(0xff1765AE))),
                          ],
                        ),
                      ),
                    horizontalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        if (name == 'Symptoms') {
                          viewModel.showSymtomBottomSheet();
                        } else if (name == 'Diagnosis') {
                          viewModel.showDiagnosisBottomSheet();
                        } else if (name == 'Reports') {
                          viewModel.showReportBottomSheet();
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.add, color: primaryColor),
                          Text('$btnName',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Color(0xff1765AE))),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpaceMedium,
            SizedBox(
              height: 33,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return list[index].toString() == ""
                        ? Container()
                        : InkWell(
                            onTap: () {
                              if (name == 'Symptoms') {
                                viewModel.onSymptomChipDisplayTap(index);
                              } else if (name == 'Diagnosis') {
                                viewModel.onDiagnosisChipDisplayTap(index);
                              } else if (name == 'Reports') {
                                viewModel.onReportsChipDisplayTap(index);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(255, 178, 221, 252),
                              ),
                              margin: const EdgeInsets.only(right: 5),
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.cancel,
                                      color: Colors.white, size: 25),
                                  horizontalSpaceSmall,
                                  Text(list[index].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          height: 1)),
                                ],
                              ),
                            ),
                          );
                  }),
            ),
          ],
        ),
      ));
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Our Multi select for Reports
Widget ourMultiSelectReport(
    {name,
    btnName,
    list,
    controller,
    required ConsultationViewModel viewModel,
    context}) {
  return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 225, 230),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(224, 225, 230, 1)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 248, 249, 255),
                    blurRadius: 2,
                    spreadRadius: -1,
                    offset: Offset(3, 3))
              ]),
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('$name',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15)),
              Row(children: [
                if (viewModel.reloadCount != 1 &&
                    viewModel.checkPreviousDataList['reports'].toString() !=
                        '[]')
                  GestureDetector(
                    onTap: () {
                      viewModel.copyDataLastAppointment(
                          index: viewModel.lastAppointmentIndex - 1,
                          listName: btnName);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.copy, color: primaryColor, size: 18),
                        Text('Copy Previous Reports',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Color(0xff1765AE))),
                      ],
                    ),
                  ),
                horizontalSpaceSmall,
                GestureDetector(
                  onTap: () {
                    viewModel.showReportBottomSheet();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: primaryColor),
                      Text('$btnName',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff1765AE))),
                    ],
                  ),
                ),
              ])
            ]),
            verticalSpaceMedium,
            SizedBox(
                height: 100,
                child: Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  child: ListView(
                      controller: controller,
                      shrinkWrap: true,
                      children: [
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children:
                              selectedReportList.asMap().entries.map((entry) {
                            final index = entry.key;
                            final name = entry.value;
                            return buildChipItem(
                                name, list, context, index, viewModel);
                          }).toList(),
                        )
                      ]),
                ))
          ])));
}

/// Returns a ChoiceChip
Widget buildChipItem(
    name, list, context, index, ConsultationViewModel viewModel) {
  return list[index]['name'] == ''
      ? Container()
      : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: list[index]['isActive']
                ? const Color.fromARGB(255, 178, 252, 199)
                : const Color.fromARGB(255, 178, 221, 252),
          ),
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            !list[index]['isActive']
                ? InkWell(
                    onTap: () {
                      viewModel.onReportsChipDisplayTap(index);
                    },
                    child:
                        const Icon(Icons.cancel, color: Colors.white, size: 25))
                : const SizedBox(height: 25),
            horizontalSpaceSmall,
            SizedBox(
              child: Builder(
                builder: (context) => GestureDetector(
                  child: Text(list[index]['name'].toString(),
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1)),
                  onTap: () {
                    if (list[index]['isActive']) {
                      viewModel.goToReportView(
                          reportUrl: '${list[index]['path']}',
                          reportName: list[index]['name']);
                    }
                    // Scaffold.of(context).openEndDrawer();
                    // viewModel.getReportName(list[index].toString());
                    // viewModel.getReportesByAppointmentId(
                    //     report: list[index].toString());
                  },
                ),
              ),
            ),
          ]));
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class RenderRow extends StatelessWidget {
  final String medicine;
  final Widget dose;
  final Widget whenDose;
  final Widget frequency;
  final Widget duration;
  final String notes;
  final Widget trailing;
  final bool isComplete;
  final int? index;
  final Function? onpress;
  final TextEditingController? ctrl;
  final ConsultationViewModel? model;
  const RenderRow(
      {required this.medicine,
      required this.dose,
      required this.whenDose,
      required this.frequency,
      required this.duration,
      required this.notes,
      required this.trailing,
      required this.isComplete,
      this.ctrl,
      this.index,
      this.model,
      super.key,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 2,
          child: Text(medicine,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff17181A)))),
      Expanded(
          flex: 2,
          child: Align(
              alignment: Alignment.topLeft, child: Container(child: dose))),
      Expanded(flex: 2, child: whenDose),
      Expanded(flex: 2, child: frequency),
      !isComplete
          ? Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (vale) {},
                      maxLines: 1,
                      controller: durList[index!],
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      onEditingComplete: () {
                        model!.setDurationCtrlValue(index: index);
                      },
                      style: const TextStyle(color: Colors.black, height: 1),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  horizontalSpaceTiny,
                  duration,
                  horizontalSpaceTiny,
                ],
              ),
            )
          : Expanded(flex: 2, child: duration),
      Expanded(
        flex: 2,
        child: Row(
          children: [
            !isComplete
                ? Expanded(
                    child: TextField(
                      onChanged: (vale) {
                        model!.onChangeInstruction(vale, index!);
                      },
                      maxLines: 1,
                      controller: ctrl,
                      cursorColor: Colors.black,
                      onEditingComplete: model!.onInputSubmit,
                      style: const TextStyle(color: Colors.black, height: 1),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  )
                : Expanded(
                    child: Row(
                      children: [
                        Text(notes,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff17181A))),
                      ],
                    ),
                  ),
            SizedBox(
              child: trailing,
            )
          ],
        ),
      ),
    ]);
  }
}
