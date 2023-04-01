import 'package:flutter/material.dart';

import 'res.dart';

abstract class PThemes {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: PColors.primaryColor,
        scaffoldBackgroundColor: PColors.white,
        primaryColorDark: PColors.primaryColor,
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ))),
        textTheme: TextTheme(
          bodySmall: PTypo.smallTextStyle,
          bodyMedium: PTypo.mediumTextStyle,
          bodyLarge: PTypo.largeTextStyle,
          labelSmall: PTypo.smallTextStyle.copyWith(
            fontFamily: PStrings.boldFontName,
          ),
          labelMedium: PTypo.mediumTextStyle.copyWith(
            fontFamily: PStrings.boldFontName,
          ),
          labelLarge: PTypo.largeTextStyle.copyWith(
            fontFamily: PStrings.boldFontName,
          ),
          displaySmall: PTypo.smallTextStyle
              .copyWith(fontFamily: PStrings.regularFontName),
          displayMedium: PTypo.mediumTextStyle
              .copyWith(fontFamily: PStrings.regularFontName),
          displayLarge: PTypo.largeTextStyle
              .copyWith(fontFamily: PStrings.regularFontName),
        ));
  }
}
