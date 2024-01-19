import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/extentions.dart';

class PosterWidget extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final bool hasNewEpisodes;
  const PosterWidget(
      {Key? key,
      required this.url,
      this.height = 200,
      this.width = 170,
      this.hasNewEpisodes = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage(
            url,
          )..preload(),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (hasNewEpisodes)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                "newEpisodes".tr(),
                style: TextStyle(
                  color: const Color(0xFF191B1C),
                  fontSize: 12.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
