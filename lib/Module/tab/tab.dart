import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meter_reading/Module/history/controller/history_controller.dart';
import 'package:meter_reading/Module/history/view/screen/history_screen.dart';
import 'package:meter_reading/Module/home/view/screen/home_screen.dart';
import 'package:meter_reading/Module/search/controller/search_controller.dart';
import 'package:meter_reading/Module/search/search_screen.dart';
import 'package:meter_reading/Module/setting/view/screen/setting_screen.dart.dart';
import 'package:meter_reading/Module/tab/controller/tab_controller.dart';
import 'package:meter_reading/core/constants/images_path.dart';
import 'package:meter_reading/widgets/custom_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavigationTabScreen extends StatefulWidget {
  const NavigationTabScreen({Key? key}) : super(key: key);

  @override
  State<NavigationTabScreen> createState() => _NavigationTabScreenState();
}

class _NavigationTabScreenState extends State<NavigationTabScreen> {
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      SearchScreen(),
      // const HomeScreen(),
      const HistoryScreen(),
      const SettingScreen(),
    ];
  }

  NavigationTabController? navigationNavController;
  // HistoryController? historyController;

  @override
  void initState() {
    super.initState();

    navigationNavController = Get.put(NavigationTabController());
    // Get.put(HomeController());
    // historyController = Get.put(HistoryController());

    Get.put(SearchScreenController());
  }

  // getVersion() async {
  //   AdminPercentageModel responseData = await AdminService.getAdminSettings();
  //   if (responseData.data!.version == "v2" ||
  //       responseData.data!.version == "0") {
  //   } else {
  //     return customShowUpdateDialog(Get.context!);
  //   }
  // }

  // void customShowUpdateDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog(
  //       title: Text(
  //         "There is a new update".tr,
  //         style: Theme.of(context)
  //             .textTheme
  //             .headlineSmall!
  //             .copyWith(fontSize: 20, color: AppColors.primaryColor),
  //       ),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: <Widget>[
  //             Text(
  //               "You must update the app to continue.".tr,
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .headlineSmall!
  //                   .copyWith(fontSize: 16),
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text('REFRESH'.tr),
  //           onPressed: () async {
  //             await LuncherHelper.validationHelper.launchInBrowser(Platform
  //                     .isIOS
  //                 ? "https://apps.apple.com/us/app/%D8%A5%D8%B3%D8%A3%D9%84%D9%86%D9%8A/id6450955769"
  //                 : "https://play.google.com/store/apps/details?id=com.vasa.app");
  //             Get.back();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      decoration: NavBarDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(1, 2),
            spreadRadius: 0,
            blurRadius: 6)
      ]),
      controller: navigationNavController!.tabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      padding: const NavBarPadding.all(2),
      // margin: const EdgeInsets.symmetric(vertical: 4),
      popActionScreens: PopActionScreensType.all,
      // bottomScreenMargin: 20,
      backgroundColor: Colors.white,

      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle: NavBarStyle.style2,
      onItemSelected: (int index) {
        navigationNavController!.selectedPageIndex.value = index;

        if (index == 2) {
          HistoryController historyController = Get.put(HistoryController());

          historyController.getHistoryReads();
          // showModalBottomSheet(
          //     context: context,
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.vertical(
          //         top: Radius.circular(12.0),
          //       ),
          //     ),
          //     builder: (context) => FadeInUp(
          //         duration: const Duration(milliseconds: 300),
          //         child: const WidgetBottomSheet()));
        }
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      bottomNavBarItem(ImagePaths.home),
      bottomNavBarItem(ImagePaths.search),
      // PersistentBottomNavBarItem(
      //     icon: Swing(
      //       child: const CircleAvatar(
      //         radius: 50,
      //         backgroundColor: LightThemeColors.primaryColor,
      //         child: Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //     activeColorPrimary: Colors.black,
      //     inactiveColorPrimary: Colors.grey,
      //     inactiveColorSecondary: Colors.grey,
      //     contentPadding: 0),
      bottomNavBarItem(ImagePaths.history),
      bottomNavBarItem(ImagePaths.user),
    ];
  }

  PersistentBottomNavBarItem bottomNavBarItem(String svg) =>
      PersistentBottomNavBarItem(
          inactiveIcon: CustomSvg(
            svg,
            width: 20,
            height: 25,
            color: Colors.grey,
            isColor: true,
          ),
          icon: CustomSvg(
            svg,
            width: 20,
            height: 25,
            color: Colors.black,
            isColor: true,
          ),
          contentPadding: 0);
}
