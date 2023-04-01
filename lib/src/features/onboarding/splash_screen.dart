import 'dart:async';

import 'package:findme/src/core/navigation/navigation_1.0.dart';
import 'package:findme/src/features/home/views/home_screen.dart';
import 'package:findme/src/shared/res/assets_icons.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterSessionTime();
    super.initState();
  }

  static void navigateAfterSessionTime() {
    Timer(const Duration(seconds: 3), () {
      AppNavigator.pushAndRemoveUtil(const Dash());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          mAlogoIcon,
          height: 50,
          width: 270,
        ),
      ),
    );
  }
}
