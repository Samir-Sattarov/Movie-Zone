import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreWidget extends StatelessWidget {
  final String url;
  final String title;
  const GenreWidget({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black12,
                  Colors.black54,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFEEEFF0),
                fontSize: 20,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
