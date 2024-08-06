import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/index.dart';
import '/ui/common/widgets/loader.dart';
import '../../common/widgets/bottom_bar.dart';
import 'doctor_viewmodel.dart';

class DoctorView extends StackedView<DoctorViewModel> {
  final String id;
  final String name;
  const DoctorView(this.name, this.id, {Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, DoctorViewModel viewModel, Widget? child) {
    return SafeArea(
        child: Scaffold(
            body: viewModel.isBusy
                ? const Loader()
                : Column(children: [
                    //app bar
                    renderAppBar(context, viewModel),
                    renderAppointmentListWithDetails(viewModel)
                  ]),
            bottomNavigationBar: BottomNavigation()));
  }

//appoint lists
  Expanded renderAppointmentListWithDetails(DoctorViewModel viewModel) {
    return Expanded(
        child: ListView.builder(
            itemCount: viewModel.dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 243, 242, 242),
                                blurRadius: 10.0,
                                offset: Offset(7.0, 8.0))
                          ]),
                      child: ExpansionTile(
                          initiallyExpanded: index == 0 ? true : false,
                          collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onExpansionChanged: (value) {
                            viewModel.expansionChange(value);
                          },
                          backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
                          collapsedBackgroundColor: Colors.white,
                          collapsedTextColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(viewModel.getappointDate(index),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))
                              ]),
                          children: [
                            Column(children: [
                              Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: SingleChildScrollView(
                                      child: Column(children: [
                                    ExpansionWidget(
                                        title: 'Diagnosis',
                                        dataList: viewModel.dataList,
                                        data: viewModel.getDiagnosis(index)),
                                    ExpansionWidget(
                                        title: 'Symptoms',
                                        dataList: viewModel.dataList,
                                        data: viewModel.getSymptoms(index)),
                                    ExpansionWidget(
                                        title: 'Advice Note',
                                        dataList: viewModel.dataList,
                                        data: viewModel
                                                .dataList[index]['advice']
                                                .isEmpty
                                            ? ''
                                            : viewModel.dataList[index]
                                                ['advice']),
                                    ExpansionWidget(
                                        title: 'Medicines',
                                        dataList: viewModel.dataList,
                                        data: viewModel.getMed(),
                                        viewModel: viewModel,
                                        index: index),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            height: 43,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  viewModel.goToReports(
                                                      viewModel.dataList[index]
                                                          ['appointmentId']);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    12))),
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            42, 45, 52, 1)),
                                                child: const Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                      "View Reports",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white),
                                                    ))))),
                                    viewModel.dataList[index]['nextVist'] ==
                                            null
                                        ? const SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                height: 56,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromRGBO(
                                                            42, 45, 52, 0.1))),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Expanded(
                                                              child: Text(
                                                                  "Next Visit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white))),
                                                          Text(
                                                              viewModel
                                                                  .dataList[
                                                                      index][
                                                                      'nextVist']
                                                                  .toString()
                                                                  .split('T')
                                                                  .first,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white))
                                                        ]))))
                                  ])))
                            ])
                          ])));
            }));
  }

///////////////////////////////////////////////////////////////////////App Bar///////////////////////////////////////////////////
  Container renderAppBar(BuildContext context, DoctorViewModel viewModel) {
    return Container(
        height: 81,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: primaryColor),
        child: Row(children: [
          IconButton(
              onPressed: () {
                viewModel.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.white, size: 18)),
          Expanded(
              child: ListTile(
                  contentPadding: const EdgeInsets.only(right: 10.0, left: 0),
                  title: Text(name,
                      style: Theme.of(context).textTheme.displayMedium),
                  subtitle: Text(
                      "Last Appointment On : ${viewModel.getlastappointDate()}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  leading: SvgPicture.asset(Images().userYellowImage,
                      height: 40, width: 40)))
        ]));
  }

  @override
  DoctorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DoctorViewModel()..getAppointmentDetails(id);
}

class ExpansionWidget extends StatelessWidget {
  final List dataList;
  final String title;
  final String data;
  final DoctorViewModel? viewModel;
  final int? index;

  const ExpansionWidget({
    Key? key,
    required this.dataList,
    required this.title,
    required this.data,
    this.viewModel,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: const Color.fromRGBO(42, 45, 52, 0.1))),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      data == ''
                                          ? const SizedBox()
                                          : Text(data,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      42, 45, 52, 1),
                                                  fontWeight: FontWeight.w400))
                                    ]));
                          }),
                      if (title == 'Medicines' &&
                          viewModel!.getMed().isNotEmpty)
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  viewModel!.goToMedicinesDetails(index);
                                },
                                child: const Text('View Full details...',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor))))
                    ]))));
  }
}
