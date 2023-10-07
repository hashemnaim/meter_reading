import 'dart:convert';

import 'package:meter_reading/model/employee_model.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper sHelper = SPHelper._();
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> initSharedPrefrences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    } else {
      return sharedPreferences!;
    }
  }

  clear() {
    initSharedPrefrences();
    sharedPreferences!.clear();
  }

  bool getThemeIsLight() {
    initSharedPrefrences();
    bool? x = sharedPreferences!.getBool('isLightTheme');
    return x ?? false;
  }

  setThemeIsLight(bool value) async {
    initSharedPrefrences();
    await sharedPreferences!.setBool('isLightTheme', value);
  }

  String getToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('token');
    return x ?? "";
  }

  setToken(String value) async {
    initSharedPrefrences();
    await sharedPreferences!.setString('token', value);
  }

  String getFcmToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('fcmToken');
    return x ?? "";
  }

  setFcmToken(String value) async {
    initSharedPrefrences();
    await sharedPreferences!.setString('fcmToken', value);
  }

  String getLanguge() {
    initSharedPrefrences();

    String? x = sharedPreferences!.getString("Lang");
    return x ?? "ar";
  }

  Future<void> setLanguge(String lang) {
    return sharedPreferences!.setString("Lang", lang);
  }

  saveProfileSharedPreferences(EmployeeModel myList) async {
    initSharedPrefrences();

    final String jsonList = jsonEncode(myList.toJson());

    await sharedPreferences!.setString('profile', jsonList);
  }

  EmployeeModel getProfileSharedPreferences() {
    initSharedPrefrences();
    final String jsonList = sharedPreferences!.getString('profile') ?? "";

    final EmployeeModel myList = EmployeeModel.fromJson(jsonDecode(jsonList));

    return myList;
  }

  saveListToSharedPreferences(List<UsersModel> myList) async {
    initSharedPrefrences();

    final List<String> jsonList =
        myList.map((model) => jsonEncode(model.toJson())).toList();

    await sharedPreferences!.setStringList('searchHistory', jsonList);
  }

  List<UsersModel> getListFromSharedPreferences() {
    initSharedPrefrences();
    final List<String> jsonList =
        sharedPreferences!.getStringList('searchHistory') ?? [];

    final List<UsersModel> myList =
        jsonList.map((json) => UsersModel.fromJson(jsonDecode(json))).toList();

    return myList;
  }
}
