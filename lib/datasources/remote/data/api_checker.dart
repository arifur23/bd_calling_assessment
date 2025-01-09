

import 'package:get/get_connect/http/src/response/response.dart';

import '../../../helper/display_helper.dart';
import 'error_response.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
    } else if (response.statusCode == 403) {
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
        showCustomSnackBar(errorResponse.errors![0].message!);
      } else {
        showCustomSnackBar(response.body['message']);
      }
    } else if (response.statusCode == 422) {
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
        showCustomSnackBar(errorResponse.errors![0].message!);
      } else {
        showCustomSnackBar(response.body['message']);
      }
    } else if (response.statusCode == 500) {
      showCustomSnackBar(response.statusText!);
    } else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
