import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/category_selector_widget.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/widget/library_item_widget.dart';

import '../../domain/entities/choice_entity.dart';

class LibraryScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LibraryScreen(),
      );

  const LibraryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<ChoiceEntity> listChoses = const [
    ChoiceEntity(
      title: "Movies",
      categoryId: '',
    ),
    ChoiceEntity(
      title: "Series",
      categoryId: '',
    ),
    ChoiceEntity(
      title: "TV Shows",
      categoryId: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final entity = MovieEntity(
      description:
          "Oppenheimer is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim... ",
      title: 'Oppenheimer',
      imageUrl:
          'https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg',
      overall: 100,
      releaseDate: DateTime.now(),
      id: 234234234,
    );
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: const Color(0xFF0F1111),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "myLibrary".tr(),
                    style: const TextStyle(
                      color: Color(0xFFEEEFF0),
                      fontSize: 24,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CategorySelectorWidget(
                    listData: listChoses,
                    onTap: (String categoryId) {},
                  ),
                  SizedBox(height: 32.h),
                  ...List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: LibraryItemWidget(entity: entity),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "libraryTitleDescription".tr(),
                    style: const TextStyle(
                      color: Color(0xFFB9BFC1),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
