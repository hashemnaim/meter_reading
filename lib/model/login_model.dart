import 'package:meter_reading/model/employee_model.dart';

class LoginModel {
  int? code;
  bool? status;
  String? message;
  EmployeeModel? dataEmployee;
  String? accessToken;

  LoginModel(
      {this.code,
      this.status,
      this.message,
      this.dataEmployee,
      this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    dataEmployee =
        json['user'] != null ? EmployeeModel.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (dataEmployee != null) {
      data['user'] = dataEmployee!.toJson();
    }
    data['accessToken'] = accessToken;
    return data;
  }
}
