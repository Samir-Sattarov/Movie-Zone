import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/widgets/poster_widget.dart';
import '../../domain/entities/movie_entity.dart';

class SearchResultCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const SearchResultCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "${ApiConstants.imageApiUrl}${movie.imageUrl}";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PosterWidget(
          height: 100.h,
          width: 100.h,
          hasNewEpisodes: false,
          url: imageUrl,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: TextStyle(
                  color: const Color(0xFFEEEFF0),
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    movie.releaseDate,
                    style: TextStyle(
                      color: const Color(0xFFB9BFC1),
                      fontSize: 14.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
