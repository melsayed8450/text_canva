import 'package:flutter/material.dart';
import 'package:text_canva/view/home/home_landscape.dart';
import 'package:text_canva/view/home/home_portrait.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, orientation) {
        if (orientation == Orientation.landscape) {
          return const HomeLandscape();
        }
        return HomePortrait();
      },
    );
  }
}
