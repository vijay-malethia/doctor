import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_viewmodel.dart';
import '/ui/common/index.dart';
import '/ui/common/images.dart';
import '/ui/widgets/index.dart';
import '/ui/views/login/login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'PhoneNumber', initialValue: ''),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
        child: Scaffold(
            backgroundColor: (orientation == Orientation.portrait)
                ? primaryColor
                : Colors.white,
            body: Stack(children: [
              //background imge
              if (orientation == Orientation.portrait)
                SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SvgPicture.asset(Images().authBackground,
                        fit: BoxFit.fill)),
              (orientation == Orientation.portrait)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //login fields
                        renderLoginContainer(context, viewModel),
                      ],
                    )
                  : SingleChildScrollView(
                      child: renderLoginContainer(context, viewModel))
            ])));
  }

//Login container and input fields
  Container renderLoginContainer(
      BuildContext context, LoginViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          const Text(
            login,
            style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromARGB(255, 3, 116, 237)),
          ),
          const SizedBox(height: 10),
          Text(registeredNumber,
              style: Theme.of(context).textTheme.headlineMedium),
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
                              color: primaryColor,
                            ))))),
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
              onPressed: viewModel.checkValidation
                  ? () => viewModel.loginWithPhoneNumber(context)
                  : null,
              title: 'Send OTP')
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
