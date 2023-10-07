import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckInternet {
  Future<bool> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    log(connectivityResult.toString());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      if (Get.context!.mounted) {
        displaySnackBar("لا يوجد اتصال بالانترنت");
        return false;
      }
    } else {
      return true;
    }
    return true;
  }

  displaySnackBar(String massege) {
    var snackBar = SnackBar(content: Text(massege));
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
