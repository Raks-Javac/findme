import 'package:findme/src/core/navigation/navigation_1.0.dart';
import 'package:findme/src/features/onboarding/splash_screen.dart';
import 'package:findme/src/shared/res/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'findMe',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
      theme: PThemes.lightTheme,
      home: const SplashScreen(),
    );
  }
}
