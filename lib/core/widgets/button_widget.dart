import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isOutline;
  final bool isEnabled;
  final double? width;
  final Widget? iconData;
  final double? height;
  final double? fontSize;
  final BorderRadius? borderRadius;
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isEnabled = true,
    this.isOutline = false,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,   this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ?  onTap : null,
      child: Container(
        height:height ??  43.h,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          color: isEnabled == false
              ? const Color(0xff272B2C)
              : isOutline
                  ? Colors.black
                  : Colors.white,
          border: isOutline ? Border.all(color: Colors.white, width: 1) : null,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                if(iconData != null)  iconData!,

                if(iconData != null)   SizedBox(width: 5.w),
                 Text(
                  title,
                  style: TextStyle(
                    fontSize:fontSize ??  16.sp,
                    fontWeight: FontWeight.w600,
                    color: isEnabled == false
                        ? const Color(0xff747E83)
                        : !isOutline
                            ? Colors.black
                            : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
