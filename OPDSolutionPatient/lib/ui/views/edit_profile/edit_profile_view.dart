import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/ui/common/index.dart';
import '/ui/common/widgets/input_login.dart';
import '/ui/views/edit_profile/edit_profile_view.form.dart';
import 'edit_profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber', initialValue: ''),
  FormTextField(name: 'email', initialValue: ''),
  FormTextField(name: 'firstName', initialValue: ''),
  FormTextField(name: 'lastName', initialValue: ''),
  FormTextField(name: 'age', initialValue: ''),
  FormTextField(name: 'gender', initialValue: ''),
])
class EditProfileView extends StackedView<EditProfileViewModel>
    with $EditProfileView {
  final String? id;
  final String? patientName;
  final String? phoneNumber;
  final String? age;
  final String? gender;
  final String? base64Image;
  const EditProfileView(this.id, this.patientName, this.phoneNumber, this.age,
      this.gender, this.base64Image,
      {Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    var orient = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            orient
                ? Image(
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage("assets/images/vector.png"),
                    fit: BoxFit.cover,
                  )
                : Image(
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage("assets/images/landscapeBg.png"),
                    fit: BoxFit.cover,
                  ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(
                              top: 40, bottom: 10, left: 10, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Edit Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600))
                              ])),
                      Align(
                          alignment: Alignment.center,
                          child: OrientationBuilder(
                              builder: (context, orientation) {
                            return Container(
                                height: 95,
                                width: 95,
                                child: Stack(children: [
                                  Positioned.fill(
                                      child: viewModel.pickedImage != null
                                          ? Container(
                                              width: 95,
                                              height: 195,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(viewModel
                                                          .pickedImage!))))
                                          : base64Image ==
                                                  'http://103.30.75.131:444null'
                                              ? const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/user.png'))
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.network(
                                                      base64Image!,
                                                      height: 95,
                                                      width: 95,
                                                      fit: BoxFit.cover))),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: GestureDetector(
                                          onTap: viewModel.showBottomSheet,
                                          child: Image.asset(Images().editIcon,
                                              height: 30, width: 30)))
                                ]),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                margin: orient
                                    ? const EdgeInsets.only(bottom: 20, top: 10)
                                    : const EdgeInsets.only(bottom: 10));
                          })),
                      const Row(children: [
                        Expanded(
                            child: Text("First Name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))),
                        horizontalSpaceMedium,
                        Expanded(
                            child: Text("Last Name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)))
                      ]),
                      verticalSpaceSmall,
                      Row(children: [
                        Expanded(
                            child: InputLogin(
                                autofocus: false,
                                prefixIcon: const Icon(Icons.person_2_outlined,
                                    size: 22, color: Color(0xff2A2D34)),
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal),
                                keyboardType: TextInputType.text,
                                controller: firstNameController)),
                        horizontalSpaceMedium,
                        Expanded(
                            child: InputLogin(
                                autofocus: false,
                                prefixIcon: const Icon(Icons.person_2_outlined,
                                    size: 22, color: Color(0xff2A2D34)),
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal),
                                keyboardType: TextInputType.text,
                                controller: lastNameController))
                      ]),
                      verticalSpaceMedium,
                      const Row(children: [
                        Expanded(
                            child: Text("Phone Number",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)))
                      ]),
                      verticalSpaceSmall,
                      Row(children: [
                        Expanded(
                            child: InputLogin(
                                autofocus: false,
                                maxLines: 1,
                                readOnly: true,
                                maxLength: 10,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal),
                                controller: phoneNumberController,
                                prefixIcon: const Icon(Icons.call_outlined,
                                    size: 22, color: Color(0xff2A2D34))))
                      ]),
                      verticalSpaceMedium,
                      const Row(children: [
                        Expanded(
                            child: Text("Age",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))),
                        Expanded(
                            child: Text("Gender",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(23, 24, 26, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)))
                      ]),
                      verticalSpaceSmall,
                      Row(children: [
                        Expanded(
                            child: InputLogin(
                                inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                            ],
                                autofocus: false,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal),
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                controller: ageController)),
                        horizontalSpaceMedium,
                        Expanded(
                            child: InputLogin(
                                autofocus: false,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: DropdownButton(
                                        underline: const SizedBox(),
                                        isExpanded: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        elevation: 0,
                                        onChanged: (value) {
                                          viewModel.dropdown(value);
                                        },
                                        value: viewModel.dropdownvalue,
                                        icon: const Icon(Icons.expand_more),
                                        items:
                                            viewModel.items.map((String items) {
                                          return DropdownMenuItem(
                                              value: items, child: Text(items));
                                        }).toList())),
                                controller: genderController))
                      ])
                    ]))
          ])
        ])),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        viewModel.goToBack();
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black),
                      child: const Text("Cancel",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)))),
              horizontalSpaceMedium,
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(48, 197, 255, 1)),
                      onPressed: () {
                        viewModel.updateUserDetails(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            age: ageController.text,
                            phoneNumber: phoneNumberController.text,
                            id: id);
                        if (viewModel.pickedImage != null) {
                          viewModel.updateProfilePic(id);
                        }
                      },
                      child: const Text("Update",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              fontWeight: FontWeight.w700))))
            ])));
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel()
        ..setControllersValue(
            firstNameController,
            lastNameController,
            phoneNumberController,
            ageController,
            patientName!.split(' ').first,
            patientName!.split(' ').last,
            phoneNumber,
            age,
            gender);

  @override
  void onDispose(EditProfileViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditProfileViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
