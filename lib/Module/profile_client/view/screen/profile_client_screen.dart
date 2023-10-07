// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/history/view/widget/widge_fatoora_user.dart';
import 'package:meter_reading/Module/history/view/widget/widget_appbar.dart';
import 'package:meter_reading/Module/home/view/widget/widget_empty.dart';
import 'package:meter_reading/Module/profile_client/controller/profile_client_controller.dart';
import 'package:meter_reading/Module/profile_client/view/widget/widget_details_read_profile_user.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/helper_check_internet.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProfileClientScreen extends StatefulWidget {
  const ProfileClientScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileClientScreen> createState() => _ProfileClientScreenState();
}

class _ProfileClientScreenState extends State<ProfileClientScreen> {
// Be sure to cancel subscription after you are done

  @override
  Widget build(BuildContext context) {
    ProfileClientController controller = Get.put(ProfileClientController());

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    return Obx(() => controller.isLoad.value == true
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(Get.width, 310.h),
              child: WidgetAppBar(
                title: "السجل",
                actions: true,
                isHome: false,
                usersModel: controller.profileClinetModel.value.data!,
              ),
            ),
            body: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpaceH20(),
                    widgetHeaderHome(context, controller),
                    const SpaceH4(),
                    controller.isSelect.value == 0
                        ? controller
                                .profileClinetModel.value.data!.reads!.isEmpty
                            ? const Expanded(
                                child:
                                    Center(child: WidgetEmpty(isRead: false)))
                            : Expanded(
                                child: ListView.separated(
                                  itemCount: controller.profileClinetModel.value
                                      .data!.reads!.length,
                                  physics: const ClampingScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 8, bottom: 70),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      // showModalBottomSheet(
                                      //     isScrollControlled: true,
                                      //     context: Get.context!,
                                      //     shape: const RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.vertical(
                                      //         top: Radius.circular(12.0),
                                      //       ),
                                      //     ),
                                      //     builder: (context) => FadeInUp(
                                      //         duration: const Duration(
                                      //             milliseconds: 400),
                                      //         child: Padding(
                                      //             padding: EdgeInsets.only(
                                      //                 bottom:
                                      //                     MediaQuery.of(context)
                                      //                         .viewInsets
                                      //                         .bottom),
                                      //             child: EditReadBottomSheet(
                                      //                 index: index)
                                      //                 )));
                                    },
                                    child: WidgetDetailsReadProfileUser(
                                        date: controller
                                            .profileClinetModel
                                            .value
                                            .data!
                                            .reads![index]
                                            .createdAt!
                                            .substring(0, 10),
                                        accountNo: controller
                                                .profileClinetModel
                                                .value
                                                .data!
                                                .reads![index]
                                                .accountId ??
                                            "",
                                        machenNo: controller
                                            .profileClinetModel
                                            .value
                                            .data!
                                            .reads![index]
                                            .machineId!,
                                        lastread: controller.profileClinetModel
                                            .value.data!.reads![index].lastRead
                                            .toString()),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SpaceH8(),
                                ),
                              )
                        : controller
                                .profileClinetModel.value.data!.bills!.isEmpty
                            ? const Expanded(
                                child:
                                    Center(child: WidgetEmpty(isRead: false)))
                            : Expanded(
                                child: ListView.separated(
                                  itemCount: controller.profileClinetModel.value
                                      .data!.bills!.length,
                                  physics: const ClampingScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 8, bottom: 70),
                                  itemBuilder: (context, index) =>
                                      WidgeFatooraUser(
                                    name: controller.profileClinetModel.value
                                        .data!.customerName!,
                                    index: index,
                                    read1: controller.profileClinetModel.value
                                        .data!.machineId
                                        .toString(),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SpaceH8(),
                                ),
                              )
                    // : _.collectionUser.isNotEmpty
                    //     ? Expanded(
                    //         child: ListView.separated(
                    //           itemCount: _.collectionUser.length,
                    //           physics: const ClampingScrollPhysics(),
                    //           padding: const EdgeInsets.only(
                    //               top: 8,
                    //               left: 8,
                    //               right: 8,
                    //               bottom: 70),
                    //           itemBuilder: (context, index) =>
                    //               WidgetDetailsCollectionsUser(
                    //             name: _.collectionUser[index]
                    //                 .usersModel!.customerName!,
                    //             price: _.collectionUser[index].accountNo
                    //                 .toString(),
                    //             dateTime:
                    //                 _.collectionUser[index].dateTime!,
                    //           ),
                    //           separatorBuilder:
                    //               (BuildContext context, int index) =>
                    //                   const SpaceH8(),
                    //         ),
                    //       )
                    //     : const Expanded(
                    //         child: Center(
                    //             child: WidgetEmpty(isRead: false))),
                    // widgetEmpty(),
                  ],
                ))));
  }

  Padding widgetHeaderHome(
      BuildContext context, ProfileClientController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelect(0);
            },
            isSelect: controller.isSelect.value == 0,
            text: "القراءات",
            image: ImagePaths.fileLineChart,
          ),
          const SpaceW12(),
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelect(1);
            },
            isSelect: controller.isSelect.value == 1,
            text: "الفواتير",
            image: ImagePaths.newspaper,
          ),
          const SpaceW12(),
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelect(2);
            },
            isSelect: controller.isSelect.value == 2,
            text: "التحصيلات",
            image: ImagePaths.circleDollar,
          ),
        ],
      ),
    );
  }

  Widget widgetSelectContract(
      {required BuildContext context,
      required VoidCallback onTap,
      required bool isSelect,
      required String text,
      required String image}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 54.h,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 2),
                  spreadRadius: 0,
                  blurRadius: 12,
                  color: const Color(0xff111827).withOpacity(0.2))
            ],
            color: isSelect == true
                ? LightThemeColors.primaryColor
                : LightThemeColors.white,
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomSvg(
                image,
                isColor: true,
                color: isSelect == true ? Colors.white : null,
              ),
            ),
            Text(text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isSelect == true
                          ? Colors.white
                          : const Color(0xff6E6E6E),
                    )),
            // const SpaceH8(),
          ],
        ),
      ),
    );
  }
}
