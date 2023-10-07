import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var notificationController = Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSvg(ImagePaths.back),
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvg(
              "home/bell",
              height: 170.h,
              color: LightThemeColors.primaryColor,
              isColor: true,
            ),
            const SpaceH16(),
            Center(
              child: Text("لا يوجد لديك تنبيهات".tr,
                  style: Theme.of(context).textTheme.bodyLarge!),
            ),
          ],
        ));
  }
}
