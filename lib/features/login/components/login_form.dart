import 'package:srikanthkoti/ui/atoms/custom_text_field.dart';
import 'package:srikanthkoti/features/login/login_viewmodel.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

class LoginForm extends ViewModelWidget<LoginViewModel> {
  const LoginForm({
    super.key,
    this.mobileNumberController,
    this.otpController,
  });
  final TextEditingController? mobileNumberController;
  final TextEditingController? otpController;
  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 32.ssp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          width: 300.w,
          child: IntlPhoneField(
            controller: mobileNumberController,
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              viewModel.setShowValidation(false);
              viewModel.setMobileNumber(phone);
            },
            // validator: (PhoneNumber? phone) {
            //   if (viewModel.showValidationMessage &&
            //       viewModel.mobileNumberValidationMessage != null) {
            //     return viewModel.mobileNumberValidationMessage;
            //   }
            //   return "";
            // },
            showCountryFlag: false,
            enabled: viewModel.loginState == 'getOtp',
            disableLengthCheck: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autovalidateMode: AutovalidateMode.disabled,
          ),
        ),
        if (viewModel.showValidation &&
            viewModel.mobileNumberValidationMessage != null) ...[
          Text(
            viewModel.mobileNumberValidationMessage!,
            style: const TextStyle(color: Colors.red),
          )
        ],
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          width: 300.w,
          child: Pinput(
            enabled: viewModel.loginState == 'validateOtp',
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.disabled,
            showCursor: true,
            onCompleted: (pin) => {viewModel.setOtp(pin)},
          ),
        ),
        if (viewModel.showValidation &&
            viewModel.otpValidationMessage != null) ...[
          Text(
            viewModel.otpValidationMessage!,
            style: const TextStyle(color: Colors.red),
          )
        ],
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 300.w,
              height: 40.h,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: viewModel.loginState == 'getOtp'
                    ? viewModel.onClickGetOtp
                    : viewModel.onClickVerifyOtp,
                child: Text(
                  viewModel.loginState == 'getOtp' ? 'Get otp' : 'Verify',
                  style: TextStyle(fontSize: 18.ssp),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            // Text(
            //   'Not a user!! Sign Up',
            //   style: TextStyle(fontSize: 14.ssp, fontWeight: FontWeight.w500),
            // )
          ],
        )
      ],
    );
  }
}
