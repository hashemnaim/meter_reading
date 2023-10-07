import 'package:get/get.dart';
import 'package:meter_reading/Module/profile_client/profile_user_model.dart';
import 'package:meter_reading/services/profile_clinet_service.dart';

class ProfileClientController extends GetxController {
  //select type  contract in home (residential Contract)
  Rx<int> isSelect = 0.obs;
  Rx<ProfileClinetModel> profileClinetModel = ProfileClinetModel().obs;
  Rx<bool> isLoad = false.obs;

  changeSelect(int value) {
    isSelect.value = value;
    // update(['read']);
  }

  getProfileClinetApi(String id) async {
    isLoad.value = true;
    profileClinetModel.value =
        await ProfileClientService.getProfileClinetApi(id);
    isLoad.value = false;

    // update(['read']);
  }

  @override
  void onInit() async {
    String accountId = Get.arguments["id"];

    await getProfileClinetApi(accountId);
    super.onInit();
  }
}
