import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/app_colors.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/dropdown.dart';
import '/ui/common/widgets/input.dart';
import '/ui/views/profile/profile_view.form.dart';
import '/ui/views/profile/profile_viewmodel.dart';

class AddUserSheet extends StackedView<ProfileViewModel> with $ProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddUserSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              verticalSpaceSmall,
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Add User",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color.fromARGB(255, 3, 116, 237)))),
              verticalSpaceMedium,
              Input(
                  controller: newUserfirstNameController,
                  hintText: "First Name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.person, color: primaryColor, size: 20)),
              verticalSpaceSmall,
              Input(
                  controller: newUserlastNameController,
                  hintText: "Last Name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.person, color: primaryColor, size: 20)),
              verticalSpaceSmall,
              Input(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: newUserphoneNumberController,
                  textStyle: const TextStyle(
                      letterSpacing: 0,
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                  hintText: "+91 ----------",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  maxLength: 10,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon: Icon(Icons.call,
                      color: primaryColor.withOpacity(0.5), size: 20)),
              verticalSpaceSmall,
              Input(
                  controller: newUserageController,
                  hintText: viewModel.showHintText ? "20" : '',
                  maxLength: 3,
                  focusNode: viewModel.focusNode,
                  onTap: viewModel.removeHintText(),
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Age",
                          style: TextStyle(
                              color: kcDarkGreyColor,
                              letterSpacing: 0,
                              fontSize: 18,
                              fontWeight: FontWeight.w700))),
                  textInputAction: TextInputAction.next,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  textAlign: true,
                  maxLines: 1,
                  autofocus: false),
              verticalSpaceSmall,
              DropDown(
                  items: viewModel.genderList,
                  initValue: viewModel.genderInitVale,
                  iconColor: Colors.grey,
                  onChanged: viewModel.changeNewUserGender),
              verticalSpaceMedium,
              Row(children: [
                Expanded(
                    child: Button(
                        isWhiteBg: true,
                        border: true,
                        title: 'Cancel',
                        onPressed: () {
                          completer!.call(SheetResponse(confirmed: false));
                        },
                        height: 55)),
                horizontalSpaceSmall,
                Expanded(
                    child: Button(
                        onPressed: () async {
                          await viewModel.addNewUser(context,
                              fName: newUserfirstNameController,
                              lName: newUserlastNameController,
                              age: newUserageController,
                              phoneNumber: newUserphoneNumberController);
                          completer!.call(SheetResponse(confirmed: true));
                        },
                        title: "Add",
                        height: 55))
              ]),
              verticalSpaceMedium
            ])));
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
