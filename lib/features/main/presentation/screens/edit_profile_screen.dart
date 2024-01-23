import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';

import '../../../auth/domain/entities/user_entity.dart';

class EditProfileSettings extends StatefulWidget {
  static route({required UserEntity userEntity}) => MaterialPageRoute(
        builder: (context) => EditProfileSettings(userEntity: userEntity),
      );

  final UserEntity userEntity;
  const EditProfileSettings({Key? key, required this.userEntity})
      : super(key: key);

  @override
  State<EditProfileSettings> createState() => _EditProfileSettingsState();
}

class _EditProfileSettingsState extends State<EditProfileSettings> {
  final TextEditingController controllerFullName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  @override
  void initState() {
    controllerFullName.text = widget.userEntity.name;
    controllerEmail.text = widget.userEntity.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0F1111),
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "SF Pro Display",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 39.h,
            ),
            Center(
              child: Container(
                height: 92.h,
                width: 92.w,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: const Color(0xff656E72), width: 1.5),
                    shape: BoxShape.circle,
                    color: const Color(0xff191B1C)),
                child: Center(
                  child: Text(
                    widget.userEntity.name[0].toUpperCase(),
                    style: TextStyle(
                      color: const Color(0xFFEEEFF0),
                      fontSize: 24.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "fullName".tr(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormFieldWidget(
              controller: controllerFullName,
              hint: 'fullName',
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "emailAddress".tr(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormFieldWidget(
              controller: controllerEmail,
              hint: 'emailAddress',
            ),
            SizedBox(
              height: 24.h,
            ),
            ButtonWidget(
              title: "save",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
