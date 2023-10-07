import 'package:meter_reading/Module/bottom_sheet/edit_read_new.dart';
import 'package:meter_reading/Module/history/controller/history_controller.dart';
import 'package:meter_reading/Module/home/view/widget/widget_details_collections_user.dart';
import 'package:meter_reading/Module/home/view/widget/widget_details_read_user.dart';
import 'package:meter_reading/Module/home/view/widget/widget_empty.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/animate_do.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/widgets/widget_appbar_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 70),
          child: const WidgetAppBarScreen(
              title: "السجل", actions: true, isHome: true),
        ),
        body: GetBuilder<HistoryController>(
            init: controller,
            id: "read",
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widgetHeaderHome(context, _),
                  const SpaceH4(),
                  controller.isSelectHistorey == 0
                      ? _.isLoad == true
                          ? const Expanded(
                              child: Center(child: CircularProgressIndicator()))
                          : controller.historyReadsist.isEmpty
                              ? const Expanded(
                                  child:
                                      Center(child: WidgetEmpty(isRead: true)))
                              : Expanded(
                                  child: ListView.separated(
                                    itemCount: _.historyReadsist.length,
                                    physics: const ClampingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8, right: 8, bottom: 70),
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: Get.context!,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(12.0),
                                              ),
                                            ),
                                            builder: (context) => FadeInUp(
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: EditReadBottomSheet(
                                                        usersModel:
                                                            _.historyReadsist[
                                                                index]))));
                                      },
                                      child: WidgetDetailsReadUser(
                                          name: _.historyReadsist[index]
                                              .customerName!,
                                          accountNo: _.historyReadsist[index]
                                              .accountId!,
                                          machenNo: _.historyReadsist[index]
                                              .machineId!,
                                          lastread: _.historyReadsist[index]
                                              .lastRead!),
                                    ),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const SpaceH8(),
                                  ),
                                )
                      : controller.isSelectHistorey == 1
                          ? const Expanded(
                              child: Center(child: WidgetEmpty(isRead: true)))
                          : _.isLoad == true
                              ? const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : _.collectionUser.isNotEmpty
                                  ? Expanded(
                                      child: ListView.separated(
                                        itemCount: _.collectionUser.length,
                                        physics: const ClampingScrollPhysics(),
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            left: 8,
                                            right: 8,
                                            bottom: 70),
                                        itemBuilder: (context, index) =>
                                            WidgetDetailsCollectionsUser(
                                          name: _.collectionUser[index]
                                              .customerName!,
                                          price: _.collectionUser[index].price
                                              .toString(),
                                          dateTime:
                                              _.collectionUser[index].dateTime!,
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SpaceH8(),
                                      ),
                                    )
                                  : const Expanded(
                                      child: Center(
                                          child: WidgetEmpty(isRead: false)))
                ],
              );
            }));
  }

  Padding widgetHeaderHome(BuildContext context, HistoryController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelectHistory(0);
            },
            isSelect: controller.isSelectHistorey == 0,
            text: "القراءات",
            image: ImagePaths.fileLineChart,
          ),
          const SpaceW12(),
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelectHistory(1);
            },
            isSelect: controller.isSelectHistorey == 1,
            text: "الفواتير",
            image: ImagePaths.newspaper,
          ),
          const SpaceW12(),
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelectHistory(2);
            },
            isSelect: controller.isSelectHistorey == 2,
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
        // width: 106,
        height: 50,
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
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              const SizedBox(width: 3),
            ],
          ),
        ),
      ),
    );
  }
}
