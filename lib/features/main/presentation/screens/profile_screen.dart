import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/presentation/widget/profile_user_widget.dart';

import '../widget/profile_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const user = UserEntity(
      id: "",
      email: "test@gmail.com",
      name: "Test",
      phone: "+998937246024",
      watchedMovies: [],
    );
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 52.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:   ProfileUserWidget(user: user, onTap: () {  },),
          ),
          SizedBox(height: 52.h),
          _categoryWidget("settings"),
          ProfileItemWidget(
            title: 'language',
            onTap: () {},
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
          _categoryWidget("Others"),
          ProfileItemWidget(
            title: 'history',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'privacyPolicy',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'helpCenter',
            onTap: () {},
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
            onTap: () {},
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
    );
  }

  _categoryWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title.tr(),
        style: const TextStyle(
          color: Color(0xFFEEEFF0),
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
