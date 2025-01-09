import 'dart:convert';
import 'dart:developer';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../helper/display_helper.dart';
import 'error_response.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  late String token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    token = '';
    customPrint('Token: $token');

    try {
      // ignore: empty_catches
    } catch (e) {}
    updateHeader(token);
  }

  void updateHeader(String token) {
    Map<String, String> header = {};

    header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
    if (kDebugMode) {
      print('====> API Call:');
    }

    _mainHeaders = header;
  }

  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri');
      }
      http.Response response = await http
          .get(
            Uri.parse(appBaseUrl + uri),
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
      // ignore: empty_catches
    } catch (e) {}
    Response localResponse = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );


    log('====> API Response: [${localResponse.statusCode}] $uri\n${localResponse.body}');

    return localResponse;
  }
}
