import 'package:meter_reading/Module/bottom_sheet/collection_new.dart';
import 'package:meter_reading/Module/bottom_sheet/read_new.dart';
import 'package:meter_reading/Module/home/controller/home_controller.dart';
import 'package:meter_reading/Module/home/view/widget/widget_details_read_user.dart';
import 'package:meter_reading/Module/home/view/widget/widget_empty.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/config/theme/light_theme_colors.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/animate_do.dart';
import 'package:meter_reading/core/utils/dashed_divider.dart';
import 'package:meter_reading/core/utils/spaces.dart';
import 'package:meter_reading/core/utils/toast.dart';
import 'package:meter_reading/model/employee_model.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meter_reading/widgets/widget_appbar_home.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SunmiPrinter.bindingPrinter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    EmployeeModel employeeModel =
        SPHelper.sHelper.getProfileSharedPreferences();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 100),
          child: WidgetAppBarHome(
              title: employeeModel.name!, subTitle: "صباح الخير"),
        ),
        body: GetBuilder<HomeController>(
          init: controller,
          id: "read",
          builder: (_) => _.isLoadDownload == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: CircularProgressIndicator()),
                    const SpaceH12(),
                    Text("تحميل المستخدمين!",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleLarge!
                            .copyWith()),
                  ],
                )
              : Column(
                  children: [
                    widgetHeaderHome(context, _),
                    const SpaceH4(),
                    _.isSelect == 0
                        ? _.isLoad == true
                            ? const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: CircularProgressIndicator()),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: ListView.builder(
                                          itemCount: _.areasList.length,
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 12),
                                          itemBuilder: (context, index) =>
                                              FadeInUp(
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: widgetSelectContract(
                                                        context: context,
                                                        onTap: () {
                                                          _.changeSelectAreas(_
                                                              .areasList[index]
                                                              .id!);

                                                          _.changeListUser(_
                                                              .areasList[index]
                                                              .id!);
                                                        },
                                                        isSelect:
                                                            _.areasList[index]
                                                                    .id ==
                                                                _.isSelectAreas,
                                                        image: "",
                                                        text: index + 1 ==
                                                                _.isSelectAreas
                                                            ? "${_.userAreasList.length.toString()} ${_.areasList[index].name!}"
                                                            : _.areasList[index]
                                                                .name!),
                                                  ))),
                                    ),
                                    _.userAreasList.isNotEmpty
                                        ? Expanded(
                                            child: ListView.separated(
                                              itemCount: _.userAreasList.length,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              padding: const EdgeInsets.only(
                                                  top: 8,
                                                  left: 8,
                                                  right: 8,
                                                  bottom: 8),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        useRootNavigator: true,
                                                        isDismissible: true,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                        builder: (context) => FadeInUp(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        400),
                                                            child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets
                                                                        .bottom),
                                                                child: ReadNewBottomSheet(
                                                                    usersModel:
                                                                        _.userAreasList[
                                                                            index]))));
                                                  },
                                                  child: WidgetDetailsReadUser(
                                                    name: _.userAreasList[index]
                                                        .customerName!,
                                                    accountNo:
                                                        _.userAreasList[index]
                                                                .accountId ??
                                                            "0",
                                                    machenNo:
                                                        _.userAreasList[index]
                                                                .machineId ??
                                                            "0",
                                                    lastread:
                                                        _.userAreasList[index]
                                                                .lastRead ??
                                                            "0",
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      const SpaceH8(),
                                            ),
                                          )
                                        : const Expanded(
                                            child: Center(
                                                child:
                                                    WidgetEmpty(isRead: false)))
                                  ],
                                ),
                              )
                        : Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.search,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                        controller: controller
                                            .searchTextController.value,
                                        onChanged: (value) {
                                          if (value == "") {
                                            controller.searchTextController
                                                .value.text = "";
                                            controller.searchCollectionModel
                                                .value = [];
                                          }
                                          controller.setSaggetstSearch(
                                            search: controller
                                                .searchTextController
                                                .value
                                                .text,
                                          );
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'SEARCH'.tr,
                                            prefixIcon: const Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: CustomSvg(
                                                ImagePaths.search,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: controller
                                                        .searchTextController
                                                        .value
                                                        .text ==
                                                    ""
                                                ? Container(width: 1)
                                                : InkWell(
                                                    onTap: () {
                                                      controller
                                                          .searchTextController
                                                          .value
                                                          .text = "";
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                      controller
                                                          .searchCollectionModel
                                                          .value = [];
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: Colors.grey,
                                                      size: 22,
                                                    ),
                                                  ),
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]!)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]!)),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.green),
                                            ))),
                                  ),
                                ),
                                Obx(() => controller
                                        .searchCollectionModel.isNotEmpty
                                    ? Expanded(
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: controller
                                              .searchCollectionModel.length,
                                          itemBuilder: (context, index) {
                                            final suggestion = controller
                                                .searchCollectionModel[index];

                                            if (suggestion.customerName!
                                                .toLowerCase()
                                                .contains(controller
                                                    .selectedSuggestion
                                                    .toLowerCase())) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                      title: Text(
                                                          suggestion
                                                              .customerName!,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium!),
                                                      minLeadingWidth: 15,
                                                      leading: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 6),
                                                        child: CustomSvg(
                                                            ImagePaths.search,
                                                            height: 18),
                                                      ),
                                                      trailing: const CustomSvg(
                                                          ImagePaths.iconWrap,
                                                          height: 18),
                                                      onTap: () async {
                                                        showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            context: context,
                                                            useRootNavigator:
                                                                true,
                                                            isDismissible: true,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            builder: (context) => FadeInUp(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        400),
                                                                child: Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: MediaQuery.of(context)
                                                                            .viewInsets
                                                                            .bottom),
                                                                    child: AddCollectionBottomSheet(
                                                                        usersModel:
                                                                            _.userList[index]))));
                                                      }),
                                                  const MySeparator()
                                                ],
                                              );
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                    : const Expanded(
                                        child: Center(
                                            child: WidgetEmpty(isRead: false))))
                              ],
                            ),
                          )
                  ],
                ),
        ));
  }

  Padding widgetHeaderHome(BuildContext context, HomeController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelect(0);
            },
            isSelect: controller.isSelect == 0,
            text: "القراءات",
            image: ImagePaths.fileLineChart,
          ),
          const SpaceW8(),
          widgetSelectContract(
            context: context,
            onTap: () {
              controller.changeSelect(1);
            },
            isSelect: controller.isSelect == 1,
            text: "التحصيلات",
            image: ImagePaths.circleDollar,
          ),
          const SpaceW12(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 2),
                      spreadRadius: 0,
                      blurRadius: 12,
                      color: const Color(0xff111827).withOpacity(0.2))
                ],
                color: LightThemeColors.white,
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PopupMenuButton(
                padding: const EdgeInsets.all(8.0),
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.r)),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                      onTap: () async {
                        controller.userList.isEmpty
                            ? showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Center(
                                      child: Container(
                                        width: 320,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Obx(() => Text(
                                                          "%${((controller.index.value / 5414) * 100).ceil().toStringAsFixed(0)}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16))),
                                                      const SpaceW4(),
                                                      Center(
                                                        child: SizedBox(
                                                          width: 200,
                                                          child: Obx(() =>
                                                              LinearProgressIndicator(
                                                                value: controller
                                                                        .index
                                                                        .value /
                                                                    5416,
                                                                backgroundColor:
                                                                    Colors.grey,
                                                                color: LightThemeColors
                                                                    .primaryColor,
                                                              )),
                                                        ),
                                                      ),
                                                      const SpaceW4(),
                                                      Text("%100",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16))
                                                    ]),
                                                Text("تحميل المستخدمين",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(fontSize: 16))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                            : showToast("", " تم تحميل جميع المستخدمين بالفعل",
                                ToastType.SUCCESS);

                        controller.getListUser();
                      },
                      child: Row(
                        children: [
                          const CustomSvg(ImagePaths.upload),
                          const SpaceW8(),
                          Text("تحديث",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: const Color(0xff6E6E6E),
                                  )),
                        ],
                      )),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const CustomSvg(
                          ImagePaths.download,
                        ),
                        const SpaceW8(),
                        Text("تحميل",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(0xff6E6E6E),
                                )),
                      ],
                    ),
                  )
                ],
                child: const CustomSvg(
                  ImagePaths.moreHorizontal,
                ),
              ),
            ),
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
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  color: const Color(0xff111827).withOpacity(0.1))
            ],
            color: isSelect == true
                ? LightThemeColors.primaryColor
                : LightThemeColors.white,
            borderRadius: BorderRadius.circular(10.r)),
        child: image == ""
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: isSelect == true
                                ? Colors.white
                                : const Color(0xff6E6E6E),
                          )),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CustomSvg(image,
                          isColor: true,
                          color: isSelect == true ? Colors.white : null),
                    ),
                    Text(text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: isSelect == true
                                  ? Colors.white
                                  : const Color(0xff6E6E6E),
                            )),
                    const SpaceH12(),
                  ],
                ),
              ),
      ),
    );
  }
}
