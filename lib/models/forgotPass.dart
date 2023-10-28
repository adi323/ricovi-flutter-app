class ForgotPass {
  bool? isError;
  String? message;
  Data? data;

  ForgotPass({this.isError, this.message, this.data});

  ForgotPass.fromJson(Map<String, dynamic> json) {
    isError = json['is_error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  Otp? otp;

  Data({this.user, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    otp = json['otp'] != null ? new Otp.fromJson(json['otp']) : null;
  }
}

class User {
  String? sId;
  String? email;

  User({this.sId, this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
  }
}

class Otp {
  int? otp;
  String? expireTime;

  Otp({this.otp, this.expireTime});

  Otp.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    expireTime = json['expireTime'];
  }
}
