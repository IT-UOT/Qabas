import 'package:flutter/material.dart';

class Consts {
  /// Colors
  static const MaterialColor primaryColor =
  MaterialColor(_primaryColorValue, <int, Color>{
    50: Color(0xFFEEE6FA),
    100: Color(0xFFD4C1F3),
    200: Color(0xFFB798EC),
    300: Color(0xFF9A6EE4),
    400: Color(0xFF854FDE),
    500: Color(_primaryColorValue),
    600: Color(0xFF672BD4),
    700: Color(0xFF5C24CE),
    800: Color(0xFF521EC8),
    900: Color(0xFF4013BF),
  });
  static const int _primaryColorValue = 0xFF6F30D8;

  static const MaterialColor accentColor =
  MaterialColor(_accentValue, <int, Color>{
    100: Color(0xFFF2EFFF),
    200: Color(_accentValue),
    400: Color(0xFFA389FF),
    700: Color(0xFF906FFF),
  });
  static const int _accentValue = 0xFFCBBCFF;

  /// Paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  /// Sizes
  static const double defaultBorderRadius = 12.0;
  static const double defaultBorderWidth = 2.0;
  static const double defaultElevation = 0.0;
  static const double defaultIconSize = 24.0;
  static const double defaultIconSizeSmall = 16.0;
  static const double defaultIconSizeLarge = 32.0;
 // static const double defaultVerticalSpacing = 16.0;
 // static const double defaultHorizontalSpacing = 16.0;

  /// Themes
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Alexandria',
    useMaterial3: true,
    colorScheme:  ColorScheme.fromSeed(seedColor: const Color(_primaryColorValue)),
    expansionTileTheme: const ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:  Color(0xffD1DAE9),
          width: defaultBorderWidth,
        ),
        borderRadius:  BorderRadius.all(Radius.circular(Consts.defaultBorderRadius)),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(
          color:  Color(0xffD1DAE9),
          width: defaultBorderWidth,
        ),
        borderRadius:  BorderRadius.all(Radius.circular(Consts.defaultBorderRadius)),
      ),
    ),
    cardTheme:const CardTheme(
      elevation: defaultElevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:  Color(0xffD1DAE9),
          width: defaultBorderWidth,
        ),
        borderRadius:  BorderRadius.all(Radius.circular(Consts.defaultBorderRadius)),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.black,
      ),
      bodyMedium : TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 12,
           color: Color(0xff898F9B)),
    )
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Alexandria',
    useMaterial3: true,
    colorScheme:  ColorScheme.fromSeed(seedColor: const Color(_primaryColorValue)).copyWith(
      brightness: Brightness.dark,
    ),
  );
}
