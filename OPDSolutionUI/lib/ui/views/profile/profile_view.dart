import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/views/profile/profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/app_strings.dart';
import '../../common/images.dart';
import '../../common/ui_helpers.dart';

import '../../common/widgets/info_input.dart';
import 'profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "firstName"),
  FormTextField(name: "lastName"),
  FormTextField(name: 'age'),
  FormTextField(name: 'gender'),
  FormTextField(name: 'specialization'),
])
class ProfileView extends StackedView<ProfileViewModel> with $ProfileView {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                  viewModel.isEditable == true ? " Edit Profile" : "Profile",
                  style: const TextStyle(color: Colors.black)),
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  viewModel.isEditable == true
                      ? viewModel.profile()
                      : viewModel.goBack();
                })),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Align(
                      alignment: Alignment.center,
                      child:
                          OrientationBuilder(builder: (context, orientation) {
                        return Container(
                            height: 95,
                            width: 95,
                            child: viewModel.isEditable == true
                                ? Stack(children: [
                                    Positioned.fill(
                                        child: viewModel.pickedImage != null
                                            ? Container(
                                                width: 95,
                                                height: 195,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: FileImage(
                                                            viewModel
                                                                .pickedImage!))))
                                            : viewModel.doctor.base64Image ==
                                                    '${baseurl}null'
                                                ? const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/images/user.png'))
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                        viewModel
                                                            .doctor.base64Image,
                                                        height: 95,
                                                        width: 95,
                                                        fit: BoxFit.cover))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: GestureDetector(
                                              onTap: viewModel.showBottomSheet,
                                              child: Image.asset(
                                                  Images().editIcon,
                                                  height: 35,
                                                  width: 35)),
                                        ))
                                  ])
                                : Stack(children: [
                                    Positioned.fill(
                                        child: viewModel.doctor.base64Image ==
                                                '${baseurl}null'
                                            ? const CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/user.png'))
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }, viewModel.doctor.base64Image,
                                                    height: 95,
                                                    width: 95,
                                                    fit: BoxFit.cover)))
                                  ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)));
                      })),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        viewModel.isEditable == true
                            ? Row(children: [
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: input(
                                            firstNameController,
                                            "First Name :",
                                            TextInputType.name,
                                            20))),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: input(
                                            lastNameController,
                                            "Last Name :",
                                            TextInputType.name,
                                            20)))
                              ])
                            : Text(
                                '${viewModel.doctor.firstName} ${viewModel.doctor.lastName}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                        verticalSpaceSmall,
                        viewModel.isEditable == true
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: input(ageController, "Age :",
                                    TextInputType.number, 2))
                            : renderWidget(
                                text: viewModel.doctor.age,
                                icon: const Text('Age :')),
                        verticalSpaceSmall,
                        viewModel.isEditable == true
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: dropdown(viewModel))
                            : renderWidget(
                                text: viewModel.doctor.gender,
                                icon: const Text('Gender :')),
                        verticalSpaceSmall,
                        viewModel.isEditable == true
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: renderWidget(
                                    text: viewModel.doctor.phoneNumber,
                                    icon: const Text('Phone Number :')))
                            : renderWidget(
                                text: viewModel.doctor.phoneNumber,
                                icon: const Text('Phone Number :')),
                        verticalSpaceSmall,
                        viewModel.isEditable == true
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: input(specializationController,
                                    "Specialization :", TextInputType.text, 20))
                            : renderWidget(
                                text: viewModel.doctor.specialization,
                                icon: const Text('Specialization :'))
                      ])),
                  horizontalSpaceMedium,
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            viewModel.isEditable
                                ? viewModel.updateView(
                                    id: viewModel.doctor.id,
                                    fname: firstNameController.text,
                                    lname: lastNameController.text,
                                    age: ageController.text,
                                    specialization:
                                        specializationController.text)
                                : viewModel.gotoEditProfileView(
                                    fnameCtrl: firstNameController,
                                    lnameCtrl: lastNameController,
                                    lnameValue: viewModel.doctor.lastName,
                                    ageCtrl: ageController,
                                    fnameValue: viewModel.doctor.firstName,
                                    ageValue: viewModel.doctor.age,
                                    genderValue: viewModel.dropdownvalue,
                                    speclCtrl: specializationController,
                                    speclValue:
                                        viewModel.doctor.specialization);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(48, 197, 255, 1)),
                          child: Text(
                              viewModel.isEditable == true
                                  ? 'Update'
                                  : "Edit Profile",
                              style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)))),
                  verticalSpaceLarge,
                  verticalSpaceLarge
                ]))));
  }

  InfoInput dropdown(viewModel) => InfoInput(
        autofocus: false,
        maxLines: 1,
        textInputAction: TextInputAction.done,
        suffixIcon: Row(children: [
          const Padding(
              padding: EdgeInsets.all(13),
              child: Text("Gender :",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(23, 24, 26, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
          Expanded(
              flex: 6,
              child: SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: DropdownButton<String>(
                          underline: const SizedBox(),
                          isExpanded: true,
                          elevation: 0,
                          onChanged: (value) {
                            viewModel.dropdown(value);
                          },
                          value: viewModel.dropdownvalue,
                          icon: const Icon(Icons.expand_more),
                          items: viewModel.items
                              .map<DropdownMenuItem<String>>((String items) {
                            return DropdownMenuItem<String>(
                                value: items, child: Text(items));
                          }).toList()))))
        ]),
        controller: genderController,
      );

  InfoInput input(controller, text, type, length) => InfoInput(
      controller: controller,
      keyboardType: type,
      autofocus: false,
      maxLines: 1,
      maxLength: length,
      textInputAction: TextInputAction.next,
      textStyle: const TextStyle(fontStyle: FontStyle.normal),
      prefixIcon: Padding(
          padding: const EdgeInsets.all(13),
          child: Text(text,
              style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(23, 24, 26, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500))));

  Container renderWidget({required String text, required Widget icon}) {
    return Container(
        height: 65,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              icon,
              const SizedBox(width: 20),
              Expanded(
                  child: Text(text,
                      style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color.fromRGBO(23, 24, 26, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)))
            ])),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 250, 255),
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(42, 45, 52, 0.08)))));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel()..initFunction();
}
