import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

class LibraryItemWidget extends StatelessWidget {
  final MovieEntity entity;
  const LibraryItemWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dt = DateTime.parse(entity.releaseDate);
    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          SizedBox(
            width: 140.w,
            child: Image.network(
              entity.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entity.title,
                style: TextStyle(
                  color: const Color(0xFFEEEFF0),
                  fontSize: 18.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(
                    "${dt.day}/${dt.month}/${dt.year}",
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
          const Spacer(),
          const Icon(
            Icons.file_download,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
