import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opdsolutionui/ui/common/widgets/loader.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/images.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/common/widgets/bottom_bar.dart';
import 'home_viewmodel.dart';
import '/ui/common/app_colors.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var orient = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: primaryColor),
            elevation: 0,
            centerTitle: false,
            titleSpacing: 15,
            title: Text('Appointments',
                style: Theme.of(context).textTheme.bodyLarge)),
        body: viewModel.isBusy
            ? const Loader()
            : RefreshIndicator(
                onRefresh: viewModel.getAllDoc,
                child: Column(children: [
                  // renderAppBar(context),
                  verticalSpaceMedium,
                  renderDoctorList(viewModel, orient)
                ])),
        bottomNavigationBar: BottomNavigation(currentIndex: 0));
  }

//app bar
  Stack renderAppBar(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(Images().appBarImage,
              height: 120, fit: BoxFit.fill)),
      Padding(
          padding: const EdgeInsets.only(top: 50, left: 18, right: 10),
          child: Text('Appointments',
              style: Theme.of(context).textTheme.headlineMedium))
    ]);
  }

//////////////////////////////////////////////doctor list///////////////////////////////////////////////////////////////
  renderDoctorList(HomeViewModel viewModel, orient) {
    return Expanded(
        child: GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: viewModel.docList.length,
            itemBuilder: (context, index) =>
                renderDoctors(index, viewModel, context),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 165,
                mainAxisSpacing: 8,
                crossAxisSpacing: 5,
                crossAxisCount: orient ? 2 : 3)));
  }

//////////////////////////////////////////////////////render doctors//////////////////////////////////////////////////////////
  Container renderDoctors(
      index, HomeViewModel viewModel, BuildContext context) {
    // var doctor = viewModel.docList[index];
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          InkWell(
              hoverColor: Colors.transparent,
              onTap: () => viewModel.goToDocView(index),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    const SizedBox(height: 15),
                    SvgPicture.asset(Images().userImage, height: 65, width: 65),
                    verticalSpaceSmall,
                    Text(
                        '${viewModel.docList[index]['firstName']} ${viewModel.docList[index]['lastName']}',
                        style: Theme.of(context).textTheme.titleLarge),
                    verticalSpaceTiny,
                    Text(
                        '${viewModel.docList[index]['appointmentsCount']} Appointments',
                        style: Theme.of(context).textTheme.bodyMedium),
                    verticalSpaceSmall
                  ])))
        ]));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel()..getAllDoc();
}
