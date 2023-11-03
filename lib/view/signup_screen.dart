import 'package:Blog_app/view/res/color_manager.dart';
import 'package:Blog_app/view/res/extension.dart';
import 'package:Blog_app/view/res/strings_manager.dart';
import 'package:Blog_app/view/res/values_manager.dart';
import 'package:Blog_app/view/widgets/custom_button.dart';
import 'package:Blog_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage("assets/images/linkedin.ico"),
                        width: 200,
                        height: 120,
                      ),
                    ),
                    90.mh,
                    Container(
                      padding: const EdgeInsets.only(left: AppPadding.p13),
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSiz.s20),
                      ),
                    ),
                    40.mh,
                    CustomTextFormField(
                      textEditingController: nameController,
                      text: 'Enter Your name',
                      textInputType: TextInputType.name,
                      obscure: false,
                    ),
                    25.mh,
                    CustomTextFormField(
                      textEditingController: emailController,
                      text: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      obscure: false,
                    ),
                    25.mh,
                    CustomTextFormField(
                      textEditingController: passwordController,
                      text: 'Enter Your password',
                      textInputType: TextInputType.visiblePassword,
                      obscure: true,
                    ),
                    25.mh,
                    CustomTextFormField(
                      textEditingController: confirmController,
                      text: 'Confirm Your password',
                      textInputType: TextInputType.visiblePassword,
                      obscure: true,
                    ),
                    50.mh,
                    Container(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Sign up',
                        textColor: ColorManager.whiteColor,
                        onPressed: () {
                          Get.offNamed(StringsManager.splashRoute);
                        },
                      ),
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
