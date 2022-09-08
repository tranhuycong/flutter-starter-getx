import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../global/environment.dart';
import 'api_exceptions.dart';

class HttpClient {
  HttpClient._privateConstructor();

  static final HttpClient _singleton = HttpClient._privateConstructor();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    dynamic responseJson;

    String uri = Environment.apiUrl + url + ((params != null) ? queryParameters(params) : "");
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(Uri.parse(uri), headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    final jsonString = Uri(queryParameters: params);
    return '?${jsonString.query}';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    dynamic responseJson;
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.post(Uri.parse(Environment.apiUrl + url), body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
