import 'package:flutter/material.dart';
import 'package:weather_app/gen/colors.gen.dart';

const defaultLetterSpacing = 0.03;
const mediumLetterSpacing = 0.04;
const largeLetterSpacing = 1.0;

final ThemeData defaultTheme = ThemeData(
  scaffoldBackgroundColor: ColorName.backgroundColorPrimary,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    elevation: 0,
    color: ColorName.backgroundColorPrimary,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorName.backgroundColorPrimary,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
  ),
  textTheme: _buildTextTheme(),
);

TextTheme _buildTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  ).apply(displayColor: Colors.black, bodyColor: Colors.black);
}
