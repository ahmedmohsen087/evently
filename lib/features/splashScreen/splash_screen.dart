import 'dart:async';

import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingStart);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
              image: AssetImage(
                AppAssets.splashLogo,
              ),
              height: mediaQuery.size.height * 0.25),
        ]),
      ),
    );
  }
}
