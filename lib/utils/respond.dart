import 'dart:convert';

import 'package:basement_v2/utils/result.dart';
import 'package:http/http.dart';

Result respond(Response response) {
  if (response.statusCode == 200) {
    if (jsonDecode(response.body)['status'] == true) {
      if (json.decode(response.body)["entity"] != null) {
        return Result.success(json.decode(response.body)["entity"]);
      } else {
        return Result.failure("Something went wrong");
      }
    } else if (json.decode(response.body)["errorType"] == "validation") {
      List errors = json.decode(response.body)["message"];
      return Result.failure(errors.join(','));
    } else if (json.decode(response.body)["errorType"] == "api") {
      return Result.failure(json.decode(response.body)["message"]);
    } else {
      return Result.failure("Something went wrong");
    }
  } else {
    return Result.failure("Something went wrong");
  }
}
