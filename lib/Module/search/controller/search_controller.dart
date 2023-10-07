import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/home/controller/home_controller.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/model/user_model.dart';

class SearchScreenController extends GetxController {
  final Rx<TextEditingController> searchTextController =
      TextEditingController().obs;
  RxList<UsersModel> searchSaggestModel = <UsersModel>[].obs;
  RxList<UsersModel> searchHistoryModel = <UsersModel>[].obs;
  Rx<String> selectedSuggestion = ''.obs;
  HomeController homeController = Get.put(HomeController());
  setSaggetstSearch({String search = ""}) async {
    if (search == "") {
      searchSaggestModel.value = [];
    } else {
      List<String> listsearch = search.split(' ');
      searchSaggestModel.value = homeController.userList
          .where((element) =>
              element.customerName!.contains(listsearch.first) &&
              element.customerName!.contains(listsearch.last))
          .toList();
      searchSaggestModel.value = homeController.userList
          .where((element) => element.customerName!.contains(listsearch.last))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    searchHistoryModel.value = SPHelper.sHelper.getListFromSharedPreferences();
  }
}
