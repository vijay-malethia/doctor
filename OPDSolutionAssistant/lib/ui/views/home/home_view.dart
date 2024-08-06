import 'dart:math';

import 'package:doc_ease/ui/views/home/home_view.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/images.dart';
import '../../common/index.dart';
import '../../widgets/drawer.dart';
import '../../widgets/loader.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'gender'),
  FormTextField(name: 'mobileNumber'),
  FormTextField(name: 'height', initialValue: '5'),
  FormTextField(name: 'weight', initialValue: '50'),
  FormTextField(name: 'pulse', initialValue: '72'),
  FormTextField(name: 'bp', initialValue: '120'),
  FormTextField(name: 'bph', initialValue: '120'),
  FormTextField(name: 'temperature', initialValue: '98.8'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var orient = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        appBar: renderAppBar(viewModel), // app bar
        drawer: DrawerNavigator(),
        body: viewModel.isBusy
            ? const Loader()
            : renderpatientList(viewModel, orient), // patient List
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            child: const Icon(Icons.add, size: 25),
            onPressed: viewModel.showBottomSheet));
  }

///////////////////////////////////////////////////////////////////////////Patient List///////////////////////////////////////////////////////////////////
  RefreshIndicator renderpatientList(HomeViewModel viewModel, orient) {
    return RefreshIndicator(
        onRefresh: viewModel.getAllUser,
        child: GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: viewModel.allUser.length,
            itemBuilder: (context, index) =>
                renderPatients(index, viewModel, context),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 250,
                mainAxisSpacing: 8,
                crossAxisSpacing: 5,
                crossAxisCount: orient ? 2 : 3)));
  }

///////////////////////////////////////////////////////////////////////////App Bar////////////////////////////////////////////////////////////////////////////////////
  AppBar renderAppBar(HomeViewModel viewModel) {
    return AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 58,
        leadingWidth: 55,
        centerTitle: false,
        titleSpacing: 1,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: primaryColor),
        title: const Text('Consultations',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        leading: Builder(builder: (context) {
          return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: SvgPicture.asset(Images().menuIcon)));
        }),
        actions: [
          Row(children: [
            InkWell(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Add Consultation',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)))),
                onTap: () {
                  viewModel.goToSearch();
                })
          ])
        ]);
  }

////////////////////////////////////////////////////////////////////////// Patients view////////////////////////////////////////////////////////////////////////////////
  Container renderPatients(
      index, HomeViewModel viewModel, BuildContext context) {
    var patient = viewModel.allUser[index];
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 1.0,
                  spreadRadius: 1,
                  offset: const Offset(2, 2))
            ]),
        child: Column(children: [
          InkWell(
              hoverColor: Colors.transparent,
              onTap: () => viewModel.goToAppointmentDetails(index),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    verticalSpaceSmall,
                    SvgPicture.asset(viewModel.logoList[Random().nextInt(5)]),
                    verticalSpaceSmall,
                    Text(patient.username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lato',
                        )),
                    verticalSpaceSmall,
                    Text(patient.phone!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Lato')),
                    verticalSpaceSmall,
                    Text('(${patient.age}y, ${patient.gender})',
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 23, 24, 26),
                            fontSize: 12,
                            fontWeight: FontWeight.w400))
                  ]))),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              SvgPicture.asset(Images().callIcon,
                  height: 18,
                  width: 18,
                  placeholderBuilder: (context) => const Text('Loading')),
              const SizedBox(width: 5),
              const Text('Call',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12))
            ]),
            const SizedBox(width: 25),
            Row(children: [
              SvgPicture.asset(Images().whatsapp, height: 18, width: 18),
              const SizedBox(width: 5),
              const Text('Message',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12))
            ])
          ]),
          const SizedBox(height: 12),
          Container(
              height: 29,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryColorLight),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_active,
                        color: primaryColor, size: 18),
                    horizontalSpaceSmall,
                    Text('Send Reminder',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ]))
        ]));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel()
        ..getAllUser()
        ..getName();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
