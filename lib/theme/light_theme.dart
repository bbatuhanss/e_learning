import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kPrimary,
      onPrimary: kOnPrimary,
      secondary: kSecondary,
      onSecondary: kOnSecondary,
      surface: kSurface,
      onSurface: kOnSurface,
      background: kBackground,
      onBackground: kOnBackground,
      error: kError,
    ),
    appBarTheme: base.appBarTheme.copyWith(),
    scaffoldBackgroundColor: kBackground,
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kOnPrimary,
      selectionColor: orangeColor.withOpacity(0.5),
      selectionHandleColor: orangeColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((states) => orangeColor),
      checkColor:
          MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      side: const BorderSide(color: Color(0xffA2A2A2), width: 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor:
            MaterialStateProperty.resolveWith<Color>((states) {
      // if (states.contains(MaterialState.pressed)) {
      //   return Colors.red;
      // }
      return orangeColor;
    }), overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
      // if (states.contains(MaterialState.pressed)) {
      //   return Colors.green;
      // }
      return orangeColor;
    }), foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      // if (states.contains(MaterialState.pressed)) {
      //   return Colors.blue;
      // }
      return Colors.white;
    }), shape:
            MaterialStateProperty.resolveWith<RoundedRectangleBorder>((states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );
    }))),
    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith().apply(
        // fontFamily: 'Nunito',
        fontFamily: GoogleFonts.nunito().fontFamily,
        displayColor: kOnPrimary,
        bodyColor: kOnPrimary,
      );
}
