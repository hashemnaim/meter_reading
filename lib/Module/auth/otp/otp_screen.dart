import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/Module/auth/otp/controller/otp_controller.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meter_reading/widgets/widget_app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtpController());
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 170.h),
            child: const WidgetAppBar(
              title: "أدخل رمز التحقق",
              subTitle: "تم ارسال كود التحقق لرقم الهاتف 0594***24",
            )),
        body: SizedBox(
            width: Get.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SpaceH36(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: CustomVerificationInput(
                      onChange: (value) {
                        controller.verificationCodeController.value = value;
                      },
                      onSubmitted: (value) {
                        controller.onConfirmClick();
                      },
                    ),
                  ),
                  // const SpaceH120(),
                  // CustomPrimaryButton(
                  //   text: AppString.sendCode.tr,
                  //   onPress: () async {
                  //     // controller.onClick(context);
                  //   },
                  // ),
                  const SpaceH20(),
                ])));
  }
}
