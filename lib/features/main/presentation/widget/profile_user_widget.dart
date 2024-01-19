import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/domain/entities/user_entity.dart';

class ProfileUserWidget extends StatelessWidget {
  final UserEntity user;
  final Function() onTap;
  const ProfileUserWidget({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xff656E72), width: 1.5),
                  shape: BoxShape.circle,
                  color: const Color(0xff191B1C)),
              child: Center(
                child: Text(
                  user.name[0].toUpperCase(),
                  style: TextStyle(
                    color: const Color(0xFFEEEFF0),
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Color(0xFFEEEFF0),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  user.email,
                  style: const TextStyle(
                    color: Color(0xFFB9BFC1),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
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
    );
  }
}
