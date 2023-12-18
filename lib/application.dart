import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/presentation/screens/home_screen.dart';

import 'features/auth/presentation/screens/on_boarding_screen.dart';
import 'features/auth/presentation/screens/sign_in_part_one.dart';
import 'features/auth/presentation/screens/sign_in_part_three.dart';
import 'main.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: const SignInScreenPartThree(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Movie Zone',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff0F1111),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
        );
      },
    );
  }
}
