import 'package:srikanthkoti/features/login/login_view.desktop.dart';
import 'package:srikanthkoti/features/login/login_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

// @FormView(
//   fields: [
//     FormTextField(
//       name: 'mobileNumber',
//       validator: LoginViewValidators.validateMobileNumber,
//     ),
//     FormTextField(
//       name: 'loginState',
//       validator: LoginViewValidators.validateLoginState,
//     ),
//     FormTextField(
//       name: 'otp',
//       validator: LoginViewValidators.validateOtp,
//     ),
//   ],
// )
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => LoginMobile(),
      desktop: (_) => LoginDesktop(),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    viewModel.initializeForm();
  }
}

class LoginViewValidators {
  static bool _isEmailValid(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool _isMobileNumberValid(String phoneNumber) {
    return RegExp(r"^[+]?[0-9]{10,13}$").hasMatch(phoneNumber);
  }

  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile Number is required';
    }
    if (!_isMobileNumberValid(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? validateLoginState(String? value) {
    return null;
  }

  static String? validateOtp(String? value) {
    return null;
  }
}
