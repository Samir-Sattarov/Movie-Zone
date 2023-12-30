import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/widgets/blur_container.dart';
import 'package:movie_zone/features/main/presentation/screens/brand_detail_screen.dart';
import 'package:movie_zone/features/main/presentation/screens/home_screen.dart';
import 'package:movie_zone/features/main/presentation/screens/library_screen.dart';
import 'package:movie_zone/features/main/presentation/screens/search_screen.dart';
import 'package:navigator_scope/navigator_scope.dart';

import '../../../../core/utils/assets.dart';
import '../../domain/entities/movie_entity.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const BrandDetailScreen(
        logoUrl:
            "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: AnimatedSwitcher(
      //   duration: const Duration(milliseconds: 300),
      //   switchInCurve: Curves.easeIn,
      //   switchOutCurve: Curves.easeOut,
      //   child: screens[currentIndex],
      // ),
      // extendBody: true,
      body: NavigatorScope(
        currentDestination: currentIndex,
        destinationCount: screens.length,
        destinationBuilder: (context, index) {
          return NestedNavigator(
            builder: (context) => screens[index],
          );
        },
      ),
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: BlurContainer(
            blur: 30,
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomNavigationItem(
                  isActive: currentIndex == 0,
                  iconPath: Assets.tHomeIcon,
                  onTap: () => setState(() => currentIndex = 0),
                ),
                _bottomNavigationItem(
                  isActive: currentIndex == 1,
                  iconPath: Assets.tSearchIcon,
                  onTap: () => setState(() => currentIndex = 1),
                ),
                _bottomNavigationItem(
                  isActive: currentIndex == 2,
                  iconPath: Assets.tPlayerIcon,
                  onTap: () => setState(() => currentIndex = 2),
                ),
                _bottomNavigationItem(
                  isActive: currentIndex == 3,
                  iconPath: Assets.tUserIcon,
                  onTap: () => setState(() => currentIndex = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _bottomNavigationItem({
    required bool isActive,
    required String iconPath,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        color: isActive ? Colors.white : null,
      ),
    );
  }
}
