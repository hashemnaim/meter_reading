import 'package:meter_reading/model/login_model.dart';

import '../core/helper/dio_helper.dart';

class AuthService {
  static Future<dynamic> deleteAccont() async {
    var response = await DioHelper.postData("account/delete");
    return response;
  }

  static Future<LoginModel> loginUser(Map<String, dynamic> data) async {
    var response = await DioHelper.postData("login", data: data);
    LoginModel employeeModel = LoginModel.fromJson(response.data);
    return employeeModel;
  }
}
