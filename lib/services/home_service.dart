import 'dart:developer';
import 'package:meter_reading/core/helper/dio_helper.dart';
import 'package:meter_reading/data/data_base.dart';
import 'package:meter_reading/model/areas_model.dart';
import 'package:meter_reading/model/collcetion_user_model.dart';
import 'package:meter_reading/model/read_model.dart';
import 'package:meter_reading/model/user_model.dart';

class HomeService {
  static Future<ReadsModel> getReadUserApi() async {
    var response = await DioHelper.getData("get_accounts");
    log(response.data.toString());
    try {
      return ReadsModel.fromJson(response.data);
    } catch (e) {
      return ReadsModel();
    }
  }

  static Future<List<UsersModel>> getReadDB() async {
    List<Map<String, dynamic>> response =
        await SqlDbHelper.readData("SELECT * FROM ${SqlDbHelper.userTable}");
    return response.map((e) => UsersModel.fromJson(e)).toList();
  }

  static Future<List<Areas>> getAreasDB() async {
    List<Map<String, dynamic>> response =
        await SqlDbHelper.readData("SELECT * FROM ${SqlDbHelper.areaTable}");
    return response.map((e) => Areas.fromJson(e)).toList();
  }

  static insertAreas(Areas areas) async {
    await SqlDbHelper.insertData(
        "INSERT INTO ${SqlDbHelper.areaTable} ('${SqlDbHelper.id}','${SqlDbHelper.nameAreas}','${SqlDbHelper.number}') VALUES ('${areas.id!}','${areas.name!}','${areas.number!}')");
  }

  static insertUserData(UsersModel value) async {
    await SqlDbHelper.insertData(
        "INSERT INTO ${SqlDbHelper.userTable} ('${SqlDbHelper.accountNo}','${SqlDbHelper.machenNo}','${SqlDbHelper.lastRead}','${SqlDbHelper.customerName}','${SqlDbHelper.areaCode}') VALUES ('${value.accountId.toString()}','${value.machineId.toString()}','${value.lastRead.toString()}','${value.customerName.toString()}','${value.areaCode.toString()}')");
  }

  static inserHistoryRead(UsersModel value, String read, String image) async {
    await SqlDbHelper.insertData(
        "INSERT INTO ${SqlDbHelper.historyReadTable} ('${SqlDbHelper.accountNo}','${SqlDbHelper.machenNo}','${SqlDbHelper.lastRead}','${SqlDbHelper.customerName}','${SqlDbHelper.areaCode}','${SqlDbHelper.imageRead}') VALUES ('${value.accountId!}','${value.machineId!}','$read','${value.customerName!}','${value.areaCode!}','$image')");
  }

  static Future<List<UsersModel>> getUserData() async {
    List<Map<String, dynamic>> response =
        await SqlDbHelper.readData("SELECT * FROM ${SqlDbHelper.userTable}");
    return response.map((e) => UsersModel.fromJson(e)).toList();
  }

  static Future<dynamic> removeUserData(String accountNo) async {
    dynamic response = await SqlDbHelper.deleteData(
        "DELETE FROM ${SqlDbHelper.userTable} WHERE ${SqlDbHelper.accountNo}= $accountNo");
    return response;
  }
  // static insertAreaUserList(AreaUserList value) async {
  //   String accounts = jsonEncode(value.accounts!);
  //   log(accounts);
  //   await SqlDbHelper.insertData(
  //       "INSERT INTO ${SqlDbHelper.areaUserListTable} ('${SqlDbHelper.id}','${SqlDbHelper.nameAreas}','${SqlDbHelper.areaCode}','${SqlDbHelper.accounts}') VALUES ('${value.id!}','${value.name.toString()}','$accounts')");
  // }

  static insertCollcetionUser(CollcetionUserModel value) async {
    await SqlDbHelper.insertData(
        "INSERT INTO ${SqlDbHelper.collcetionUser} ('${SqlDbHelper.customerName}','${SqlDbHelper.collcetion}','${SqlDbHelper.dateTime}','${SqlDbHelper.accountNo}') VALUES ('${value.customerName!}','${value.price!}','${value.dateTime!}','${value.accountNo!}')");
  }

  static Future<List<CollcetionUserModel>> getCollcetionUser() async {
    List<Map<String, dynamic>> response = await SqlDbHelper.readData(
        "SELECT * FROM ${SqlDbHelper.collcetionUser}");
    return response.map((e) => CollcetionUserModel.fromJson(e)).toList();
  }
}
