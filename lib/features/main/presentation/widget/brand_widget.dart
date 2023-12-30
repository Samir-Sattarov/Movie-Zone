import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  final String imageForViewUrl;
  final String fullLogoUrl;
  final Function(String) onTap;
  const BrandWidget({Key? key, required this.imageForViewUrl, required this.onTap, required this.fullLogoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(fullLogoUrl);
      },
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(imageForViewUrl ),
          ),
        ),
        width: 82.r,
        height: 82.r,
      ),
    );
  }
}
