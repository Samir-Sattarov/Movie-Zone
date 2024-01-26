import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/api/api_constants.dart';
import 'package:movie_zone/core/utils/extentions.dart';
import 'package:movie_zone/core/widgets/category_selector_widget.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/tv/tv_cubit.dart';
import 'package:movie_zone/features/main/presentation/screens/brand_detail_screen.dart';
import 'package:movie_zone/features/main/presentation/screens/movie_detail_screen.dart';
import 'package:movie_zone/features/main/presentation/widget/brand_widget.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/posters_view_widget.dart';
import '../../../../core/widgets/tv_view_widget.dart';
import '../../domain/entities/choice_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/tv_entity.dart';
import '../cubit/popular_movies/popular_movies_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieEntity> discoverMovies = [];
  List<MovieEntity> popularMovies = [];
  List<TvEntity> tvSeries = [];

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    BlocProvider.of<MoviesCubit>(context).load();
    BlocProvider.of<PopularMoviesCubit>(context).load();
    BlocProvider.of<TvCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1111),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PopularMoviesCubit, PopularMoviesState>(
            listener: (context, state) {
              if (state is PopularMoviesLoaded) {
                popularMovies = state.results.movies;
                if (mounted) {
                  Future.delayed(
                    Duration.zero,
                    () {
                      setState(() {});
                    },
                  );
                }
              }
            },
          ),
          BlocListener<MoviesCubit, MoviesState>(
            listener: (context, state) {
              if (state is MoviesLoaded) {
                discoverMovies = state.results.movies;
              }
            },
          ),
          BlocListener<TvCubit, TvState>(
            listener: (context, state) {
              if (state is TvLoaded) {
                tvSeries = state.results.tvs;
                if (mounted) {
                  Future.delayed(
                    Duration.zero,
                    () {
                      setState(() {});
                    },
                  );
                }
              }
            },
          ),
        ],
        child: SingleChildScrollView(
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
                          BlocBuilder<MoviesCubit, MoviesState>(
                            builder: (context, state) {
                              print("state $state");
                              if (state is MoviesLoaded) {
                                final movies = state.results.movies;
                                final len = movies.length;
                                final movie = movies[Random().nextInt(len)];
                                return Image.network(
                                  "${ApiConstants.imageApiUrl}${movie.imageUrl}",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                )..preload();
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              );
                            },
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
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  return PostersViewWidget(
                    title: "discover",
                    movies: discoverMovies,
                    onTap: (int id) {
                      Navigator.push(context, MovieDetailScreen.route(id: id));

                    },
                  );
                },
              ),
              SizedBox(height: 32.h),
              PostersViewWidget(
                title: "popularMovies",
                movies: popularMovies,
                onTap: (int id) {
                  Navigator.push(context, MovieDetailScreen.route(id: id));

                },
              ),
              SizedBox(height: 32.h),
              TvsViewWidget(
                title: "tvSeries",
                tvs: tvSeries,
              ),
              //// Brands
              // Padding(
              //   padding: EdgeInsets.only(left: 20.w),
              //   child: DelayedDisplay(
              //     delay: const Duration(milliseconds: 40),
              //     slidingBeginOffset: const Offset(-1, 0),
              //     fadeIn: true,
              //     child: Text(
              //       "brands".tr(),
              //       style: const TextStyle(
              //         color: Color(0xFFEEEFF0),
              //         fontSize: 24,
              //         fontFamily: 'SF Pro Display',
              //         fontWeight: FontWeight.w700,
              //         height: 0,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20.h),
              // SizedBox(
              //   height: 82.h,
              //   child: ListView.builder(
              //     physics: const ClampingScrollPhysics(),
              //     itemCount: 1,
              //     itemBuilder: (context, index) {
              //       const logoUrl =
              //           "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg";
              //       return Padding(
              //         padding: EdgeInsets.only(
              //           right: 12.w,
              //           left: index == 0 ? 20.w : 0,
              //         ),
              //         child: Hero(
              //           tag: logoUrl.hashCode,
              //           child: BrandWidget(
              //             imageForViewUrl:
              //                 "https://i.pinimg.com/564x/55/3f/6b/553f6b41975bf39b3022f43c9abc1ef3.jpg",
              //             fullLogoUrl: logoUrl,
              //             onTap: (p0) {
              //               Navigator.push(
              //                 context,
              //                 BrandDetailScreen.route(logoUrl: p0),
              //               );
              //             },
              //           ),
              //         ),
              //       );
              //     },
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //   ),
              // ),
              // SizedBox(height: 32.h),
              SizedBox(height: 200.h),
            ],
          ),
        ),
      ),
    );
  }
}
