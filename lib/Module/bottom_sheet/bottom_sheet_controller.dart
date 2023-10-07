import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  Rx<TextEditingController> accountNo = TextEditingController().obs;
  Rx<TextEditingController> lastReadController =
      TextEditingController(text: "اخر قراءة").obs;
  Rx<TextEditingController> newCollectionTextController =
      TextEditingController().obs;
  Rx<TextEditingController> readTextController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  // HomeController homeController = Get.find();
  Rx<String> readImage = "".obs;
  Rx<bool> clickImage = false.obs;
  // List<ReadModel> readUser = [];
  // Rx<UsersModel> uersModel = UsersModel().obs;

  @override
  void dispose() {
    nameController.value.dispose();
    accountNo.value.dispose();
    newCollectionTextController.value.dispose();
    readTextController.value.dispose();
    nameController.value.dispose();
    readImage.value = "";
    super.dispose();
  }

  // addRead(ReadModel readUser) {
  //   homeController.readUser.add(readUser);
  //   update();
  // }
}
