class LoginStatus {
  bool? isError;
  String? message;
  Data? data;

  LoginStatus({this.isError, this.message, this.data});

  LoginStatus.fromJson(Map<String, dynamic> json) {
    isError = json['is_error'] ?? false;
    if(!json['is_error']){
      message = json['message'] ?? "";
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    }
  }
}
class Data {
  String? phone;
  String? email;
  String? name;
  String? role;
  String? token;

  Data({this.phone, this.email, this.name, this.role, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    name = json['name'] ?? "";
    role = json['role'] ?? "";
    token = json['token'] ?? "";
  }


}
