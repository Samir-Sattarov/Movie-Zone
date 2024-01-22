import 'package:delayed_display/delayed_display.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/text_form_field_widget.dart';
import 'package:movie_zone/features/main/presentation/widget/genre_widget.dart';

import '../../../../core/widgets/error_flash_bar.dart';
import '../cubit/genres/genres_cubit.dart';

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
    BlocProvider.of<GenresCubit>(context).load();
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
      body: BlocListener<GenresCubit, GenresState>(
        listener: (context, state) {
          if (state is GenresError) {
            ErrorFlushBar(state.message).show(context);
          }
        },
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
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
                    ),
                    SizedBox(height: 20.h),

                    BlocBuilder<GenresCubit, GenresState>(
                      builder: (context, state) {
                        if (state is GenresLoaded) {
                          final results = state.results.genres;
                          return SizedBox(
                            height: 40,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  ...List.generate(
                                    results.length,
                                    (index) {
                                      final item = results[index];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: GenreWidget(data: item),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                    SizedBox(height: 32.h),
                    // const PostersViewWidget(
                    //   title: "suggestedForYou",
                    //   path: '',
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
