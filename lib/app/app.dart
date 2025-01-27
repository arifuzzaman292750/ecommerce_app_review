import 'package:ecommerce_app_review/app/app_theme_data.dart';
import 'package:ecommerce_app_review/app/controller_binder.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_app_review/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce_app_review/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_app_review/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = SplashScreen();
        } else if (settings.name == EmailVerificationScreen.name) {
          widget = EmailVerificationScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          widget = OtpVerificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = CategoryListScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        }
        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
