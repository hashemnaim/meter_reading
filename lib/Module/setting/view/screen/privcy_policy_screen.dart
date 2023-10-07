import 'package:meter_reading/Module/setting/controller/setting_controller.dart';
import 'package:meter_reading/core/constants/app_string.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/widgets/widget_appbar_screen.dart';

class PrivcyPolicyScreen extends GetView<SettingController> {
  const PrivcyPolicyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 70),
            child: const WidgetAppBarScreen(
              title: "الشروط والاحكام",
            )),
            
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceH12(),
                    Text(AppTrem.termsAndConditions,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey[500])),
                  ]),
            ),
          ),
        ));
  }
}
