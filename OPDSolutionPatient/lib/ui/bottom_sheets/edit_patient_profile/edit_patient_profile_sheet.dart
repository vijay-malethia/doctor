import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/common/widgets/loader.dart';
import '/ui/common/index.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/dropdown.dart';
import '/ui/common/widgets/input.dart';
import '/ui/views/profile/profile_view.form.dart';
import '/ui/views/profile/profile_viewmodel.dart';

class EditPatientProfileSheet extends StackedView<ProfileViewModel>
    with $ProfileView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditPatientProfileSheet({
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
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: viewModel.isBusy
            ? const Loader()
            : SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    verticalSpaceSmall,
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Profile Edit",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                                fontFamily: 'Lato'))),
                    verticalSpaceSmall,
                    Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: viewModel.pickedImage != null
                                ? Image.file(viewModel.pickedImage!,
                                    height: 82,
                                    width: 82,
                                    fit: BoxFit.cover, frameBuilder:
                                        (context, child, number, isLoad) {
                                    if (isLoad == false) {
                                      return child;
                                    }
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  })
                                : patientProfilePath.trim().isNotEmpty
                                    ? Image.network(patientProfilePath,
                                        height: 82,
                                        width: 82,
                                        fit: BoxFit.cover, loadingBuilder:
                                            (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      })
                                    : SvgPicture.asset(Images().userLogoGreen,
                                        height: 82, width: 82))),
                    verticalSpaceMedium,
                    InkWell(
                        onTap: () {
                          viewModel.showImagePickerBottomSheet();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Images().uploadIcon,
                                  height: 22, width: 22),
                              horizontalSpaceSmall,
                              const Text("Upload",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700))
                            ])),
                    verticalSpaceMedium,
                    Input(
                        controller: firstNameController,
                        hintText: "First Name",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        autofocus: false,
                        prefixIcon: const Icon(Icons.person,
                            color: primaryColor, size: 24)),
                    verticalSpaceSmall,
                    Input(
                        controller: lastNameController,
                        hintText: "Last Name",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        autofocus: false,
                        prefixIcon: const Icon(Icons.person,
                            color: primaryColor, size: 24)),
                    verticalSpaceSmall,
                    Input(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: phoneNumberController,
                        textStyle: const TextStyle(
                            letterSpacing: 0,
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        readOnly: true,
                        hintText: "+91 ----------",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        maxLines: 1,
                        autofocus: false,
                        prefixIcon: Icon(Icons.call,
                            color: primaryColor.withOpacity(0.5), size: 24)),
                    verticalSpaceSmall,
                    Input(
                        controller: ageController,
                        hintText: viewModel.showHintText ? "20" : '',
                        focusNode: viewModel.focusNode,
                        onTap: viewModel.removeHintText(),
                        maxLength: 3,
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text("Age",
                                style: TextStyle(
                                    color: kcDarkGreyColor,
                                    letterSpacing: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700))),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: true,
                        maxLines: 1,
                        autofocus: false),
                    verticalSpaceSmall,
                    DropDown(
                        items: viewModel.genderList,
                        initValue: patientGender,
                        iconColor: Colors.grey,
                        onChanged: viewModel.changeGender),
                    verticalSpaceMedium,
                    Row(children: [
                      Expanded(
                          child: Button(
                              isWhiteBg: true,
                              border: true,
                              title: 'Cancel',
                              onPressed: () {
                                completer!
                                    .call(SheetResponse(confirmed: false));
                              },
                              height: 55)),
                      horizontalSpaceSmall,
                      Expanded(
                          child: Button(
                              onPressed: () async {
                                await viewModel.updatePatientDetails(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    age: ageController.text,
                                    id: patientId);
                                completer!.call(SheetResponse(confirmed: true));
                              },
                              title: "Update",
                              height: 55))
                    ])
                  ])));
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
