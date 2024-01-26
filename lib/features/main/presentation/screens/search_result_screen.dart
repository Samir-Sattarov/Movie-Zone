import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/use_debounce.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:movie_zone/features/main/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/widget/genre_widget.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/widgets/error_flash_bar.dart';
import '../../../../core/widgets/poster_widget.dart';
import '../../../../core/widgets/posters_view_widget.dart';
import '../../../../core/widgets/tv_view_widget.dart';
import '../../../../locator/locator.dart';
import '../cubit/genres/genres_cubit.dart';
import '../cubit/movies/movies_cubit.dart';
import '../cubit/search/search_movies_cubit.dart';
import '../cubit/tv/tv_cubit.dart';

class SearchResultsScreen extends StatefulWidget {
  static route({required String query}) =>
      MaterialPageRoute(
        builder: (context) =>
            SearchResultsScreen(
              query: query,
            ),
      );

  final String query;

  const SearchResultsScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late TextEditingController controllerSearch;

  final UseDebounce _debounce = UseDebounce(milliseconds: 250);

  @override
  void initState() {
    controllerSearch = TextEditingController();

    controllerSearch.text = widget.query;

    BlocProvider.of<SearchMoviesCubit>(context).load(query: widget.query);

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 41.h,
                        child: TextFormFieldWidget(
                          controller: controllerSearch,
                          hint: 'search',
                          onChanged: (query) {
                            _debounce.run(() {
                              BlocProvider.of<SearchMoviesCubit>(context)
                                  .load(query: query);
                            });
                          },
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
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
                    builder: (context, state) {
                  
                      if(state is SearchLoaded) {
                        final movies= state.results.movies;
                        return  DelayedDisplay(
                          delay: const Duration(milliseconds: 40),
                          slidingBeginOffset: const Offset(-1, 0),
                          fadeIn: true,
                          slidingCurve: Curves.easeInCubic,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                  
                              if(movie.imageUrl.isEmpty) return const SizedBox();
                              final imageUrl =
                                  "${ApiConstants.imageApiUrl}${movie.imageUrl}";
                  
                              return Padding(
                                padding:   EdgeInsets.only(bottom: 20.h),
                                child: PosterWidget(
                                  height: 300.h,
                                  hasNewEpisodes: false,
                                  url: imageUrl,
                                )
                                    .animate()
                                    .fade(duration: 500.ms)
                                    .slideX(curve: Curves.easeInOutQuad)
                                    .slideY(),
                              );
                            },
                          ),
                        );
                      }
                  
                      return const Center(child: LoadingWidget());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
