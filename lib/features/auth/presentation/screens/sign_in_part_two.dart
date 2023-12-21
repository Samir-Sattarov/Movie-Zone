import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_in_part_three.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SignInScreenPartTwo extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInScreenPartTwo(),
      );
  const SignInScreenPartTwo({Key? key}) : super(key: key);

  @override
  State<SignInScreenPartTwo> createState() => _SignInScreenPartTwoState();
}

class _SignInScreenPartTwoState extends State<SignInScreenPartTwo> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
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
                    "enterYourPassword".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "enterYourPasswordSubtitle".tr(),
                    style: TextStyle(
                      color: const Color(0xffB9BFC1),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormFieldWidget(
                    controller: controller,
                    onSubmit: (p0) {
                      setState(() {

                      });
                    },
                    hint: 'enterYourPassword'.tr(),
                    validator: FormValidator.password,
                  ),
                  const Spacer(),
                  Text(
                    "signInPartTwoDescription".tr(),
                    style: TextStyle(
                      color: const Color(0xffB9BFC1),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ButtonWidget(
                    title: "continue".tr(),
                    onTap: () {
                      Navigator.push(context, SignInScreenPartThree.route());
                    },
                    isEnabled: _formKey.currentState?.validate() ?? false,
                  ),
                  SizedBox(height: 45.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
