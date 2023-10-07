import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/core/helper/loading.dart';
import 'package:meter_reading/data/data_base.dart';
import 'package:meter_reading/model/areas_model.dart';
import 'package:meter_reading/model/read_model.dart';
import 'package:meter_reading/model/user_model.dart';
import 'package:meter_reading/services/home_service.dart';

class HomeController extends GetxController {
  int isSelect = 0;
  int isSelectAreas = 1;
  Rx<int> index = 0.obs;
  bool isLoad = false;
  bool isLoadAreas = false;
  bool isLoadDownload = false;
  ReadsModel readUser = ReadsModel();
  List<UsersModel> userList = <UsersModel>[];
  List<UsersModel> userAreasList = <UsersModel>[];
  List<Areas> areasList = <Areas>[];
  SqlDbHelper sqlDbHelper = SqlDbHelper();
  RxList<UsersModel> searchCollectionModel = <UsersModel>[].obs;
  RxList<UsersModel> searchHistoryModel = <UsersModel>[].obs;
  final Rx<TextEditingController> searchTextController =
      TextEditingController().obs;
  getReadAreasDB() async {
    isLoadAreas = true;
    areasList = await HomeService.getAreasDB();
    update(['read']);
  }

  getReadDB() async {
    isLoad = true;
    userList = await HomeService.getReadDB();
    changeListUser(isSelectAreas);
    isLoad = false;
    update(['read']);
  }

  changeListUser(int isSelectAreas) {
    userAreasList = userList
        .where((element) => element.areaCode == isSelectAreas.toString())
        .toList();
    update(['read']);
  }

  changeSelect(int value) {
    isSelect = value;
    update(['read']);
  }

  changeSelectAreas(int value) {
    isSelectAreas = value;
    update(['read']);
  }

  insertUser() async {
    for (Areas element in readUser.areas!) {
      await HomeService.insertAreas(element);
    }

    for (AreaUserList element in readUser.data!) {
      for (UsersModel element in element.accounts!) {
        await HomeService.insertUserData(element);
        index.value++;
      }
    }
    update(['read']);
  }

  getListUser() async {
    // await SqlDbHelper.deleteDataBase();
    if (userList.isEmpty) {
      showOrHideLoading(false, "يتم الان الحصول على المعلومات");
      readUser = await HomeService.getReadUserApi();
      showOrHideLoading(true, "");
      await insertUser();
      await getReadAreasDB();
      await getReadDB();
      update(['read']);
      Get.back();
    }
  }

  Rx<String> selectedSuggestion = ''.obs;
  setSaggetstSearch({String search = ""}) async {
    if (search == "") {
      searchCollectionModel.value = [];
    } else {
      List<String> listsearch = search.split(' ');
      searchCollectionModel.value = userList
          .where((element) =>
              element.customerName!.contains(listsearch.first) &&
              element.customerName!.contains(listsearch.last))
          .toList();
      searchCollectionModel.value = userList
          .where((element) => element.customerName!.contains(listsearch.last))
          .toList();
    }
  }

  @override
  void onInit() async {
    await getReadAreasDB();
    await getReadDB();
    // await getReadUser();
    // await getCollectionUser();
    super.onInit();
  }
}
