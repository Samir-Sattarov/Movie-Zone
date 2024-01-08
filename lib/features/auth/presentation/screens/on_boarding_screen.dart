import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_in_part_one.dart';

import 'sign_up_part_one.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.tOnBoardingBackground))),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 52.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "onBoardingTitle".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "onBoardingDescription".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffB9BFC1),
                  ),
                ),
                SizedBox(height: 40.h),
                ButtonWidget(
                  title: "signIn".tr(),
                  onTap: () {
                    Navigator.push(context, SignInScreenPartOne.route());
                  },
                ),
                SizedBox(height: 16.h),
                ButtonWidget(
                  title: "signUp".tr(),
                  onTap: () {
                    Navigator.push(context, SignUpScreenPartOne.route());

                  },
                  isOutline: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
