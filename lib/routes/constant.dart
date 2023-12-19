import 'package:e_store_app/app/application/export.dart';
import 'package:e_store_app/app/auth/export.dart';
import 'package:e_store_app/app/auth/views/otp/otp_screen.dart';
import 'package:e_store_app/app/splash/intro_screen.dart';
import 'package:e_store_app/app/splash/splash_screen.dart';
import 'package:e_store_app/routes/initialRoute.dart';
import 'package:e_store_app/routes/routes_name.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  RoutesName.initialRoute: (context) => const InitialRoute(),
  RoutesName.application: (context) => ApplicationScreen(),
  RoutesName.home: (context) => const HomeScreen(),
  RoutesName.signIn: (context) => SignIn(),
  RoutesName.signUp: (context) => SignUp(),
  RoutesName.forgotPassword: (context) => const ForgotPassword(),
  RoutesName.otp: (context) => OTPScreen(),
  RoutesName.home: (context) => const HomeScreen(),
  RoutesName.search: (context) => const SearchScreen(),
  RoutesName.profile: (context) => const ProfileScreen(),
  RoutesName.notification: (context) => const NotificationScreen(),
  RoutesName.detailScreen: (context) => const DetailScreen(),
  RoutesName.menu: (context) => const MenuScreen(),
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.introScreen: (context) => IntroScreen(),
};
