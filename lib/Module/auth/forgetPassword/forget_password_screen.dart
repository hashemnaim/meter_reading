import 'package:meter_reading/Module/auth/forgetPassword/controller/forget_password_controller.dart';
import 'package:meter_reading/core/constants/app_constants.dart';
import 'package:meter_reading/core/constants/app_string.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meter_reading/widgets/widget_app_bar.dart';
import '../../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 200.h),
            child: WidgetAppBar(
              title: AppString.forgetPassword,
              subTitle:
                  "الرجاء إدخال رقم الهاتف , لارسال كود التحقق لاستكمال عملية تعيين كلمة المرور",
            )),
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SpaceH20(),
                          CustomInput(
                            controller: controller.mobileController,
                            hint: AppString.mobile,
                            textInputType: TextInputType.phone,
                            icon: ImagePaths.call,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                  errorText: "رقم الجوال إجباري".tr),
                            ]),
                          ),
                          const SpaceH44(),
                          CustomPrimaryButton(
                            text: AppString.sendCode.tr,
                            onPress: () async {
                              controller.onClick(context);
                            },
                          ),
                          const SpaceH20(),
                        ])))));
  }
}
