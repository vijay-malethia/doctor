import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opd_doctor/app/app.router.dart';
import 'package:opd_doctor/widgets/search_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../widgets/button.dart';
import '../../../widgets/drawer_navigator.dart';
import '../../common/app_colors.dart';
import '../../common/image.dart';
import '../../common/ui_helpers.dart';
import 'search_user_viewmodel.dart';

class SearchUserView extends StackedView<SearchUserViewModel> {
  final TextEditingController _searchController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final List userList;
  SearchUserView({required this.userList, Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchUserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: DrawerNavigator(),
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
                            ? addNewUser(context) // add user if user not found
                            : searchListView(viewModel) // render search list
                        ))
              ])));
  }

///////////////////////////////////////////////////////Registered user not found , Add NEW User////////////////////////////////////////////////////////////////
  SingleChildScrollView addNewUser(BuildContext context) {
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
                      _bottomSheetService.showCustomSheet(
                          isScrollControlled: true,
                          variant: BottomSheetType.addNewUser);
                    },
                    title: "Add New User",
                    height: 59)),
            const Expanded(child: SizedBox())
          ])
        ]));
  }

  ///////////////////////////////////////////////////////////////Search List////////////////////////////////////////////////////////////////////////////////
  GridView searchListView(SearchUserViewModel viewModel) {
    return GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: viewModel.searchList.length,
        itemBuilder: (context, index) =>
            renderPatients(index, context, viewModel),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 15,
            childAspectRatio: .98,
            maxCrossAxisExtent: 350));
  }

//////////////////////////////////////////////////////////////////////////// App Bar//////////////////////////////////////////////////////////////////
  Container renderAppBar(BuildContext context, SearchUserViewModel viewModel) {
    return Container(
        height: 87,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(Images().menuIcon)));
              }),
              horizontalSpaceSmall,
              Expanded(
                  child: Text("Consultations",
                      style: Theme.of(context).textTheme.headlineMedium)),
              horizontalSpaceLarge,
              Expanded(
                  flex: 4,
                  child: SearchInput(
                      onChanged: (value) {
                        viewModel.searchNumber(value);
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      textAlign: true,
                      controller: _searchController,
                      autofocus: false,
                      prefixIcon: const Icon(Icons.search_rounded,
                          size: 21, color: primaryColor),
                      hintText: "Search Here",
                      maxLines: 1))
            ]));
  }

///////////////////////////////////////////////////////////////////////// Searched Patients/////////////////////////////////////////////////////////////////////
  Container renderPatients(
      index, BuildContext context, SearchUserViewModel viewModel) {
    var patient = viewModel.searchList[index];
    var theme = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 2.0,
                  spreadRadius: 1,
                  offset: const Offset(5, 5))
            ]),
        child: Column(children: [
          InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                _navigationService.navigateTo(Routes.userProfileView,
                    arguments: UserProfileViewArguments(
                        userList: viewModel.searchList, index: index));
              },
              child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    verticalSpaceSmall,
                    SvgPicture.asset(viewModel.logoList[Random().nextInt(5)]),
                    verticalSpaceSmall,
                    Text('${patient['firstName'] + " " + patient['lastName']}',
                        style: theme.labelLarge,
                        overflow: TextOverflow.ellipsis),
                    verticalSpaceSmall,
                    Text(patient['phoneNumber'], style: theme.bodySmall),
                    verticalSpaceSmall,
                    Text('(${patient['age']}y., ${patient['gender']})',
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 23, 24, 26),
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ]))),
          const SizedBox(height: 18),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              SvgPicture.asset(Images().callIcon),
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
