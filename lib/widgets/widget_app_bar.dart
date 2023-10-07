import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    super.key,
    required this.title,
    this.subTitle = "",
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leadingWidth: 60.w,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
        child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 42.h,
              width: 42.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFFFFF)),
              child: const Padding(
                padding: EdgeInsets.all(11.0),
                child: CustomSvg(
                  ImagePaths.back,
                ),
              ),
            )),
      ),
      bottom: PreferredSize(
          preferredSize: Size(Get.width, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12)
              ],
            ),
          )),
    );
  }
}
