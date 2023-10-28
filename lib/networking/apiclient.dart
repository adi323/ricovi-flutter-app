import 'dart:async';
import 'dart:core';
import 'package:ricovi/networking/api_wrapper.dart';
import 'package:ricovi/models/respModel.dart';

class ApiClient {
  ApiWrapper apiWrapper = ApiWrapper();

  Future<ResponseModel> login(
      {required String email,
      required String password}) async {
    var data = {'email': '$email', 'password': '$password'};
    var response = await apiWrapper.makeRequest('login', Request.post, data,
        false, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> signup(
      {required String email,
      required String password}) async {
    var data = {'email': '$email', 'password': '$password'};
    var response = await apiWrapper.makeRequest('signup', Request.post, data,
        false, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> forgotpassword(
      {required String email}) async {
    var data = {'email': '$email'};
    var response = await apiWrapper.makeRequest('forgot-password', Request.post, data,
        false, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> resetpassword(
      {required String token,required String password}) async {
    var data = {'password':'$password'};
    var response = await apiWrapper.makeRequest('reset-password', Request.post, data,
        false, {'Content-Type': 'application/json',"Authorization":'Bearer ${token}'});
    return response;
  }

  Future<ResponseModel> otpVerify(
      {required String email,required int OTP,required String mode}) async {
    var data = {'email': '$email','mode':'$mode','otp':'$OTP'};
    var response = await apiWrapper.makeRequest('otp-verify', Request.post, data,
        false, {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseModel> updateUser(
      {required String countryCode,required int phone,required String name,required String token}) async {
    var data = {'countryCode': '$countryCode','phone': phone,'name': '$name'};
    var response = await apiWrapper.makeRequest('', Request.put, data,
        false, {'Content-Type': 'application/json',"Authorization":'Bearer ${token}'});
    return response;
  }

  Future<ResponseModel> changePassword(
      {required String currPassword,required String newPassword,required String token}) async {
    var data = {'currentPassword': '$currPassword','newPassword': '$newPassword'};
    var response = await apiWrapper.makeRequest('change-password', Request.post, data,
        false, {'Content-Type': 'application/json',"Authorization":'Bearer ${token}'});
    return response;
  }

  Future<ResponseModel> resendOTP(
      {required String email,required String mode}) async {
    var data = {'email': '$email','mode':'$mode'};
    print(data);
    var response = await apiWrapper.makeRequest('resend-otp', Request.post, data,
        false, {'Content-Type': 'application/json'});
    return response;
  }
}
