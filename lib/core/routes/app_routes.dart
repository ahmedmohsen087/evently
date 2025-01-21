import 'package:evently/features/register/register_screen.dart';
import 'package:flutter/material.dart';

import '../../features/onBoarding/onboarding_screen.dart';
import '../../features/signIn/sign_in_screen.dart';
import '../../features/splashScreen/splash_screen.dart';

class AppRoutes {
  static const String splash = SplashScreen.routeName;
  static const String onBoarding = OnboardingScreen.routeName;
  static const String signIn = SignInScreen.routeName;
  static const String register = RegisterScreen.routeName;

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      onBoarding: (context) => const OnboardingScreen(),
      signIn: (context) => const SignInScreen(),
      register: (context) => const RegisterScreen(),
    };
  }
}
