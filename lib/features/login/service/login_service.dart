import 'dart:convert';

import 'package:srikanthkoti/app/app.locator.dart';
import 'package:srikanthkoti/utils/http_client.dart';
import 'package:srikanthkoti/utils/result.dart';
import 'package:srikanthkoti/utils/url_constants.dart';

import '../../../app/app.logger.dart';
import '../../../utils/respond.dart';

class LoginService {
  final _client = locator<BaseHttpClient>();
  final _log = getLogger('LoginService');

  Future<Result<dynamic, dynamic>> sendOtp(
      {required int countryCode, required String? mobileNumber}) async {
    _log.i(
      'sendOtp: countryCode:$countryCode mobileNumber:$mobileNumber',
    );
    final payLoad = {"countryCode": countryCode, "mobileNumber": mobileNumber};
    final response =
        await _client.post(Uri.parse(sendUserOtp), json.encode(payLoad));
    return respond(response);
  }

  Future<Result<dynamic, dynamic>> verifyOtp(
      {required int countryCode,
      required String? mobileNumber,
      required String? otp}) async {
    _log.i(
      'verifyOtp: otp: $otp countryCode:$countryCode mobileNumber:$mobileNumber',
    );
    final payLoad = {
      "countryCode": countryCode,
      "mobileNumber": mobileNumber,
      "otp": otp
    };
    final response =
        await _client.post(Uri.parse(verifyUserOtp), json.encode(payLoad));
    return respond(response);
  }
}
