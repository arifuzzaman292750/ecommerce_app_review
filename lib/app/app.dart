import 'package:ecommerce_app_review/app/app_theme_data.dart';
import 'package:ecommerce_app_review/app/controller_binder.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_app_review/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_app_review/features/common/ui/screens/main_bottom_nav_screen.dart';
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
      routes: {
        '/': (context) => SplashScreen(),
        EmailVerificationScreen.name: (context) => EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => CompleteProfileScreen(),
        MainBottomNavScreen.name: (context) => MainBottomNavScreen(),
      },
    );
  }
}
