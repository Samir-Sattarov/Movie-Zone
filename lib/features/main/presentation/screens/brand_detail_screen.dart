import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/widgets/poster_widget.dart';

import '../../../../core/utils/assets.dart';

class BrandDetailScreen extends StatelessWidget {
  final String logoUrl;
  static route({required String logoUrl}) => MaterialPageRoute(
        builder: (context) => BrandDetailScreen(
          logoUrl: logoUrl,
        ),
      );

  const BrandDetailScreen({Key? key, required this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 350.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.tBrandDetailBackground,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          color: Colors.black26,
                        ),
                        Hero(
                          tag: logoUrl.hashCode,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Image.network(
                              logoUrl,
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF0F1111),
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Color(0xFF0F1111),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SvgPicture.asset(Assets.tArrowLeftIcon),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            DelayedDisplay(
              delay: const Duration(milliseconds: 5),
              slidingBeginOffset: const Offset(-1, 0),
              fadeIn: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "featured".tr(),
                  style: const TextStyle(
                    color: Color(0xFFEEEFF0),
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 19.h),
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: 20.w),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 5),
                      slidingBeginOffset: const Offset(-1, 0),
                      fadeIn: true,
                      child: PosterWidget(
                        width: 158,
                        height: 200,
                        hasNewEpisodes: index == 0,
                        url:
                            "https://i.pinimg.com/564x/6c/8c/42/6c8c42d7cfbe0afb3d029c42e3054ced.jpg",
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32.h),
            DelayedDisplay(
              delay: const Duration(milliseconds: 40),
              slidingBeginOffset: const Offset(-1, 0),
              fadeIn: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "mostWatched".tr(),
                  style: const TextStyle(
                    color: Color(0xFFEEEFF0),
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 19.h),
            DelayedDisplay(
              delay: const Duration(milliseconds: 40),
              slidingBeginOffset: const Offset(-1, 0),
              fadeIn: true,
              child: Container(
                height: 200.h,
                padding: EdgeInsets.only(left: 20.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: const DelayedDisplay(
                        delay: Duration(milliseconds: 5),
                        slidingBeginOffset: Offset(-1, 0),
                        fadeIn: true,
                        child: PosterWidget(
                          width: 158,
                          height: 200,
                          url:
                              "https://i.pinimg.com/564x/6c/8c/42/6c8c42d7cfbe0afb3d029c42e3054ced.jpg",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
