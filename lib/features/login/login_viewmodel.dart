import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/app/app.router.dart';
import 'package:srikanthkoti/features/login/service/login_service.dart';
import 'package:srikanthkoti/services/shared_preference_service.dart';
import 'package:srikanthkoti/utils/helper.dart';
import 'package:srikanthkoti/utils/result.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'data/user_model.dart';

class LoginViewModel extends FormViewModel {
  final _routerService = locator<RouterService>();
  final _loginService = locator<LoginService>();
  final _storageService = locator<SharedPreferencesService>();

  PhoneNumber? _mobileNumber;
  PhoneNumber? get mobileNumber => _mobileNumber;
  String? _otp;
  String? get otp => _otp;

  String _loginState = "getOtp";
  String get loginState => _loginState;

  void setOtp(String pin) {
    _otp = pin;
    rebuildUi();
  }

  void setMobileNumber(PhoneNumber? val) {
    _mobileNumber = val;
    rebuildUi();
  }

  bool _showValidation = false;
  bool get showValidation => _showValidation;
  String? mobileNumberValidationMessage;
  String? otpValidationMessage;
  void setShowValidation(bool val) {
    _showValidation = val;
    rebuildUi();
  }

  Future<void> onClickGetOtp() async {
    Result isValid = isMobileNumberValid();
    if (isValid.isFailure) {
      _showValidation = true;
      mobileNumberValidationMessage = isValid.error;
      rebuildUi();
      return;
    }
    Result response = await _loginService.sendOtp(
        countryCode: convertStringToInt(mobileNumber?.countryCode),
        mobileNumber: mobileNumber?.number.toString());
    if (response.isSuccess) {
      _loginState = 'validateOtp';
    } else {
      _showValidation = true;
      mobileNumberValidationMessage = response.error;
    }
    rebuildUi();
  }

  Future<void> onClickVerifyOtp() async {
    Result isValid = isOtpValid(_otp);
    if (isValid.isFailure) {
      _showValidation = true;
      otpValidationMessage = isValid.error;
      rebuildUi();
      return;
    }
    Result response = await _loginService.verifyOtp(
        countryCode: convertStringToInt(mobileNumber?.countryCode),
        mobileNumber: mobileNumber?.number.toString(),
        otp: _otp);
    if (response.isSuccess) {
      _storageService.user = User.fromJson(response.value);

      _routerService.clearStackAndShow(MainLayoutViewRoute());
    } else {
      _showValidation = true;
      otpValidationMessage = response.error;
      rebuildUi();
    }
  }

  void initializeForm() {}
  Result isMobileNumberValid() {
    if (_mobileNumber == null) {
      return Result.failure("Mobile number is required");
    }
    if (!_isMobileNumberValid(_mobileNumber?.completeNumber)) {
      return Result.failure("Please enter a valid Mobile number");
    } else {
      return Result.success("Valid Mobile number");
    }
    // return _isMobileNumberValid(mobileNumber?.completeNumber);
  }

  static bool _isMobileNumberValid(String? phoneNumber) {
    return RegExp(r"^[+]?[0-9]{10,13}$").hasMatch(phoneNumber!);
  }

  static Result isOtpValid(String? pin) {
    if (pin == null || pin.toString().length < 4) {
      return Result.failure("Please enter a valid otp");
    }
    return Result.success("Valid Otp");
  }

  String _composeValidationMessageText() {
    String output =
        'Something went wrong, please verify the following errors:\n';

    // if (hasMobileNumberValidationMessage) {
    //   output +=
    //       '\n- EXPIRY value: "$mobileNumberValue". Error: $mobileNumberValidationMessage.';
    // }

    // if (hasOtpValidationMessage) {
    //   output += '\n- Error: $otpValidationMessage.';
    // }

    return output;
  }
}
