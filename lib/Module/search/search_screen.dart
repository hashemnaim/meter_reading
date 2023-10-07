import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/search/controller/search_controller.dart';
import 'package:meter_reading/config/routes/routes.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/core/helper/helper_check_internet.dart';
import 'package:meter_reading/core/utils/dashed_divider.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:meter_reading/widgets/widget_appbar_screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreenController searchcontroller = Get.find();
  CheckInternet checkInternet = CheckInternet();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size(Get.width, 65),
            child: const WidgetAppBarScreen(
              title: "البحث",
              isHome: true,
            ),
          ),
          body: Obx(
            () => Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    controller: searchcontroller.searchTextController.value,
                    onChanged: (value) {
                      if (value == "") {
                        searchcontroller.searchTextController.value.text = "";
                        searchcontroller.searchSaggestModel.value = [];
                      }
                      searchcontroller.setSaggetstSearch(
                        search:
                            searchcontroller.searchTextController.value.text,
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
                        suffixIcon: searchcontroller
                                    .searchTextController.value.text ==
                                ""
                            ? Container(width: 1)
                            : InkWell(
                                onTap: () {
                                  searchcontroller
                                      .searchTextController.value.text = "";
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  searchcontroller.searchSaggestModel.value =
                                      [];
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ),
                        hintStyle: Theme.of(context).textTheme.bodyMedium!,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!)),
                        contentPadding: const EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.green),
                        ))),
              ),
              searchcontroller.searchSaggestModel.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: searchcontroller.searchSaggestModel.length,
                        itemBuilder: (context, index) {
                          final suggestion =
                              searchcontroller.searchSaggestModel[index];

                          if (suggestion.customerName!.toLowerCase().contains(
                              searchcontroller.selectedSuggestion
                                  .toLowerCase())) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                    title: Text(suggestion.customerName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!),
                                    minLeadingWidth: 15,
                                    leading: const Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: CustomSvg(ImagePaths.search,
                                          height: 18),
                                    ),
                                    trailing: const CustomSvg(
                                        ImagePaths.iconWrap,
                                        height: 18),
                                    onTap: () async {
                                      if (!searchcontroller.searchHistoryModel
                                          .contains(suggestion)) {
                                        searchcontroller.searchHistoryModel.add(
                                            searchcontroller
                                                .searchSaggestModel[index]);
                                        await SPHelper.sHelper
                                            .saveListToSharedPreferences(
                                                searchcontroller
                                                    .searchHistoryModel);
                                      }
                                      // log(suggestion.accountId.toString());
                                      // bool? isCheck = await checkInternet
                                      //     .checkConnectivity();
                                      // log(isCheck.toString());
                                      // if (isCheck == true) {
                                      Get.toNamed(AppRoutes.profileClientScreen,
                                          arguments: {
                                            "id":
                                                suggestion.accountId.toString()
                                          });
                                      // }
                                    }),
                                const MySeparator()
                              ],
                            );
                          }
                          return null;
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
              searchcontroller.searchTextController.value.text == ""
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: searchcontroller.searchHistoryModel.length,
                        itemBuilder: (context, index) {
                          final suggestion =
                              searchcontroller.searchHistoryModel[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                  title: Text(suggestion.customerName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!),
                                  minLeadingWidth: 15,
                                  leading: const Padding(
                                    padding: EdgeInsets.only(top: 6),
                                    child: CustomSvg(ImagePaths.history,
                                        height: 18),
                                  ),
                                  trailing: const CustomSvg(ImagePaths.iconWrap,
                                      height: 18),
                                  onTap: () async {
                                    // bool? isCheck =
                                    //     await checkInternet.checkConnectivity();
                                    // log(isCheck.toString());
                                    // if (isCheck == true) {
                                    Get.toNamed(AppRoutes.profileClientScreen,
                                        arguments: {
                                          "id": suggestion.accountId.toString()
                                        });
                                    // }
                                  }),
                              // const MySeparator()
                            ],
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ]),
          )),
    );
  }
}
