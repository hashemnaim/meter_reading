import 'dart:developer';

import 'package:get/get.dart';
import 'package:meter_reading/model/collcetion_user_model.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:meter_reading/services/history_service.dart';
import 'package:meter_reading/services/home_service.dart';

class HistoryController extends GetxController {
  List<UsersModel> historyReadsist = <UsersModel>[];
  bool isLoad = false;
  int isSelectHistorey = 0;
  changeSelectHistory(int value) async {
    isSelectHistorey = value;
    if (isSelectHistorey == 2) {
      await getCollectionUser();
    }
    update(['read']);
  }

  List<CollcetionUserModel> collectionUser = <CollcetionUserModel>[];

  getCollectionUser() async {
    isLoad = true;
    // List<CollcetionUserModel> listreadUser =
    //     await HomeService.getCollcetionUser();
    // for (CollcetionUserModel element in listreadUser) {
    //   element.usersModel = userList
    //       .firstWhere((user) => user.accountId.toString() == element.accountNo);
    // }
    collectionUser = await HomeService.getCollcetionUser();
    log(collectionUser.toString());
    isLoad = false;
    update(['read']);
  }

  getHistoryReads() async {
    isLoad = true;
    historyReadsist = await HistoryService.getHistoryReadData();
    isLoad = false;
    update(['read']);
  }
}
