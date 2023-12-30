import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/screens/home_screen.dart';
import 'features/main/presentation/screens/library_screen.dart';
import 'features/main/presentation/screens/movie_detail_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: const HomeScreen(),
      // child: LibraryScreen(
      //   entity: MovieEntity(
      //     description:
      //         "Oppenheimer is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim... ",
      //     title: 'Oppenheimer',
      //     imageUrl:
      //         'https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg',
      //     overall: 100,
      //     time: '1h 32m',
      //     createdAt: DateTime.now(),
      //   ),
      // ),
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
