import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/components/export.dart';
import 'package:e_store_app/public/configs/size_config.dart';
import 'package:e_store_app/public/font_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/icons/logo-app.png',
                width: getProportionateScreenWidht(width: 180),
                height: getProportionateScreenHeight(height: 180),
              ),
              Gap(getProportionateScreenHeight(height: 5)),
              AppText(
                text: 'E-Shop',
                fontSize: getFontSize(width: 30),
                fontWeight: FontWeight.bold,
                font: FontName.outfit,
              ),
            ],
          ),
        ),
      ),
      curve: Curves.bounceIn,
      duration: 3000,
      splashIconSize: getProportionateScreenHeight(height: 250),
      nextScreen: ApplicationScreen(),
    );
  }
}
