import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosterWidget extends StatelessWidget {
  final String url;
  const PosterWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 170.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
