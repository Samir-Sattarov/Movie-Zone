import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'package:movie_zone/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_up_part_one.dart';
import 'features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'features/auth/presentation/cubit/session/session_cubit.dart';
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

  @override
  void initState() {
    authCubit= locator();
    sessionCubit= locator();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: sessionCubit..checkSession()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<SessionCubit, SessionState>(
          // bloc: BlocProvider.of<SessionCubit>(context)..checkSession() ,
          builder: (context, state) {



            if(state is SessionActive) {
              return const MainScreen();

            }
            else if (state is SessionDisabled) {
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
