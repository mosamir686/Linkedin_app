import 'package:Blog_app/view/res/color_manager.dart';
import 'package:Blog_app/view/res/extension.dart';
import 'package:Blog_app/view/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../res/assets_manager.dart';

class CustomSocialPart extends StatelessWidget {
  const CustomSocialPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '- Or sign in with -',
            style: TextStyle(
                color: ColorManager.textColor,
                fontWeight: FontWeight.w400,
                fontSize: AppSiz.s18),
          ),
        ),
        20.mh,
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: AppSiz.s50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSiz.s10),
                    color: ColorManager.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.blackColor.withOpacity(AppSiz.s0_1),
                        blurRadius: AppSiz.s10,
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    AssetManager.facebookLogo,
                    height: AppSiz.s20,
                  ),
                ),
              ),
              10.pw,
              Expanded(
                child: Container(
                  height: AppSiz.s50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSiz.s10),
                    color: ColorManager.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.blackColor.withOpacity(AppSiz.s0_1),
                        blurRadius: AppSiz.s10,
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    AssetManager.googleLogo,
                    height: AppSiz.s20,
                  ),
                ),
              ),
              10.pw,
             
            ],
          ),
        )
      ],
    );
  }
}
