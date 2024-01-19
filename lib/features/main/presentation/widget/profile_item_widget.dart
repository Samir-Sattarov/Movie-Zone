import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? prefix;
  final bool withUnderline;
  const ProfileItemWidget({Key? key, required this.title, required this.onTap, this.prefix,   this.withUnderline  = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 19.h,horizontal: 20.w),
          decoration:   BoxDecoration(
            border:  withUnderline ? const Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xff272B2C),
              ),
            ) : null,
          ),
          child: Row(
            children: [
              if(prefix != null)  prefix!,
              if(prefix != null)  SizedBox(width: 6.w),
              Text(
                title.tr(),
                style:  TextStyle(
                  color: const Color(0xFFEEEFF0),
                  fontSize: 16.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
