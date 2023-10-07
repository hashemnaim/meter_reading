import 'dart:developer';
import 'package:meter_reading/Module/profile_client/profile_user_model.dart';
import 'package:meter_reading/core/helper/dio_helper.dart';

class ProfileClientService {
  static Future<ProfileClinetModel> getProfileClinetApi(String id) async {
    log("=====>$id");

    var response = await DioHelper.getData("get_account/$id");
    log("=====>${response.data.toString()}");
    return ProfileClinetModel.fromJson(response.data);
  }
}
