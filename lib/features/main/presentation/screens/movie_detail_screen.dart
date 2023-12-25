import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/widget/poster_widget.dart';
import 'package:movie_zone/features/main/presentation/widget/trailer_widget.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/assets.dart';

class MovieDetailScreen extends StatelessWidget {
  static route({required MovieEntity detailEntity}) => MaterialPageRoute(
        builder: (context) => MovieDetailScreen(
          detailEntity: detailEntity,
        ),
      );

  final MovieEntity detailEntity;
  const MovieDetailScreen({Key? key, required this.detailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: const Color(0xFF0F1111),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 370.h,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 370.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          detailEntity.imageUrl,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
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
                                child: SvgPicture.asset(Assets.tArrowLeft),
                              ),
                              const Spacer(),
                              SvgPicture.asset(Assets.tAddList),
                              SizedBox(width: 8.w),
                              SvgPicture.asset(Assets.tShare),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ButtonWidget(
                    iconData: const Icon(Icons.play_arrow_rounded),
                    title: "startWatching".tr(),
                    height: 48.h,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  ButtonWidget(
                    title: "download".tr(),
                    iconData: const Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                    height: 48.h,
                    isOutline: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const ReadMoreText(
                '"Oppenheimer" is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim ',
                trimLines: 3,
                colorClickableText: Colors.white,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                style: TextStyle(
                  color: Color(0xFFB9BFC1),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
                moreStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TrailerWidget(
                url: detailEntity.imageUrl,
                title: detailEntity.title,
                time: "1m 54s",
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          "basedOnOpenedFilm".tr(args: [detailEntity.title]),
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
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: PosterWidget(url: detailEntity.imageUrl),
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 68.h),
          ],
        ),
      ),
    );
  }
}
