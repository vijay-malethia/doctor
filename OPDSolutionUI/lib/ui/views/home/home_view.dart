import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/scheduler.dart';
import 'package:opdsolutionui/ui/common/app_strings.dart';
import 'package:opdsolutionui/widget/drawer_navigator.dart';
import 'package:stacked/stacked.dart';

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
      drawer: DrawerNavigator(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: renderAppBar(viewModel, context),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: RefreshIndicator(
                      onRefresh: viewModel.getAllPatient,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: viewModel.allPatient.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                viewModel.goToConsultationView(index);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 224, 225, 230),
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
                                            color: Color.fromARGB(
                                                255, 248, 249, 255),
                                            blurRadius: 2,
                                            spreadRadius: 0,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            viewModel.allPatient[index]
                                                        ['firstName']
                                                    .toString() +
                                                ' ' +
                                                viewModel.allPatient[index]
                                                        ['lastName']
                                                    .toString() +
                                                '(${viewModel.allPatient[index]['age']}y.' +
                                                ' ${viewModel.allPatient[index]['gender'].toString()})' +
                                                ' -${viewModel.allPatient[index]['phoneNumber']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  AppBar renderAppBar(HomeViewModel viewModel, BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 80,
      leading: Builder(builder: (context) {
        return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: imageUrl == "" || imageUrl == baseurl
                  ? const Image(image: AssetImage('assets/images/user.png'))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(width: 80,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(child: CircularProgressIndicator());
                      }, imageUrl, fit: BoxFit.cover)),
            ));
      }),
      title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title:
              Text(docName, style: Theme.of(context).textTheme.headlineMedium),
          subtitle: viewModel.specialization == 'null' ||
                  viewModel.specialization == ''
              ? const Text('Doctor')
              : Text(viewModel.specialization,
                  style: Theme.of(context).textTheme.titleMedium)),
      // actions: [
      //   PopupMenuButton(
      //       color: Colors.white,
      //       icon: const Icon(Icons.more_vert, color: Colors.black),
      //       offset: const Offset(-20, 45),
      //       shape: RoundedRectangleBorder(
      //           side: const BorderSide(
      //               color: Color.fromARGB(255, 209, 213, 219), width: 1),
      //           borderRadius: BorderRadius.circular(10)),
      //       itemBuilder: (context) {
      //         return [
      //           PopupMenuItem<int>(
      //               onTap: viewModel.logOut,
      //               child: Text('Log Out',
      //                   style:
      //                       TextStyle(color: Theme.of(context).primaryColor))),
      //         ];
      //       })
      // ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel()..initFuntion();

  @override
  void onViewModelReady(HomeViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) => null);
}
