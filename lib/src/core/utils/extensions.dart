import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get getTextTheme => appTheme.textTheme;
}
