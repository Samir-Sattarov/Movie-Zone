import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/error_flash_bar.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_in_part_two.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../main/presentation/screens/main_screen.dart';

class SignUpScreenPartThree extends StatefulWidget {
  static route({required String name, required String email}) =>
      MaterialPageRoute(
        builder: (context) =>
            SignUpScreenPartThree(
              name: name,
              email: email,
            ),
      );

  final String name;
  final String email;

  const SignUpScreenPartThree(
      {Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<SignUpScreenPartThree> createState() => _SignUpScreenPartThreeState();
}

class _SignUpScreenPartThreeState extends State<SignUpScreenPartThree> {
  final TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {

            if(state is AuthRegisterSuccess) {
              Navigator.pushAndRemoveUntil(
                  context, MainScreen.route(), (route) => false);
            }
            if(state is AuthError) {
              ErrorFlushBar(state.message).show(context);
            }


          },
            builder: (context, state) {
            if(state is AuthLoading) {
              return const Center(child: LoadingWidget(),);
            }
             return  Form(
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
                          height: 60.h,
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
                                height: 30.h,
                                isOutline: true,
                                width: 60.w,
                                borderRadius: BorderRadius
                                    .circular(32)
                                    .r,
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
                          "enterYourPasswordToCreateAccount".tr(),
                          style: TextStyle(
                            color: const Color(0xffB9BFC1),
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TextFormFieldWidget(
                          controller: controllerPassword,
                          onChanged: (p0) {
                            setState(() {});
                          },
                          hint: 'enterYourPassword'.tr(),
                          validator: FormValidator.password,
                        ),
                        const Spacer(),
                        Text(
                          "signUpPartOneDescription".tr(),
                          style: TextStyle(
                            color: const Color(0xffB9BFC1),
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ButtonWidget(
                          title: "continue".tr(),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).signUp(
                                email: widget.email,
                                password: controllerPassword.text,
                                name: widget.name,);
                            }
                          },
                          isEnabled: _formKey.currentState?.validate() ?? false,
                        ),
                        SizedBox(height: 45.h),
                      ],
                    ),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
