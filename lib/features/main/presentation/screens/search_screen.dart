import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/category_selector_widget.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/widget/genre_widget.dart';
import 'package:movie_zone/features/main/presentation/widget/library_item_widget.dart';

import '../../../../core/widgets/poster_widget.dart';
import '../../domain/entities/choice_entity.dart';

class SearchScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      );

  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controllerSearch;

  @override
  void initState() {
    controllerSearch = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 41.h,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormFieldWidget(
                      controller: controllerSearch,
                      hint: 'search',
                      leadingIcon: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.tSearchIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "genres".tr(),
                        style: const TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 24,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      mainAxisExtent: 100.h,
                    ),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const GenreWidget(
                          url:
                              "https://i.pinimg.com/564x/d6/34/66/d634660d4d1ea2b5ebd3e92282afa9fe.jpg",
                          title: "Retro");
                    },
                  ),
                  SizedBox(height: 32.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 40),
                    slidingBeginOffset: const Offset(-1, 0),
                    fadeIn: true,
                    child: Text(
                      "suggestedForYou".tr(),
                      style: const TextStyle(
                        color: Color(0xFFEEEFF0),
                        fontSize: 24,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 40),
                    slidingBeginOffset: const Offset(-1, 0),
                    fadeIn: true,
                    child: SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: const DelayedDisplay(
                              delay: Duration(milliseconds: 5),
                              slidingBeginOffset: Offset(-1, 0),
                              fadeIn: true,
                              child: PosterWidget(
                                width: 158,
                                hasNewEpisodes: true,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
