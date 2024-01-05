import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/widgets/category_selector_widget.dart';
import 'package:movie_zone/features/main/presentation/screens/brand_detail_screen.dart';
import 'package:movie_zone/features/main/presentation/widget/brand_widget.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/posters_view_widget.dart';
import '../../domain/entities/choice_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChoiceEntity> listChoses = const [
    ChoiceEntity(
      title: "All",
      categoryId: '',
    ),
    ChoiceEntity(
      title: "TV Series",
      categoryId: '',
    ),
    ChoiceEntity(
      title: "Actions",
      categoryId: '',
    ),
    ChoiceEntity(
      title: "Asian",
      categoryId: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1111),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 370.h,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 370.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.network(
                          "https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff111111),
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Color(0xff111111),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CategorySelectorWidget(
                                  listData: listChoses,
                                  isTransparent: true,
                                  onTap: (categoryId) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const PostersViewWidget(title: "popularMovies", movies: []),
            SizedBox(height: 32.h),
            const PostersViewWidget(title: "tvSeries", movies: []),
            SizedBox(height: 32.h),

            Padding(
              padding:   EdgeInsets.only(left: 20.w),
              child: DelayedDisplay(
                delay: const Duration(milliseconds: 40),
                slidingBeginOffset: const Offset(-1, 0),
                fadeIn: true,
                child: Text(
                  "brands".tr(),
                  style: const TextStyle(
                    color: Color(0xFFEEEFF0),
                    fontSize: 24,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 82.h,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  const logoUrl =
                      "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg";
                  return Padding(
                    padding: EdgeInsets.only(
                        right: 12.w, left: index == 0 ? 20.w : 0,),
                    child: Hero(
                      tag: logoUrl.hashCode,
                      child: BrandWidget(
                        imageForViewUrl:
                        "https://i.pinimg.com/564x/55/3f/6b/553f6b41975bf39b3022f43c9abc1ef3.jpg",
                        fullLogoUrl: logoUrl,
                        onTap: (p0) {
                          Navigator.push(
                            context,
                            BrandDetailScreen.route(logoUrl: p0),
                          );
                        },
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),

            SizedBox(height: 32.h),
            const PostersViewWidget(title: "sports", movies: []),
            SizedBox(height: 120.h),

          ],
        ),
      ),
    );
  }
}
