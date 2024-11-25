import 'package:flutter/material.dart';

import 'package:app_desafio/app/theme/color_theme.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primary,
      body: Center(
        child: SvgPicture.asset(
          'assets/BeTalent.svg',
          width: 200,
          height: 40,
        ),
      ),
    );
  }
}
