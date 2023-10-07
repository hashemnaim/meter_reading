import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/profile_client/profile_user_model.dart';
import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    super.key,
    required this.title,
    this.actions = false,
    this.isHome = false,
    required this.usersModel,
  });
  final String title;
  final bool actions, isHome;
  final DataProfileClinet usersModel;
  Row textIcon(
      {required String icon,
      required String text,
      Color colorText = Colors.black,
      double fontSize = 14}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              color: LightThemeColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomSvg(
              icon,
            ),
          ),
        ),
        const SpaceW8(),
        Expanded(
          child: Text(text,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: fontSize, color: colorText)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GestureDetector(
            onTap: () {
              isHome == true
                  ? Get.offAllNamed(AppRoutes.navigationTabScreen)
                  : Get.back();
            },
            child: Container(
              height: 36,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFFFFF)),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: CustomSvg(
                  ImagePaths.back,
                ),
              ),
            )),
      ),
      centerTitle: true,
      title: Text(
        title,
        // style: Theme.of(context)
        //     .textTheme
        //     .titleLarge!
        //     .copyWith(color: Colors.white, fontSize: 18),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          children: [
            Container(
              width: 327.w,
              height: 135.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 2),
                        spreadRadius: 0,
                        blurRadius: 12,
                        color: const Color(0xff111827).withOpacity(0.2))
                  ],
                  color: LightThemeColors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceH8(),
                  SizedBox(
                    width: 320.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: textIcon(
                          icon: ImagePaths.user,
                          text: usersModel.customerName!,
                          fontSize: 16),
                    ),
                  ),
                  const SpaceH12(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: CustomSvg(
                                  ImagePaths.newspaper,
                                )),
                            Column(
                              children: [
                                Text("رقم التعريفة",
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 14, color: Colors.grey)),
                                Text(usersModel.tarefa.toString(),
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: CustomSvg(
                                  ImagePaths.fileLineChart,
                                )),
                            Column(
                              children: [
                                Text("رقم الاشتراك",
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 14, color: Colors.grey)),
                                Text(usersModel.accountId.toString(),
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SpaceH12(),
            Container(
              width: 327,
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 2),
                        spreadRadius: 0,
                        blurRadius: 12,
                        color: const Color(0xff111827).withOpacity(0.2))
                  ],
                  color: LightThemeColors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceH12(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            Text("الرصيد",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.grey)),
                            Text("2434",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Column(
                          children: [
                            Text("الإجمالي",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.grey)),
                            Text("2434",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Column(
                          children: [
                            Text("المدفوعات",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.grey)),
                            Text("343554",
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SpaceH12(),
          ],
        ),
      ),
      actions: [
        actions == true
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffFFFFFF)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CustomSvg(
                          ImagePaths.filter,
                        ),
                      ),
                    )),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
