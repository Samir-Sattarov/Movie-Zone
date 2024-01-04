import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/poster_widget.dart';

import '../../features/main/domain/entities/movie_entity.dart';

class PostersViewWidget extends StatelessWidget {
  final String title;
  final List<MovieEntity> movies;
  const PostersViewWidget({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:   EdgeInsets.only(left: 20.w),
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 40),
            slidingBeginOffset: const Offset(-1, 0),
            fadeIn: true,
            child: Text(
              title.tr(),
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
          slidingCurve: Curves.easeInCubic,
          child: SizedBox(
            height: 200.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              // itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.w, left: index == 0 ? 20.w:0),
                  child:   DelayedDisplay(
                    delay: const Duration(milliseconds: 5),
                    slidingBeginOffset: const Offset(-1, 0),
                    fadeIn: true,
                    child: PosterWidget(
                      width: 158,
                      hasNewEpisodes: index == 0 ?  true : false,
                      url:
                          "https://i.pinimg.com/564x/6c/8c/42/6c8c42d7cfbe0afb3d029c42e3054ced.jpg",
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
