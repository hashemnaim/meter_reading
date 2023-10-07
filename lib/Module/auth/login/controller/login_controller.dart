import 'dart:developer';

import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/helper/dio_helper.dart';
import 'package:meter_reading/core/helper/loading.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/core/utils/toast.dart';
import 'package:meter_reading/model/employee_model.dart';
import 'package:meter_reading/model/login_model.dart';
import 'package:meter_reading/services/auth_service.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLoginClick(context) async {
    if (formKey.currentState!.validate()) {
      // String fcm = SPHelper.sHelper.getFcmToken();
      var data = {
        "mobile": mobileController.value.text,
        "password": passwordController.value.text,
        "fcm_token": "fcm"
      };
      showOrHideLoading(false, "GETTING_INFO".tr);

      LoginModel response = await AuthService.loginUser(data);

      showOrHideLoading(true, "GETTING_INFO".tr);
      if (response.status == true) {
        await SPHelper.sHelper
            .saveProfileSharedPreferences(response.dataEmployee!);

        await SPHelper.sHelper.setToken(response.accessToken!);
        await DioHelper.init();
        Get.offAllNamed(AppRoutes.navigationTabScreen);
        showToast("Ok".tr, response.message!.tr, ToastType.SUCCESS);
      } else {
        showOrHideLoading(true, "GETTING_INFO".tr);

        if (response.message == 'Your account is inactive!') {
        } else {
          showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
        }
      }
    }
  }

  accountInactiveAlert(context, int userId) async {
    await NDialog(
      title: Text(
        "ACCOUNT_DISABLED".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "YOUR_ACCOUNT_IS_DISABLED_YOU_CAN_ACTIVATE_YOUR_ACCOUNT".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomTextButton(
                text: "BACK".tr,
                color: LightThemeColors.primaryColor,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SpaceW12(),
            Expanded(
              child: CustomTextButton(
                text: "CONTACT".tr,
                color: LightThemeColors.primaryColor,
                onPress: () async {
                  Navigator.pop(context);
                  await Get.toNamed('/contact-us', arguments: {
                    "userId": userId,
                  });
                  // activateAccount();
                },
              ),
            ),
          ],
        ),
      ],
    ).show(context);
  }

  activateAccount() async {
    showOrHideLoading(false, "ACTIVATING_ACCOUNT");
    // var response = await AuthService.activeInactiveUser(data);

    // print(response.message);
    // showOrHideLoading(true, "ACTIVATING_ACCOUNT".tr);
    // if (response.status == 'success') {
    //   showToast("ACCOUNT_ACTIVATED".tr,
    //       "NOW_YOU_CAN_LOGIN_WITH_YOUR_ACCOUNT".tr, ToastType.SUCCESS);
    // } else {
    //   showToast("ERROR".tr, "SOMETHING_WENTS_WRONG_TRY_AGAIN_LATER".tr,
    //       ToastType.DANGER);
    // }
  }

  loginAsGuest() {
    // StorageService.writeIsGuest(true);
    showToast("WELCOME_BACK".tr, "WELCOME_TO_VASA_APP".tr, ToastType.SUCCESS);
    Get.deleteAll();
    Get.offAndToNamed('/');
  }
}
