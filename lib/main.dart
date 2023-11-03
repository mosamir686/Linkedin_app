import 'package:Blog_app/util/binding.dart';
import 'package:Blog_app/view/home_page.dart';
import 'package:Blog_app/view/login_screen.dart';
import 'package:Blog_app/view/res/strings_manager.dart';
import 'package:Blog_app/view/signup_screen.dart';
import 'package:Blog_app/view/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      getPages: [
        GetPage(
            name: StringsManager.splashRoute,
            page: () => const SplashScreen(),
            binding: Binding()),
        GetPage(
            name: StringsManager.homeRoute,
            page: () => HomePage(),
            binding: Binding()),
        GetPage(
            name: StringsManager.loginRoute,
            page: () => LoginScreen(),
            binding: Binding()),
        GetPage(
            name: StringsManager.signupRoute,
            page: () => SignupScreen(),
            binding: Binding()),
      ],
      initialRoute: StringsManager.loginRoute,
    );
  }
}
