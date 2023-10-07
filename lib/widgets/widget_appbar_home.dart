import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/widgets/custom_svg.dart';

class WidgetAppBarHome extends StatelessWidget {
  const WidgetAppBarHome({
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

        bottom: PreferredSize(
      preferredSize: Size(Get.width, 10),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ), // const Padding(
          //   padding: EdgeInsets.only(right: 8, left: 8),
          //   child: CustomAssetsImage(
          //     "assets/images/profile-pic.png",
          //     width: 55,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                width: 310,
                child: Text(
                  title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFFFFFF)),
                child: const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: CustomSvg(ImagePaths.bellRing))),
          )
        ],
      ),
    ));
  }
}
