import 'package:flutter/services.dart';
import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/app_constants.dart';
import 'package:meter_reading/core/constants/app_string.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/Module/auth/login/controller/login_controller.dart';
import 'package:meter_reading/widgets/custom_input.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 0),
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: LightThemeColors.white,
                statusBarIconBrightness: Brightness.dark),
          ),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Form(
                  key: loginController.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SpaceH44(),
                        CustomAssetsImage(ImagePaths.logo,
                            height: 142.h, width: 142.w),
                        const SpaceH16(),
                        Text(AppString.login.tr,
                            style: Theme.of(context).textTheme.titleLarge!),
                        const SpaceH8(),
                        Text(AppString.welcame.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: LightThemeColors.titleTextColor
                                        .withOpacity(0.4))),
                        const SpaceH36(),
                        CustomInput(
                          controller: loginController.mobileController,
                          hint: AppString.mobile,
                          textInputType: TextInputType.number,
                          icon: ImagePaths.call,
                          formValidator: MultiValidator([
                            RequiredValidator(
                              errorText: "رقم الجوال إجباري",
                            ),
                          ]),
                        ),
                        const SpaceH20(),
                        CustomInput(
                            controller: loginController.passwordController,
                            hint: AppString.password,
                            textInputType: TextInputType.visiblePassword,
                            isObscure: true,
                            icon: ImagePaths.password,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                errorText: "كلمة المرور إجباري",
                              ),
                            ])),
                        const SpaceH16(),
                        GestureDetector(
                          onTap: () =>
                              Get.toNamed(AppRoutes.forgetPasswordScreen),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppString.forgetPassword.tr,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ),
                        const SpaceH36(),
                        CustomPrimaryButton(
                          text: AppString.login.tr,
                          onPress: () async {
                            loginController.onLoginClick(context);
                          },
                        ),
                        const SpaceH20(),
                      ]))),
        ));
  }
}
