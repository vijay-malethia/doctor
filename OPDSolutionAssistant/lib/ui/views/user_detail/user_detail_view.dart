import 'package:doc_ease/ui/views/user_detail/user_detail_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/ui/widgets/index.dart';
import '../../common/images.dart';
import 'user_detail_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'gender'),
  FormTextField(name: 'mobileNumber'),
  FormTextField(name: 'height'),
  FormTextField(name: 'weight'),
  FormTextField(name: 'pulse'),
  FormTextField(name: 'bp'),
  FormTextField(name: 'temp'),
])
class UserDetailView extends StackedView<UserDetailViewModel>
    with $UserDetailView {
  final List? allUsersList;
  final int? index;
  const UserDetailView({this.allUsersList, this.index, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: ListTile(
              title: Text(
                  allUsersList![index!]['firstName'] +
                      ' ' +
                      allUsersList![index!]['lastName'],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              leading: Image(
                  image: AssetImage(Images().userImage), height: 38, width: 38),
              subtitle: Text(
                  allUsersList![index!]['appointmentDate'].toString(),
                  style: const TextStyle(
                      fontSize: 9, fontWeight: FontWeight.w500))),
          actions: [
            InkWell(
              onTap: viewModel.showBottomSheet,
              child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image(
                      image: AssetImage(Images().editIcon),
                      height: 18,
                      width: 18)),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffe8e8ec),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 18),
                              // height: 80,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5)),
                                  color: Color(0xfff8f9ff)),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Expanded(
                                          flex: 1,
                                          child: Text("Age",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                              allUsersList![index!]['age']
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)))
                                    ]),
                                const SizedBox(height: 7),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Expanded(
                                          flex: 1,
                                          child: Text("Location",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                      Expanded(
                                          flex: 2,
                                          child: Text('jaipur, rajasthan',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)))
                                    ])
                              ])))),
                  const SizedBox(height: 20),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffe8e8ec),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 18),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5)),
                                  color: Color(0xfff9faff)),
                              child: Column(children: [
                                basicInfo(
                                    const Icon(Icons.person_outline,
                                        color: Color(0xff1765ae)),
                                    allUsersList![index!]['gender']),
                                const SizedBox(height: 10),
                                basicInfo(
                                    const Icon(Icons.call_outlined,
                                        color: Color(0xff1765ae)),
                                    allUsersList![index!]['phoneNumber']
                                        .toString()),
                              ])))),
                  const SizedBox(height: 30),
                  viewModel.isCheckOne
                      ? Column(children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffe8e8ec),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Container(
                                      height: 65,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(5)),
                                          color: Color(0xfff8f9ff)),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    'Date of Consultation',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(height: 5),
                                                Row(children: [
                                                  Text(
                                                      "${viewModel.selectedDate.toLocal()}"
                                                          .split(' ')[0],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14)),
                                                  Expanded(child: Container()),
                                                  GestureDetector(
                                                      child: const Icon(
                                                          Icons.calendar_month),
                                                      onTap: () {
                                                        viewModel
                                                            .selectFirstDate(
                                                                context);
                                                      })
                                                ])
                                              ]))))),
                          const SizedBox(height: 20),
                          InputWithTrailing(
                              controller: heightController,
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  width: 80,
                                  child: const Text("cm",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: 'Height'),
                          const SizedBox(height: 20),
                          InputWithTrailing(
                              controller: weightController,
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  width: 80,
                                  child: const Text('kg',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: 'Weight'),
                          const SizedBox(height: 20),
                          InputWithTrailing(
                              controller: pulseController,
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("bpm",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: 'Pulse'),
                          const SizedBox(height: 20),
                          InputWithTrailing(
                              controller: bpController,
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("mmHg",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: 'BP'),
                          const SizedBox(height: 20),
                          InputWithTrailing(
                              controller: tempController,
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("F",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: 'Temperature'),
                          const SizedBox(height: 20),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Expanded(
                          //           child: SizedBox(
                          //         height: 60,
                          //         child: CustomButton(
                          //             borderCheck: viewModel.consultation,
                          //             onPressed: viewModel.checkConsultation,
                          //             title: 'Consultation'),
                          //       )),
                          //       horizontalSpaceMedium,
                          //       Expanded(
                          //           child: SizedBox(
                          //         height: 60,
                          //         child: CustomButton(
                          //             borderCheck: viewModel.report,
                          //             onPressed: viewModel.checkReport,
                          //             title: 'Reports Check'),
                          //       ))
                          //     ]),
                          const SizedBox(height: 20),
                          Container(
                              alignment: Alignment.center,
                              child: Button(
                                  height: 49,
                                  // width:
                                  //     MediaQuery.of(context).size.width * 0.50,
                                  // backgroundColor: const Color(0xff1765ae),
                                  onPressed: () {
                                    viewModel.addUserVital(
                                        height: heightController.text,
                                        weight: weightController.text,
                                        pulse: pulseController.text,
                                        bp: bpController.text,
                                        temp: tempController.text,
                                        context: context);
                                  },
                                  title: 'Add Consultation',

                                  // textStyle: const TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.w700,
                                  //     fontSize: 18)
                                      ))
                        ])
                      : Column(children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffe8e8ec),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(5)),
                                          color: Color(0xfff9faff)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                "Mr.Ramesh Chandra(66y. Male) - 8239209316",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(height: 10),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text("H: 166 cm",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        SizedBox(height: 10),
                                                        Text("BP: 98/94 mmHg",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))
                                                      ]),
                                                  const SizedBox(height: 10),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text("W: 166 kg",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        SizedBox(height: 10),
                                                        Text("Temp: 104º F",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))
                                                      ]),
                                                  Column(children: const [
                                                    Text("P: 98 bpm",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))
                                                  ])
                                                ])
                                          ])))),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: const Color(0xff1765ae),
                              child: const Icon(Icons.add, size: 30)),
                          const SizedBox(height: 10),
                          const Text('Add Other Consultation',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600))
                        ])
                ])));
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel()
        ..getUserId(allUsersList![index!]['id'])
        ..setVitalsValue(
          firstName: firstNameController,
          lastName: lastNameController,
          age: ageController,
          gender: genderController,
          phoneNumber: mobileNumberController,
          usersList: allUsersList!,
          index: index!,
          height: heightController,
          weight: weightController,
          pulse: pulseController,
          bp: bpController,
          temp: tempController,
        );

  @override
  void onDispose(UserDetailViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(UserDetailViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}

vitalsInfo(String header) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(header.toString(),
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ]))
  ]);
}

basicInfo(Widget widget, String details) {
  return Row(children: [
    widget,
    const SizedBox(width: 10),
    Text(details,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
  ]);
}

dates(String date, Widget child) {
  return Stack(children: [
    Container(
        padding: const EdgeInsets.fromLTRB(2.5, 3.5, 0, .5),
        height: 55,
        width: 55,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffc1c7e0)),
        child: SizedBox(
            height: 50,
            width: 50,
            child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: .5,
                      color: Color(0xffcdd1ec),
                      spreadRadius: 1.5,
                      offset: Offset(-2.5, 0),
                      blurStyle: BlurStyle.inner)
                ], shape: BoxShape.circle, color: Color(0xffdde1fd)),
                child: Center(child: child)))),
  ]);
}
