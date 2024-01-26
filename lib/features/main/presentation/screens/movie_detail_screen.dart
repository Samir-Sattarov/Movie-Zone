import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/posters_view_widget.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/core/widgets/poster_widget.dart';
import 'package:movie_zone/features/main/presentation/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/suggested_movie/suggested_movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/widget/trailer_widget.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/utils/assets.dart';

class MovieDetailScreen extends StatefulWidget {
  static route({required int id}) => MaterialPageRoute(
        builder: (context) => MovieDetailScreen(
          id: id,
        ),
      );

  final int id;

  const MovieDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  List<MovieEntity> suggestedMovies = [];

  @override
  void initState() {
    BlocProvider.of<MovieDetailCubit>(context).load(id: widget.id);
    BlocProvider.of<SuggestedMoviesCubit>(context).load(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: const Color(0xFF0F1111),
      body: BlocListener<SuggestedMoviesCubit, SuggestedMoviesState>(
        listener: (context, state) {
          if (state is SuggestedMoviesLoaded) {
            suggestedMovies = state.results.movies;
          }
        },
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.detail;
              print("Id ${movieDetail.id}");
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
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
                                  "${ApiConstants.imageApiUrl}${movieDetail.imageUrl}",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF0F1111),
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Color(0xFF0F1111),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        DateTime.parse(movieDetail.releaseDate)
                                            .year
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xFFEEEFF0),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _getDuration(movieDetail.runtime),
                                        style: const TextStyle(
                                          color: Color(0xFFEEEFF0),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                SizedBox(height: 24.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: SvgPicture.asset(
                                            Assets.tArrowLeftIcon),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(Assets.tAddListIcon),
                                      SizedBox(width: 8.w),
                                      SvgPicture.asset(Assets.tShareIcon),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          ButtonWidget(
                            iconData: const Icon(Icons.play_arrow_rounded),
                            title: "startWatching".tr(),
                            height: 48.h,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ReadMoreText(
                        movieDetail.description,
                        trimLines: 3,
                        colorClickableText: Colors.white,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: const TextStyle(
                          color: Color(0xFFB9BFC1),
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                        moreStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    PostersViewWidget(
                      title: "basedOnOpenedFilm".tr(args: [movieDetail.title]),
                      movies: suggestedMovies,
                      onTap: (id) {},
                    ),
                    SizedBox(height: 68.h),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  String _getDuration(int runtime) {
    final hour = runtime ~/ 60;
    final minute = runtime % 60;

    return "${hour}h ${minute}m";
  }
}
