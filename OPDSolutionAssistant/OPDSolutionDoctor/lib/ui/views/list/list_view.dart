import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opd_doctor/widgets/drawer_navigator.dart';
import 'package:stacked/stacked.dart';
import 'package:opd_doctor/ui/common/index.dart';

import '../../../widgets/search_input.dart';
import 'list_viewModel.dart';

class ListView extends StackedView<ListViewModel> {
  final String name;
  final TextEditingController _searchController = TextEditingController();
  ListView({required this.name, Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.black),
        ),
        backgroundColor: primaryColor,
        drawer: DrawerNavigator(),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 5))
            : SafeArea(
                child: Column(children: [
                renderAppBar(viewModel, context),
                Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: viewModel.isSearchResultEmpty(
                                        name, _searchController.text) ==
                                    true
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        SvgPicture.asset(
                                            "assets/images/smile.svg"),
                                        verticalSpaceMedium,
                                        Text("No Result Found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium)
                                      ])
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.007),
                                    itemCount:
                                        viewModel.getItemCount(name, viewModel),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return render(
                                          viewModel,
                                          index,
                                          viewModel.renderList(
                                              name, viewModel, index));
                                    }))))
              ])));
  }

  Container renderAppBar(ListViewModel viewModel, BuildContext context) {
    return Container(
        // height: 87,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(Images().menuIcon)));
              }),
              horizontalSpaceSmall,
              Expanded(
                  flex: 2,
                  child: Text(name,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 225, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w700))),
              horizontalSpaceLarge,
              Expanded(
                  flex: 3,
                  child: SearchInput(
                      textAlign: true,
                      onChanged: (value) {
                        viewModel.renderSearch(viewModel, value, context, name);
                      },
                      controller: _searchController,
                      autofocus: false,
                      prefixIcon: const Icon(Icons.search_rounded,
                          size: 21, color: primaryColor),
                      hintText: "Search Here",
                      maxLines: 1)),
              horizontalSpaceMedium,
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.24,
                  child: InkWell(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 47,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Add New $name",
                                  style: const TextStyle(
                                      fontFamily: 'Lato',
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)))),
                      onTap: () {
                        viewModel.showPopUp(name);
                      })),
            ]));
  }

  @override
  ListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ListViewModel()..initFunction(name);

  @override
  void onDispose(ListViewModel viewModel) {
    super.onDispose(viewModel);
    _searchController.dispose();
  }

  render(ListViewModel viewModel, int index, List list) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
            color: bglightColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: Text(list[index].listItem,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kcDarkGreyColor)),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Switch.adaptive(
                      activeColor: primaryColor,
                      inactiveThumbColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white,
                      value: list[index].isActive == true ? true : false,
                      onChanged: (val) {
                        viewModel.renderSwitch(viewModel, index, name);
                      })))
        ]));
  }
}
