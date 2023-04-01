import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static final AppNavigator instance = AppNavigator._();
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void dismissKeyboard_1() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void popSheet({BuildContext? context, dynamic routeMessage = ""}) {
    Navigator.pop(navigatorKey?.currentContext! ?? context!, routeMessage);
  }

  void closeDialog() {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).pop();
  }

  static Future push(dynamic routeClass) {
    return Navigator.push(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void pushAndReplace(dynamic routeClass) {
    Navigator.pushReplacement(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void pushAndRemoveUtil(dynamic routeClass) {
    Navigator.pushAndRemoveUntil(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
  }

  static navigateWithoutBottomNav(dynamic routeClass) {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).push(
      CupertinoPageRoute(builder: (context) => routeClass),
    );
  }
}
