import 'package:Blog_app/view/res/color_manager.dart';
import 'package:Blog_app/view/res/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return "";
    }
    return null;
  }

  validatePassword(String? pass) {
    if (!GetUtils.isLengthGreaterOrEqual(pass, 6)) {
      return "";
    }
    return null;
  }

  Future onLogin() async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(StringsManager.splashRoute);
      return null;
    }
    Get.snackbar(
      "Error",
      'login field',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorManager.whiteColor,
      backgroundColor: ColorManager.primary,
      margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
      borderRadius: 20,
      maxWidth: 180,
    );
  }
}
