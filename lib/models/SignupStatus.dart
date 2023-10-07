class SignupStatus {
  bool? isError;
  String? message;
  Data? data;

  SignupStatus({this.isError, this.message, this.data});

  SignupStatus.fromJson(Map<String, dynamic> json) {
    isError = json['is_error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? email;
  Otp? otp;

  Data({this.email, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'] != null ? new Otp.fromJson(json['otp']) : null;
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
