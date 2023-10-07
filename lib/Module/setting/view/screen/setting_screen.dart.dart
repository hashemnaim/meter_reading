import 'package:flutter/cupertino.dart';
import 'package:meter_reading/Module/setting/controller/setting_controller.dart';
import 'package:meter_reading/Module/setting/view/screen/about_screen.dart';
import 'package:meter_reading/Module/setting/view/screen/privcy_policy_screen.dart';
import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_button.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/widgets/widget_appbar_screen.dart';
import '../widget/widget_card_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: const Color(0xeff9f9f9),
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 70),
          child: const WidgetAppBarScreen(title: "الاعدادات", isHome: true)),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "الحساب",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(),
            WidgetCardSetting(
              text: "الحساب الشخصي",
              image: ImagePaths.userCircle,
              // onTap: () => Get.to(() => const PrivcyPolicyScreen()),
            ),
            WidgetCardSetting(
              text: "كلمة المرور",
              image: ImagePaths.lock,
              onTap: () => Get.to(() => const PrivcyPolicyScreen()),
            ),
            Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                shadowColor: Colors.grey[200],
                child: ListTile(
                    contentPadding: const EdgeInsets.only(right: 8),
                    minLeadingWidth: 20,
                    leading: const CustomSvg(ImagePaths.bell),
                    title: Text(
                      "الإشعارات",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: const Color(0xff5F5F5F)),
                    ),
                    trailing: Obx(() => CupertinoSwitch(
                          value: controller.isNotifcationChanged.value,
                          onChanged: (value) {
                            controller.isNotifcationChanged.value = value;
                          },
                          thumbColor: LightThemeColors.white,
                          activeColor: LightThemeColors.primaryColor,
                        )))),
            const SpaceH8(),
            Text("الاعدادات", style: Theme.of(context).textTheme.bodyMedium),
            WidgetCardSetting(
              text: "تواصل معنا",
              image: ImagePaths.conactctUs,
              onTap: () => Get.to(() => const PrivcyPolicyScreen()),
            ),
            WidgetCardSetting(
              text: "عن بلدية بيت حانون",
              image: ImagePaths.alertCircle,
              onTap: () => Get.to(() => const AboutScreen()),
            ),
            WidgetCardSetting(
              text: "الشروط والاحكام",
              image: ImagePaths.shield,
              onTap: () => Get.to(() => const PrivcyPolicyScreen()),
            ),
            const SpaceH20(),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextButton(
                  text: "تسجيل الخروج",
                  onPress: () async {
                    SPHelper.sHelper.clear();
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  isOutlined: true,
                  color: Colors.red,
                ),
              ),
            ),
            const SpaceH48(),
          ]),
        ),
      ),
    );
  }
}
