import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../widgets/input.dart';
import 'package:opd_doctor/ui/common/index.dart';
import 'package:opd_doctor/ui/views/otp/otp_view.form.dart';
import 'package:opd_doctor/widgets/button.dart';
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
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verticalSpaceLarge,
                          Text("Enter Passcode",
                              style: theme.headlineLarge,
                              textAlign: TextAlign.center),
                          verticalSpaceSmall,
                          Text(verifyNumber,
                              style: theme.bodyMedium,
                              textAlign: TextAlign.center),
                          verticalSpaceTiny,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("+91 ${viewModel.phoneNumber}",
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                horizontalSpaceSmall,
                                GestureDetector(
                                  onTap: () {
                                    viewModel.goToBack();
                                  },
                                  child: SvgPicture.asset(
                                      Images().changePhoneNumber,
                                      height: 37,
                                      width: 37),
                                )
                              ]),
                          verticalSpaceSmall,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                otp(
                                    (p0) => viewModel.switchFocus1(
                                        p0, context, otpDigit1Controller),
                                    otpDigit1Controller),
                                horizontalSpaceSmall,
                                otp(
                                    (p0) => viewModel.switchFocus2(
                                        p0, context, otpDigit2Controller),
                                    otpDigit2Controller),
                                horizontalSpaceSmall,
                                otp(
                                    (p0) => viewModel.switchFocus3(
                                        p0, context, otpDigit3Controller),
                                    otpDigit3Controller),
                                horizontalSpaceSmall,
                                otp(
                                    (p0) => viewModel.switchFocus4(
                                        p0, context, otpDigit4Controller),
                                    otpDigit4Controller)
                              ]),
                          verticalSpaceMedium,
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Code Expires in :  ",
                                  style: theme.bodySmall,
                                  children: [
                                    TextSpan(
                                        text: viewModel.timerText,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 113, 174, 240),
                                        ))
                                  ])),
                          verticalSpaceSmall,
                          GestureDetector(
                            onTap: () {
                              if (viewModel.timerText == "00:00") {
                                viewModel.restartTimer(context);
                              }
                            },
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: notRecieveCode,
                                    style: theme.bodySmall,
                                    children: [
                                      TextSpan(
                                          text: " Resend",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                viewModel.timerText == "00:00"
                                                    ? primaryColor
                                                    : const Color.fromARGB(
                                                        255, 113, 174, 240),
                                          ))
                                    ])),
                          ),
                          verticalSpaceMedium,
                          Button(
                              height: 55,
                              onPressed: viewModel.isFormValid(context)
                                  ? () => viewModel.verifyOtp(context)
                                  : null,
                              title: 'Authenticate'),
                        ]),
                  )))
        ]));
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
            islogin: true,
            hintstyle: const TextStyle(
                color: primaryColor, fontSize: 20, fontWeight: FontWeight.w500),
            hintText: "-",
            autofocus: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            controller: controller,
            textAlign: true,
            maxLength: 1));
  }
}
