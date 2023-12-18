import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pinput/pinput.dart';

class SignInScreenPartThree extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInScreenPartThree(),
      );
  const SignInScreenPartThree({Key? key}) : super(key: key);

  @override
  State<SignInScreenPartThree> createState() => _SignInScreenPartThreeState();
}

class _SignInScreenPartThreeState extends State<SignInScreenPartThree> {
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 64.h,
      width: 64.w,
      // padding: EdgeInsets.symmetric(horizontal: 16.w),

      margin:        EdgeInsets.symmetric(horizontal: 16.w/ 4),

      textStyle: const TextStyle(fontSize: 20, color: Color(0xff969B9C), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xff191B1C),
        border: Border.all(color: const Color(0xff656E71) ),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color(0xff191B1C),

      border: Border.all(color: const Color(0xff656E71) ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: const Color(0xff191B1C),
        border: Border.all(color: const Color(0xff656E71) ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 120.w,
                        lineHeight: 8.0,
                        percent: 0.5,
                        progressColor: Colors.white,
                        barRadius: Radius.circular(12.r),
                        backgroundColor: const Color(0xff191B1C),
                      ),
                      ButtonWidget(
                        title: "help".tr(),
                        onTap: () {},
                        fontSize: 12.sp,
                        isOutline: true,
                        width: 60.w,
                        borderRadius: BorderRadius.circular(32).r,
                      ),
                    ],
                  ),
                ),
                Text(
                  "enterYourOTPCode".tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "enterYourOTPCodeSubtitle".tr(),
                  style: TextStyle(
                    color: const Color(0xffB9BFC1),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 24.h),
              Center(
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
                SizedBox(height: 24.h),

                Text(
                  "enterYourOTPCodeSubtitleTwo".tr(),
                  style: TextStyle(
                    color: const Color(0xffB9BFC1),
                    fontSize: 16.sp,
                  ),
                ),

                const Spacer(),
                Text(
                  "signInPartThreeDescription".tr(),
                  style: TextStyle(
                    color: const Color(0xffB9BFC1),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                ButtonWidget(
                  title: "continue".tr(),
                  onTap: () {},
                  isEnabled: false,
                ),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
