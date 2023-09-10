import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srikanthkoti/features/login/components/login_bg_img.dart';
import 'package:srikanthkoti/features/login/components/login_form.dart';
import 'package:srikanthkoti/features/login/login_viewmodel.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginDesktop extends ViewModelWidget<LoginViewModel> {
  // final TextEditingController mobileNumberController;
  // final TextEditingController otpController;

  const LoginDesktop({
    super.key,
    // required this.mobileNumberController,
    // required this.otpController
  });

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: (screenWidth * 0.55).w,
            child: const LoginBgImg(),
          ),
          Padding(
            padding: EdgeInsets.only(left: (screenWidth * 0.05).w),
            child: LoginForm(
                // mobileNumberController: mobileNumberController,
                // otpController: otpController,
                ),
          )
        ],
      ),
    );
  }
}
