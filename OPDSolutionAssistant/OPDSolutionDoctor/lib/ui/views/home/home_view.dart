import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opd_doctor/widgets/drawer_navigator.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/index.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: renderAppbar(context, viewModel),
        drawer: DrawerNavigator(),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                    color: primaryColor, strokeWidth: 5))
            : SafeArea(
                child: RefreshIndicator(
                    onRefresh: viewModel.getAllPatient,
                    child: GridView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: viewModel.allPatient.length,
                        itemBuilder: (context, index) =>
                            renderPatients(index, viewModel, context),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 15,
                                childAspectRatio: .98,
                                maxCrossAxisExtent: 350)))));
  }

  Container renderPatients(
      index, HomeViewModel viewModel, BuildContext context) {
    var patient = viewModel.allPatient[index];
    var theme = Theme.of(context).textTheme;
    return Container(
        // height: 300,
        // width: 235,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
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
              onTap: () => viewModel.goToPatientView(index),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    verticalSpaceSmall,
                    SvgPicture.asset(viewModel.logoList[Random().nextInt(5)]),
                    verticalSpaceSmall,
                    Text(patient.name, style: theme.labelLarge),
                    verticalSpaceSmall,
                    Text(patient.phoneNumber, style: theme.bodySmall),
                    verticalSpaceSmall,
                    Text('(${patient.age}y, ${patient.gender})',
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 23, 24, 26),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ]))),
          const SizedBox(height: 18),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              SvgPicture.asset(
                Images().callIcon,
                placeholderBuilder: (context) => Text('Loading'),
              ),
              const SizedBox(width: 8),
              Text('Call', style: theme.bodySmall)
            ]),
            const SizedBox(width: 30),
            Row(children: [
              SvgPicture.asset(Images().whatsapp),
              const SizedBox(width: 8),
              Text('Message', style: theme.bodySmall)
            ])
          ]),
          const SizedBox(height: 18),
          Container(
              height: 35,
              // padding: const EdgeInsets.symmetric(vertical: 4),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryColorLight),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_active,
                        color: primaryColor, size: 20),
                    horizontalSpaceSmall,
                    Text('Send Reminder',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ])),
        ]));
  }

  //Return appbar
  AppBar renderAppbar(BuildContext context, HomeViewModel viewModel) => AppBar(
          backgroundColor: primaryColor,
          toolbarHeight: 87,
          leadingWidth: 80,
          centerTitle: false,
          titleSpacing: 5,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.black),
          title: Text('Consultations',
              style: Theme.of(context).textTheme.headlineMedium),
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(Images().menuIcon)));
            },
          ),
          actions: [
            Row(children: [
              InkWell(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 47,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Add New Consultation',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)))),
                  onTap: () {
                    viewModel.goToSearch();
                  })
            ])
          ]);

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
