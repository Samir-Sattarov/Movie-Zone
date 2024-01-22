import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/storage_keys.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'core/utils/secure_storage.dart';
import 'features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'features/auth/presentation/cubit/session/session_cubit.dart';
import 'features/auth/presentation/screens/on_boarding_screen.dart';
import 'features/main/presentation/cubit/current_user/current_user_cubit.dart';
import 'features/main/presentation/cubit/genres/genres_cubit.dart';
import 'features/main/presentation/cubit/movies/movies_cubit.dart';
import 'features/main/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'features/main/presentation/screens/main_screen.dart';
import 'locator/locator.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late AuthCubit authCubit;
  late SessionCubit sessionCubit;
  late GenresCubit genresCubit;
  late MoviesCubit moviesCubit;
  late PopularMoviesCubit popularMoviesCubit;
  late SecureStorage secureStorage;
  late CurrentUserCubit currentUserCubit;

  @override
  void initState() {
    authCubit = locator();
    moviesCubit = locator();
    popularMoviesCubit = locator();
    sessionCubit = locator();
    secureStorage = locator();
    genresCubit = locator();
    currentUserCubit = locator();

    initalize();
    super.initState();
  }

  initalize() async {
    await SecureStorage().save(
      key: StorageKeys.kToken,
      value:
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjhiYjdlNjcxZGI5MDk4YzkyODIwNzI2YzFlMzNmMyIsInN1YiI6IjY1OTI5OTU5NjUxZmNmNWYxMzhlYjg3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pdqI_L93K4mexvxfX3KxhY43wEH6bCybCYHhuR1PaOw",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: moviesCubit),
        BlocProvider.value(value: popularMoviesCubit),
        BlocProvider.value(value: genresCubit),
        BlocProvider.value(value: currentUserCubit),
        BlocProvider.value(value: sessionCubit..checkSession()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<SessionCubit, SessionState>(
          // bloc: BlocProvider.of<SessionCubit>(context)..checkSession(),
          builder: (context, state) {
            if (state is SessionActive) {
              return const MainScreen();
            } else if (state is SessionDisabled) {
              return const OnBoardingScreen();
            }

            return const LoadingWidget();
          },
        ),
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
      ),
    );
  }
}
