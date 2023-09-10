import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/login/components/login_bg_img.dart';
import 'package:srikanthkoti/features/login/components/login_form.dart';
import 'package:srikanthkoti/features/login/login_viewmodel.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginMobile extends ViewModelWidget<LoginViewModel> {
  // final TextEditingController mobileNumberController;
  // final TextEditingController otpController;
  const LoginMobile({
    super.key,
    // required this.mobileNumberController,
    // required this.otpController
  });

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: (screenHeight * 0.55).h,
            child: const LoginBgImg(),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginForm(
                  // mobileNumberController: mobileNumberController,
                  // otpController: otpController,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
