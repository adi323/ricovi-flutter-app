import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:ricovi/helpers/utility.dart';
import 'package:ricovi/models/respModel.dart';
enum Request { get, post, put, patch, delete }

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {
  final String _baseUrl = 'http://13.126.91.30:8003/api/user/';
  final String _baseUrlHttps = 'https://c837-202-142-70-233.ngrok-free.app/api/user/';

  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://13.126.91.30:8003/api/user/',
      connectTimeout:  Duration(milliseconds: 100000),
      sendTimeout:  Duration(milliseconds: 10000),
      receiveTimeout:  Duration(milliseconds: 100000),
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
      },
      responseType: ResponseType.plain,
    ),
  );

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(String url, Request request, var data,
      bool isLoading, Map<String, String>? headers,
      [bool httpFlags = false]) async {
    /// To see whether the network is available or not
    if (await Utility.isNetworkAvailable()) {
      switch (request) {

        /// Method to make the Get type request
        case Request.get:
          {
            var uri = httpFlags ? _baseUrlHttps + url : _baseUrl + url;
            if (isLoading) Utility.showLoader();
            try {
              final response = await http
                  .get(
                    Uri.parse(uri),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 60));
              Utility.closeDialog();
              Utility.printILog(uri);
              return _returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.post:

          /// Method to make the Post type request
          {
            var uri = httpFlags ? _baseUrlHttps + url : _baseUrl + url;
            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .post(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 60));
              Utility.closeDialog();
              Utility.printILog(uri);
              return _returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.put:

          /// Method to make the Put type request
          {
            var uri = httpFlags ? _baseUrlHttps + url : _baseUrl + url;
            try {
              if (isLoading) Utility.showLoader();

              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 60));
              Utility.closeDialog();
              Utility.printILog(uri);
              return _returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.patch:

          /// Method to make the Patch type request
          {
            var uri = httpFlags ? _baseUrlHttps + url : _baseUrl + url;
            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .patch(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 60));
              Utility.closeDialog();
              Utility.printILog(uri);
              return _returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}',
                  hasError: true,
                  errorCode: 1000);
            }
          }
        case Request.delete:

          /// Method to make the Delete type request
          {
            var uri = httpFlags ? _baseUrlHttps + url : _baseUrl + url;
            try {
              if (isLoading) Utility.showLoader();

              final response = await http
                  .delete(
                    Uri.parse(uri),
                    body: data,
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 60));
              Utility.closeDialog();
              Utility.printILog(uri);
              Utility.printLog(response.body);
              return _returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
      }
    }

    /// If there is no network available then instead of print can show the no internet widget too
    else {
      return ResponseModel(
        data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
        hasError: true,
        errorCode: 1000,
      );
    }
  }

  /// Method to return the API response based upon the status code of the server
  ResponseModel _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return ResponseModel(
            data: response.body,
            hasError: false,
            errorCode: response.statusCode);
      case 400:
      case 401:
      case 406:
      case 409:
      case 500:
      case 522:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);

      default:
        return ResponseModel(data: response.body, hasError: true, errorCode: 0);
    }
  }
}