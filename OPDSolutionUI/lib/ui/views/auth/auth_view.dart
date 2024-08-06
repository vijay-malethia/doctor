import 'package:flutter/material.dart';
import '/ui/views/auth/auth_view.form.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked/stacked_annotations.dart';

import '../../common/ui_helpers.dart';
import '../../common/widgets/button.dart';
import '../../common/widgets/input.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          width: MediaQuery.of(context).size.width * 0.7,
          height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Login', style: Theme.of(context).textTheme.headlineLarge),
              verticalSpaceSmall,
              Text('Enter Registered Number',
                  style: Theme.of(context).textTheme.titleMedium),
              verticalSpaceMedium,
              verticalSpaceTiny,
              Input(
                controller: phoneNumberController,
                maxLength: 10,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('+91',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Color.fromARGB(255, 23, 101, 174),
                            fontSize: 19,
                            fontWeight: FontWeight.w500))),
                letterSpacing: 2,
                keyboardType: TextInputType.number,
              ),
              verticalSpaceMedium,
              Button(
                loading: viewModel.isBusy,
                onPressed: viewModel.isFormValid()
                    ? () => viewModel.loginWithNumber(context)
                    : null,
                title: 'Send OTP',
              )
            ],
          ),
        ),
      ),
    );
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
