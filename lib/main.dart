import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/theme/app_theme_manger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
      theme: AppThemeManger.lightTheme,
    );
  }
}
