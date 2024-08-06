import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

import '/ui/common/images.dart';
import '/ui/widgets/button.dart';
import '/ui/widgets/input.dart';
import '/ui/common/index.dart';
import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'otpDigit1', initialValue: ''),
  FormTextField(name: 'otpDigit2', initialValue: ''),
  FormTextField(name: 'otpDigit3', initialValue: ''),
  FormTextField(name: 'otpDigit4', initialValue: ''),
])
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
        child: Scaffold(
            // resizeToAvoidBottomInset: false,
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
                        //otp conatiner design
                        renderOtpCard(context, viewModel)
                      ],
                    )
                  : SingleChildScrollView(
                      child: renderOtpCard(context, viewModel))
            ])));
  }

//Otp container
  renderOtpCard(BuildContext context, OtpViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        // padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            const Text(
              'Enter Passcode',
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromARGB(255, 3, 116, 237)),
            ),
            const SizedBox(height: 10),
            Text('We have sent otp to your registered phone number',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("+91 ${viewModel.phoneNumber}",
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              horizontalSpaceSmall,
              GestureDetector(
                onTap: () {
                  viewModel.goToBack();
                },
                child: SvgPicture.asset(Images().changePhoneumber,
                    height: 37, width: 37),
              )
            ]),
            verticalSpaceMedium,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              otp(
                  (p0) =>
                      viewModel.switchFocus1(p0, context, otpDigit1Controller),
                  otpDigit1Controller),
              horizontalSpaceSmall,
              otp(
                  (p0) =>
                      viewModel.switchFocus2(p0, context, otpDigit2Controller),
                  otpDigit2Controller),
              horizontalSpaceSmall,
              otp(
                  (p0) =>
                      viewModel.switchFocus3(p0, context, otpDigit3Controller),
                  otpDigit3Controller),
              horizontalSpaceSmall,
              otp(
                  (p0) =>
                      viewModel.switchFocus4(p0, context, otpDigit4Controller),
                  otpDigit4Controller)
            ]),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Code expires in : ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 23, 24, 26),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: viewModel.timerText,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 113, 174, 240),
                            ))
                      ])),
            ),
            verticalSpaceTiny,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (viewModel.timerText == "00:00") {
                    viewModel.restartTimer(context);
                  }
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Didn’t recieve code?',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 23, 24, 26),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                              text: " Resend",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: viewModel.timerText == "00:00"
                                    ? primaryColor
                                    : const Color.fromARGB(255, 113, 174, 240),
                              ))
                        ])),
              ),
            ),
            verticalSpaceMedium,
            Button(
                height: 55,
                onPressed: viewModel.isFormValid(context)
                    ? () => viewModel.verifyOTP(context)
                    : null,
                title: authenticate),
            verticalSpaceSmall,
            // Padding(
            //     padding: EdgeInsets.only(
            //         bottom: MediaQuery.of(context).viewInsets.bottom))
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
        ..startTimer()
        ..getPhoneNumber();
  @override
  void onDispose(OtpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(OtpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}

Widget otp(onChanged, controller) {
  return Expanded(
      child: Input(
          hintstyle: const TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.w500),
          hintText: "-",
          autofocus: true,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: onChanged,
          controller: controller,
          textAlign: true,
          maxLength: 1));
}
