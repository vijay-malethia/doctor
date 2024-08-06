import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'sign_up_viewmodel.dart';
import '/ui/common/index.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/dropdown.dart';
import '/ui/common/widgets/input.dart';
import '/ui/views/auth/sign_up/sign_up_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'age'),
  FormTextField(name: 'phoneNumber'),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            (orientation == Orientation.portrait) ? primaryColor : Colors.white,
        appBar: AppBar(
            backgroundColor: primaryColor,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: primaryColor),
            elevation: 0,
            toolbarHeight: 0),
        body: Stack(children: [
          if (orientation == Orientation.portrait)
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(Images().authBackground,
                    fit: BoxFit.fill)),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [signCard(viewModel, context)])
        ]));
  }

//Sign container
  Container signCard(SignUpViewModel viewModel, BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.70,
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
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color.fromARGB(255, 3, 116, 237)))),
              verticalSpaceMedium,
              Input(
                  controller: firstNameController,
                  hintText: "First Name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.person, color: primaryColor, size: 20)),
              verticalSpaceSmall,
              Input(
                  controller: lastNameController,
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
                  controller: phoneNumberController,
                  hintText: "+91 ----------",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLines: 1,
                  autofocus: false,
                  prefixIcon:
                      const Icon(Icons.call, color: primaryColor, size: 20)),
              verticalSpaceSmall,
              Input(
                  controller: ageController,
                  hintText: viewModel.showHintText ? "20" : '',
                  maxLength: 3,
                  keyboardType: TextInputType.number,
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
                  textAlign: true,
                  maxLines: 1,
                  autofocus: false),
              verticalSpaceSmall,
              DropDown(
                  items: viewModel.genderList,
                  initValue: viewModel.genderInitVale,
                  iconColor: Colors.grey,
                  onChanged: viewModel.changeGender),
              verticalSpaceMedium,
              Button(
                  height: 55,
                  loading: viewModel.isBusy,
                  onPressed: viewModel.isFormValid()
                      ? () => viewModel.signUpWithNumber(context)
                      : null,
                  title: 'Verify Mobile Number'),
              verticalSpaceMedium,
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        viewModel.goToAuthView();
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Already a user?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 23, 24, 26),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: " Log In",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor))
                              ])))),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ])));
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void disposeForm() {
    super.disposeForm();
  }
}
