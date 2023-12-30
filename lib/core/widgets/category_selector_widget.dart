import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../features/main/domain/entities/choice_entity.dart';

class CategorySelectorWidget extends StatefulWidget {
  final List<ChoiceEntity> listData;
  final Function(String categoryId) onTap;
  final bool isTransparent;
  const CategorySelectorWidget({Key? key, required this.listData, required this.onTap,   this.isTransparent = false})
      : super(key: key);

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: List.generate(widget.listData.length, (index) {
          final element = widget.listData[index];
          return Padding(
            padding: EdgeInsets.only(right: 4.w),
            child:  _item(
              onTap:() {
                 setState(() => currentIndex= index);
                 widget.onTap.call(element.categoryId);

              },
              title: element.title,
              isActive: index == currentIndex, isTransparent: widget.isTransparent,
            ),
          );
        }),
      ),
    );
  }

  _item({
    required String title,
    required bool isActive,
    required bool isTransparent,
    required VoidCallback onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.r),
          color: !isActive ? isTransparent ?Colors.transparent :const Color(0xFF0F1111) : Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? const Color(0xFF191B1C) : Colors.white,
            fontSize: 14,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
