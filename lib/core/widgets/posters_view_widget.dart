import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/api/api_constants.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'package:movie_zone/core/widgets/poster_widget.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';

import '../../features/main/domain/entities/movie_entity.dart';

class PostersViewWidget extends StatefulWidget {
  final String title;
  final List<MovieEntity> movies;
  final Function(int id )  onTap;

  const PostersViewWidget({Key? key, required this.title, required this.movies, required this.onTap})
      : super(key: key);

  @override
  State<PostersViewWidget> createState() => _PostersViewWidgetState();
}

class _PostersViewWidgetState extends State<PostersViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 40),
            slidingBeginOffset: const Offset(-1, 0),
            fadeIn: true,
            child: Text(
              widget.title.tr(),
              style: TextStyle(
                color: const Color(0xFFEEEFF0),
                fontSize: 24.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        SizedBox(height: 19.h),
        if (widget.movies.isEmpty)
          const Center(
              child: LoadingWidget(
            size: 100,
          )),
        if (widget.movies.isNotEmpty)
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
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  final movie = widget.movies[index];

                  final imageUrl =
                      "${ApiConstants.imageApiUrl}${movie.imageUrl}";
                  return Padding(
                    padding: EdgeInsets.only(
                        right: 12.w, left: index == 0 ? 20.w : 0),
                    child: GestureDetector(
                      onTap: () => widget.onTap.call(movie.id),
                      child: PosterWidget(
                        width: 158,
                        hasNewEpisodes: false,
                        url: imageUrl,
                      )
                          .animate()
                          .fade(duration: 500.ms)
                          .slideX(curve: Curves.easeInOutQuad)
                          .slideY(),
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
