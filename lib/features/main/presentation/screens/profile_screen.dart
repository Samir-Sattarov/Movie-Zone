import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:movie_zone/features/auth/presentation/cubit/session/session_cubit.dart';
import 'package:movie_zone/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:movie_zone/features/main/presentation/screens/edit_profile_screen.dart';
import 'package:movie_zone/features/main/presentation/widget/profile_user_widget.dart';

import '../../../../core/widgets/error_flash_bar.dart';
import '../cubit/current_user/current_user_cubit.dart';
import '../cubit/theme/theme_cubit.dart';
import '../widget/profile_item_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<CurrentUserCubit>(context).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<CurrentUserCubit, CurrentUserState>(
        listener: (context, state) {
          if (state is CurrentUserError) {
            ErrorFlushBar(state.message).show(context);
          }
        },
        child: ListView(
          physics: const ClampingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: BlocBuilder<CurrentUserCubit, CurrentUserState>(
                builder: (context, state) {
                  if (state is CurrentUserLoaded) {
                    return ProfileUserWidget(
                      user: state.user,
                      onTap: () {
                        Navigator.push(
                          context,
                          EditProfileSettings.route(userEntity: state.user),
                        );
                      },
                    );
                  }
                  return SizedBox(
                    height: 72.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 52.h),
            _categoryWidget("settings"),
            ProfileItemWidget(
              title: 'language',
              onTap: () {
                // context.setLocale(const Locale("en"));
              },
            ),
            ProfileItemWidget(
              title: 'notification',
              onTap: () {},
            ),
            ProfileItemWidget(
              title: 'manageDownload',
              onTap: () {},
            ),
            ProfileItemWidget(
              title: 'manageDevices',
              onTap: () {},
            ),
            SizedBox(height: 28.h),
            _categoryWidget("others"),
            ProfileItemWidget(
              title: 'history',
              onTap: () {},
            ),
            ProfileItemWidget(
              title: 'privacyPolicy',
              onTap: () {
                BlocProvider.of<ThemeCubit>(context).isDark(false);
              },
            ),
            ProfileItemWidget(
              title: 'helpCenter',
              onTap: () {
                BlocProvider.of<ThemeCubit>(context).isDark(true);
              },
            ),
            ProfileItemWidget(
              title: 'ratings',
              onTap: () {},
            ),
            SizedBox(height: 28.h),
            ProfileItemWidget(
              withUnderline: false,
              prefix: const Icon(Icons.exit_to_app, color: Colors.white),
              title: 'logOut',
              onTap: () {
                BlocProvider.of<AuthCubit>(context).logOut();
                Navigator.of(context).pushAndRemoveUntil(
                    OnBoardingScreen.route(), (route) => false);
              },
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text(
                "Version: 1.0",
                style: TextStyle(
                  color: Color(0xFFB9BFC1),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  _categoryWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title.tr(),
        style: TextStyle(
          color: const Color(0xFFEEEFF0),
          fontSize: 16.sp,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
