import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/widgets/button.dart';
import '/widgets/input.dart';
import '/ui/common/index.dart';
import '/ui/views/doctor_profile/doctor_profile_view.form.dart';
import '/ui/views/doctor_profile/doctor_profile_viewmodel.dart';

class EditWorkingHourSheet extends StackedView<DoctorProfileViewModel>
    with $DoctorProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditWorkingHourSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DoctorProfileViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      // height: 700,
      // constraints:
      // BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceSmall,
          const Text("Working Hours Edit",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
          verticalSpaceMedium,
          Row(
            children: [
              const Text("From",
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 25, 27),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: Input(
                  readOnly: true,
                  hintText: "00:00 AM",
                  controller: TextEditingController(
                      text: workingHoursDetails['breakFrom']),
                  maxLines: 1,
                  suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.timePicker(context, null, 'breakFrom');
                      },
                      icon: const Icon(
                        Icons.schedule_rounded,
                        color: primaryColor,
                        size: 24,
                      )),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              const Text("To",
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 25, 27),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: Input(
                  readOnly: true,
                  hintText: "00:00 AM",
                  controller: TextEditingController(
                      text: workingHoursDetails['breakTo']),
                  maxLines: 1,
                  suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.timePicker(context, null, 'breakTo');
                      },
                      icon: const Icon(
                        Icons.schedule_rounded,
                        color: primaryColor,
                        size: 24,
                      )),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
              // Expanded(
              //   flex: 2,
              //   child: InkWell(
              //     onTap: () {},
              //     child: Row(
              //       children: [
              //         const Icon(Icons.add_circle,
              //             color: primaryColor, size: 21),
              //         horizontalSpaceSmall,
              //         Text(
              //           "Add Another",
              //           style: Theme.of(context).textTheme.labelMedium,
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              const Text("From",
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 25, 27),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: Input(
                  readOnly: true,
                  hintText: "00:00 AM",
                  maxLines: 1,
                  controller: TextEditingController(
                      text: workingHoursDetails['secondBreakFrom']),
                  suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.timePicker(context, null, 'secondBreakFrom');
                      },
                      icon: const Icon(
                        Icons.schedule_rounded,
                        color: primaryColor,
                        size: 24,
                      )),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              const Text("To",
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 25, 27),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: Input(
                  readOnly: true,
                  hintText: "00:00 AM",
                  controller: TextEditingController(
                      text: workingHoursDetails['secondBreakTo']),
                  maxLines: 1,
                  suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.timePicker(context, null, 'secondBreakTo');
                      },
                      icon: const Icon(
                        Icons.schedule_rounded,
                        color: primaryColor,
                        size: 24,
                      )),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
          verticalSpaceMedium,
          InkWell(
            onTap: () {
              viewModel.showDayList();
            },
            child: Row(
              children: [
                const Icon(Icons.add_circle, color: primaryColor, size: 21),
                horizontalSpaceSmall,
                Text(
                  "Add for specific day",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          verticalSpaceMedium,
          if (viewModel.setDayList)
            Expanded(
              child: ListView.builder(
                itemCount: detailList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(detailList[index]['text'],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 23, 25, 27),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Switch.adaptive(
                            activeColor: primaryColor,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: bglightColor,
                            inactiveTrackColor: bglightColor,
                            value:
                                workingHoursDetails[detailList[index]['key']] ==
                                        true
                                    ? true
                                    : false,
                            onChanged: (val) {
                              viewModel.switchButton(index);
                            }),
                        horizontalSpaceLarge,
                        workingHoursDetails[detailList[index]['key']] == true
                            ? Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    const Text("From",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 23, 25, 27),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    const Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                      flex: 2,
                                      child: Input(
                                        readOnly: true,
                                        controller: TextEditingController(
                                            text: workingHoursDetails[
                                                detailList[index]['from']]),
                                        hintText: "00:00 AM",
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              viewModel.timePicker(context,
                                                  index, 'specificFrom');
                                            },
                                            icon: const Icon(
                                              Icons.schedule_rounded,
                                              color: primaryColor,
                                              size: 24,
                                            )),
                                      ),
                                    ),
                                    const Expanded(flex: 1, child: SizedBox()),
                                    const Text("To",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 23, 25, 27),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    const Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                      flex: 2,
                                      child: Input(
                                        hintText: "00:00 AM",
                                        controller: TextEditingController(
                                            text: workingHoursDetails[
                                                detailList[index]['to']]),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              viewModel.timePicker(
                                                  context, index, 'specificTo');
                                            },
                                            icon: const Icon(
                                              Icons.schedule_rounded,
                                              color: primaryColor,
                                              size: 24,
                                            )),
                                      ),
                                    ),
                                    const Expanded(flex: 1, child: SizedBox()),
                                  ],
                                ),
                              )
                            : const Expanded(flex: 4,child: verticalSpaceTiny)
                      ],
                    ),
                  );
                },
              ),
            ),
          verticalSpaceMedium,
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Button(
                    onPressed: () {
                      completer!.call(SheetResponse(confirmed: false));
                    },
                    title: cancel,
                    height: 55,
                    isWhiteBg: true,
                  )),
              horizontalSpaceMedium,
              Expanded(
                  flex: 3,
                  child: Button(
                      onPressed: () async {
                        await viewModel.updateWorkingHours(workingHoursDetails);
                        completer!.call(SheetResponse(confirmed: true));
                      },
                      title: save,
                      height: 55))
            ],
          ),
          verticalSpaceLarge,
          verticalSpaceTiny,
        ],
      ),
    );
  }

  @override
  DoctorProfileViewModel viewModelBuilder(BuildContext context) =>
      DoctorProfileViewModel();
}
