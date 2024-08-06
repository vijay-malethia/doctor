import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/widgets/button.dart';
import '../../../common/widgets/input.dart';
import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'otpDigit1'),
  FormTextField(name: 'otpDigit2'),
  FormTextField(name: 'otpDigit3'),
  FormTextField(name: 'otpDigit4'),
])
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15),
        decoration: const BoxDecoration(),
        width: screenWidth(context),
        height: screenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter OTP',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'A four digit code just sent to your number  +91-${viewModel.phoneNumber}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                horizontalSpaceTiny,
                GestureDetector(
                    onTap: () {
                      viewModel.goToBack();
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(color: primaryColor),
                    ))
              ],
            ),
            verticalSpaceTiny,
            Row(
              children: [
                otp(
                    (p0) => viewModel.switchFocus1(
                        p0, context, otpDigit1Controller),
                    otpDigit1Controller),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                otp(
                    (p0) => viewModel.switchFocus2(
                        p0, context, otpDigit2Controller),
                    otpDigit2Controller),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                otp(
                    (p0) => viewModel.switchFocus3(
                        p0, context, otpDigit3Controller),
                    otpDigit3Controller),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                otp(
                    (p0) => viewModel.switchFocus4(
                        p0, context, otpDigit4Controller),
                    otpDigit4Controller)
              ],
            ),
            verticalSpaceMedium,
            Button(
              onPressed: viewModel.isFormValid(context)
                  ? () => viewModel.verifyOtp(context)
                  : null,
              title: 'Authenticate',
            ),
            verticalSpaceSmall,
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  viewModel.restartTimer(context);
                },
                child: RichText(
                    text: TextSpan(
                        text: didnotReceive,
                        style: Theme.of(context).textTheme.headlineSmall,
                        children: [
                      if (viewModel.timerText == '00:00')
                        TextSpan(
                            text: ' Resend ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      if (viewModel.timerText != '00:00')
                        TextSpan(
                            text: viewModel.timerText,
                            style: Theme.of(context).textTheme.headlineSmall)
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel()
        ..getPhoneNumber()
        ..startTimer();
  @override
  void onViewModelReady(OtpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(OtpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  Widget otp(onChanged, controller) {
    return Expanded(
        child: Input(
            autofocus: true,
            hintText: '-',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            controller: controller,
            textAlign: true,
            maxLength: 1));
  }
}
