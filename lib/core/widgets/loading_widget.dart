import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_zone/resources/resources.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({Key? key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Animations.tLoading,
      height: size,
    );
  }
}
