import 'package:Blog_app/controller/login_controller.dart';
import 'package:Blog_app/view/res/color_manager.dart';
import 'package:Blog_app/view/res/extension.dart';
import 'package:Blog_app/view/res/strings_manager.dart';
import 'package:Blog_app/view/res/values_manager.dart';
import 'package:Blog_app/view/widgets/custom_button.dart';
import 'package:Blog_app/view/widgets/custom_social_part.dart';
import 'package:Blog_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage("assets/images/linkedin.ico"),
                        width: 200,
                        height: 140,
                      ),
                    ),
                    80.mh,
                    Container(
                      padding: const EdgeInsets.only(left: AppPadding.p13),
                      child: Text(
                        'log in ',
                        style: TextStyle(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSiz.s20),
                      ),
                    ),
                    20.mh,
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            validator: (email) =>
                                controller.validateEmail(email),
                            textEditingController: emailController,
                            text: 'Email',
                            textInputType: TextInputType.emailAddress,
                            obscure: false,
                          ),
                          30.mh,
                          CustomTextFormField(
                            validator: (pass) =>
                                controller.validatePassword(pass),
                            textEditingController: passwordController,
                            text: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                          ),
                          35.mh,
                          Container(
                            alignment: Alignment.center,
                            child: CustomButton(
                              text: 'Log In',
                              textColor: ColorManager.whiteColor,
                              onPressed: () {
                                // Get.offNamed(StringsManager.splashRoute);
                                controller.onLogin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    50.mh,
                    const CustomSocialPart(),
                    60.mh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSiz.s18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(StringsManager.signupRoute);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: AppSiz.s18,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
