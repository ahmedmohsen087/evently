import 'package:evently/features/home_screen/home_screen.dart';
import 'package:evently/features/register/register_screen.dart';
import 'package:flutter/material.dart';

import '../../features/forgetPassword/forget_password.dart';
import '../../features/onBoarding/pages/onboarding_screen.dart';
import '../../features/onBoarding/pages/onbording_start_screen.dart';
import '../../features/signIn/sign_in_screen.dart';
import '../../features/splashScreen/splash_screen.dart';

class AppRoutes {
  static const String splash = SplashScreen.routeName;
  static const String signIn = SignInScreen.routeName;
  static const String register = RegisterScreen.routeName;
  static const String forgetPassword = ForgetPassword.routeName;
  static const String onboardingStart = OnboardingStartScreen.routeName;
  static const String onboardingScreen = OnboardingScreen.routeName;
  static const String homeScreen = HomeScreen.routeName;

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      signIn: (context) => const SignInScreen(),
      register: (context) => const RegisterScreen(),
      forgetPassword: (context) => const ForgetPassword(),
      onboardingStart: (context) => const OnboardingStartScreen(),
      onboardingScreen: (context) => const OnboardingScreen(),
      homeScreen: (context) => const HomeScreen(),
    };
  }
}
