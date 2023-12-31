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
  
  Data({this.email});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    
  }
}

