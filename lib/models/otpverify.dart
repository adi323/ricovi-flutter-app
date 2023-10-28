class otpverify {
  bool? isError;
  String? message;
  Data? data;

  otpverify({this.isError, this.message, this.data});

  otpverify.fromJson(Map<String, dynamic> json) {
    isError = json['is_error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? email;
  String? role;
  String? token;

  Data({this.email, this.role, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }
}
