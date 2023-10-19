import 'package:flutter/material.dart';
import 'package:weather_app/gen/colors.gen.dart';

const defaultLetterSpacing = 0.03;
const mediumLetterSpacing = 0.04;
const largeLetterSpacing = 1.0;

final ThemeData defaultTheme = ThemeData(
  primarySwatch: MaterialColor(ColorName.primaryColor.value, const <int, Color>{
    50: ColorName.primaryColor,
    100: ColorName.primaryColor,
    200: ColorName.primaryColor,
    300: ColorName.primaryColor,
    400: ColorName.primaryColor,
    500: ColorName.primaryColor,
    600: ColorName.primaryColor,
    700: ColorName.primaryColor,
    800: ColorName.primaryColor,
    900: ColorName.primaryColor,
  }),
  scaffoldBackgroundColor: ColorName.backgroundColorPrimary,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    elevation: 0,
    color: ColorName.backgroundColorPrimary,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: ColorName.primaryColor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorName.backgroundColorPrimary,
    selectedItemColor: ColorName.primaryColor,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorName.primaryColor,
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
