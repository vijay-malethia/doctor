import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/images.dart';
import '../../common/index.dart';

import '../../widgets/button.dart';
import '../../widgets/search_input.dart';
import 'search_user_viewmodel.dart';

class SearchUserView extends StackedView<SearchUserViewModel> {
  final TextEditingController _searchController = TextEditingController();
  SearchUserView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchUserViewModel viewModel,
    Widget? child,
  ) {
    var orient = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        backgroundColor: primaryColor,
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 5))
            : SafeArea(
                child: Column(children: [
                renderAppBar(context, viewModel), //render App Bar
                Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: viewModel.searchList.isEmpty &&
                                _searchController.text.isNotEmpty
                            ? noUserFound(viewModel,
                                context) // add user if user not found
                            : searchListView(
                                viewModel, orient) // render search list
                        ))
              ])));
  }

  //////////////////////////////////////////////////////////////////////// App Bar//////////////////////////////////////////////////////////////////
  Container renderAppBar(BuildContext context, SearchUserViewModel viewModel) {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    viewModel.gotoHomePage();
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white))),
              horizontalSpaceSmall,
              Expanded(
                  child: SearchInput(
                      onChanged: (value) {
                        viewModel.searchNumber(value);
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      textAlign: true,
                      controller: _searchController,
                      autofocus: true,
                      prefixIcon: const Icon(Icons.search_rounded,
                          size: 20, color: primaryColor),
                      hintText: "Search Here",
                      maxLines: 1)),
            ]));
  }

///////////////////////////////////////////////////////Registered user not found , Add NEW User////////////////////////////////////////////////////////////////
  SingleChildScrollView noUserFound(
      SearchUserViewModel viewModel, BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          verticalSpaceLarge,
          SvgPicture.asset("assets/images/smile.svg"),
          verticalSpaceMedium,
          Text("No Registered User Found With This Number",
              style: Theme.of(context).textTheme.bodyMedium),
          verticalSpaceMedium,
          Row(mainAxisSize: MainAxisSize.min, children: [
            const Expanded(child: SizedBox()),
            Expanded(
                child: Button(
                    onPressed: () {
                      viewModel.showBottomSheet();
                    },
                    title: "Add User",
                    height: 59)),
            const Expanded(child: SizedBox())
          ])
        ]));
  }

  ///////////////////////////////////////////////////////////////Search List////////////////////////////////////////////////////////////////////////////////
  GridView searchListView(SearchUserViewModel viewModel, orient) {
    return GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: viewModel.searchList.length + 1,
        itemBuilder: (context, index) => index < viewModel.searchList.length
            ? renderPatients(index, viewModel, context) // Render Patients
            : _searchController.text.isEmpty
                ? Container()
                : renderAddNewUserContainer(viewModel, context), // Add New User
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 251,
            mainAxisSpacing: 8,
            crossAxisSpacing: 5,
            crossAxisCount: orient ? 2 : 3));
  }

/////////////////////////////////////////////////////////////////////////Add New User////////////////////////////////////////////////////////////////////////////////
  Container renderAddNewUserContainer(
      SearchUserViewModel viewModel, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: primaryColor),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 1.0,
                  spreadRadius: 1,
                  offset: const Offset(2, 2))
            ]),
        child: InkWell(
            onTap: () {
              viewModel.showBottomSheet();
            },
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline, color: primaryColor, size: 15),
                  horizontalSpaceTiny,
                  Text("Add User",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
                ])));
  }

  ////////////////////////////////////////////////////////////////////////// Patients view////////////////////////////////////////////////////////////////////////////////
  Container renderPatients(
      index, SearchUserViewModel viewModel, BuildContext context) {
    var patient = viewModel.searchList[index];
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
              onTap: () =>
                  viewModel.goToUserDetailsView(index, _searchController),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    verticalSpaceSmall,
                    SvgPicture.asset(viewModel.logoList[Random().nextInt(5)]),
                    verticalSpaceSmall,
                    Text('${patient['firstName']} ${patient['lastName']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lato',
                        )),
                    verticalSpaceSmall,
                    Text(patient['phoneNumber'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Lato')),
                    verticalSpaceSmall,
                    Text('(${patient['age']}y, ${patient['gender']})',
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
  SearchUserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchUserViewModel();

  @override
  void onDispose(SearchUserViewModel viewModel) {
    super.onDispose(viewModel);
    _searchController.dispose();
  }
}
