import 'dart:developer';

import 'package:basement_v2/utils/string_constants.dart';
import 'package:http/http.dart' as http;

class BaseHttpClient {
  http.Client client = http.Client();

  Future<http.Response> get(Uri url) async {
    var response = await client.get(url, headers: {
      CONTENT_TYPE: APPLICATION_JSON,
      // ACCESS_TOKEN_KEY: HelperUser.getUserToken()
    });
    log("${response.request}:${response.body}");
    return response;
  }

  Future<http.Response> post(Uri url, var bodyData) async {
    var response = await client.post(url, body: bodyData, headers: {
      CONTENT_TYPE: APPLICATION_JSON,
      // ACCESS_TOKEN_KEY: HelperUser.getUserToken()
    });
    return response;
  }

  Future<http.Response> delete(Uri url, {var bodyData}) async {
    var response = await client.delete(url, body: bodyData, headers: {
      CONTENT_TYPE: APPLICATION_JSON,
      // ACCESS_TOKEN_KEY: HelperUser.getUserToken()
    });
    return response;
  }

  Future<http.Response> put(Uri url, var bodyData) async {
    var response = await client.put(url, body: bodyData, headers: {
      CONTENT_TYPE: APPLICATION_JSON,
      // ACCESS_TOKEN_KEY: HelperUser.getUserToken()
    });
    return response;
  }
}
