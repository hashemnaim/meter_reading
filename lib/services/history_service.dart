import 'dart:developer';
import 'package:meter_reading/data/data_base.dart';

import 'package:meter_reading/model/user_model.dart';

class HistoryService {
  static Future<List<UsersModel>> getHistoryReadData() async {
    List<Map<String, dynamic>> response = await SqlDbHelper.readData(
        "SELECT * FROM ${SqlDbHelper.historyReadTable}");
    return response.map((e) => UsersModel.fromJson(e)).toList();
  }

  static Future<dynamic> updateHistoryRead(
      String read, String image, String accountNo) async {
    dynamic response = await SqlDbHelper.updateData(
        '''UPDATE ${SqlDbHelper.historyReadTable} SET ${SqlDbHelper.lastRead}="$read" , ${SqlDbHelper.imageRead}="$image" WHERE ${SqlDbHelper.accountNo} = $accountNo''');
    log(response.toString());
    return response;
  }

  static Future<dynamic> removeHistoryRead(String accountNo) async {
    dynamic response = await SqlDbHelper.deleteData(
        "DELETE FROM ${SqlDbHelper.historyReadTable} WHERE ${SqlDbHelper.accountNo}= $accountNo");
    log(response.toString());
    return response;
  }
}
