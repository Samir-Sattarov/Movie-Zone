import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isOutline;
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
      this.isOutline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: isOutline ? Colors.black : Colors.white,
        border: isOutline ? Border.all(color: Colors.white, width: 1) : null,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: !isOutline ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
