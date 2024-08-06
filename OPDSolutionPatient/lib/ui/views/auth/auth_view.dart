import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '/ui/common/app_colors.dart';
import '/ui/common/images.dart';
import '/ui/common/widgets/input.dart';
import '/ui/views/auth/auth_view.form.dart';
import '../../common/ui_helpers.dart';
import '../../common/widgets/button.dart';
import 'auth_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber', initialValue: ''),
])
class AuthView extends StackedView<AuthViewModel> with $AuthView {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
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
          (orientation == Orientation.portrait)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [renderLoginContainer(context, viewModel)])
              : SingleChildScrollView(
                  child: renderLoginContainer(context, viewModel))
        ]));
  }

//Login container and input fields
  Container renderLoginContainer(
      BuildContext context, AuthViewModel viewModel) {
    return Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalSpaceSmall,
          const Text("Login",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromARGB(255, 3, 116, 237))),
          const SizedBox(height: 10),
          const Text("Enter Registered Phone Number",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color.fromARGB(255, 23, 24, 26))),
          verticalSpaceMedium,
          Row(children: [
            const Expanded(
                flex: 1,
                child: Input(
                    maxLines: 1,
                    readOnly: true,
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("+91",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: primaryColor))))),
            horizontalSpaceSmall,
            Expanded(
                flex: 4,
                child: Input(
                    autofocus: true,
                    controller: phoneNumberController,
                    maxLength: 10,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    keyboardType: TextInputType.number))
          ]),
          verticalSpaceMedium,
          Button(
              height: 55,
              loading: viewModel.isBusy,
              onPressed: viewModel.isFormValid()
                  ? () => viewModel.loginWithNumber(context)
                  : null,
              title: 'Send OTP'),
          verticalSpaceMedium,
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    viewModel.goToSignUpView();
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Not a user?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 23, 24, 26),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor))
                          ]))))
        ]));
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();
  @override
  void onViewModelReady(AuthViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(AuthViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
