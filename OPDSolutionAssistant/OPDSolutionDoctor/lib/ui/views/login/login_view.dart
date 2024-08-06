import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:opd_doctor/ui/common/index.dart';
import 'package:opd_doctor/ui/views/login/login_view.form.dart';
import 'package:opd_doctor/widgets/button.dart';
import 'package:opd_doctor/widgets/input.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber', initialValue: ''),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child:
                  SvgPicture.asset(Images().authBackground, fit: BoxFit.fill)),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login",
                            style: theme.headlineLarge,
                            textAlign: TextAlign.center),
                        verticalSpaceSmall,
                        Text(enterNumber,
                            style: theme.bodyMedium,
                            textAlign: TextAlign.center),
                        verticalSpaceMedium,
                        Row(children: [
                          const Expanded(
                              flex: 1,
                              child: Input(
                                  maxLines: 1,
                                  readOnly: true,
                                  islogin: true,
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("+91",
                                          style: TextStyle(
                                              color: primaryColor,
                                              letterSpacing: 4))))),
                          horizontalSpaceSmall,
                          Expanded(
                              flex: 4,
                              child: Input(
                                  autofocus: true,
                                  controller: phoneNumberController,
                                  islogin: true,
                                  maxLength: 10,
                                  textInputAction: TextInputAction.next,
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
                            title: 'Send OTP')
                      ])))
        ]));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
