import 'package:meter_reading/Module/auth/forgetPassword/forget_password_screen.dart';
import 'package:meter_reading/Module/auth/login/login_screen.dart';
import 'package:meter_reading/Module/auth/otp/otp_screen.dart';

import 'package:meter_reading/Module/notification/notification_screen.dart';

import 'package:meter_reading/Module/home/view/screen/home_screen.dart';
import 'package:meter_reading/Module/profile_client/view/screen/profile_client_screen.dart';
import 'package:meter_reading/Module/setting/view/screen/setting_screen.dart.dart';
import 'package:meter_reading/Module/tab/tab.dart';
import 'package:meter_reading/core/helper/animate_do.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initial = '/login';
  static const loginScreen = '/login';
  static const forgetPasswordScreen = '/ForgetPasswordScreen';
  static const otpScreen = '/otp';
  static const navigationTabScreen = '/NavigationTabScreen';
  static const homeScreen = '/home';
  static const settingScreen = '/SettingScreen';
  static const profileClientScreen = '/ProfileClientScreen';

  static const notificationScreen = '/notificationScreen';
}

class Routes {
  static final routes = [
    //Auth
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),

    GetPage(
        name: AppRoutes.forgetPasswordScreen,
        page: () => const ForgetPasswordScreen()),

    GetPage(name: AppRoutes.otpScreen, page: () => const OtpScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
    GetPage(
        name: AppRoutes.navigationTabScreen,
        page: () => const NavigationTabScreen()),

    GetPage(
        name: AppRoutes.settingScreen,
        page: () => FadeInLeft(
              duration: const Duration(seconds: 0),
              child: const SettingScreen(),
            )),

    GetPage(
        name: AppRoutes.notificationScreen,
        page: () => const NotificationScreen()),
    GetPage(
        name: AppRoutes.profileClientScreen,
        page: () => const ProfileClientScreen()),
  ];
}
