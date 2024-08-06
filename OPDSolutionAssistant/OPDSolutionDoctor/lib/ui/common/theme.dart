import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData activeTheme() {
  return ThemeData(
    fontFamily: "Lato",
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 55, 172, 255),
        background: Colors.white),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 34,
          color: Color.fromARGB(255, 3, 116, 237)),
      headlineMedium: TextStyle(
          color: Color.fromARGB(255, 225, 255, 255),
          fontSize: 26,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          color: Color.fromARGB(255, 14, 14, 15),
          fontWeight: FontWeight.w700,
          fontSize: 20),
      bodyLarge: TextStyle(
          color: Color.fromARGB(255, 14, 14, 15),
          fontSize: 20,
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          color: Color.fromARGB(255, 14, 14, 15),
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: Color.fromARGB(255, 23, 24, 26),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 18,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 16,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: Color.fromARGB(255, 23, 24, 26),
          fontSize: 20,
          fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          color: Color.fromARGB(255, 3, 116, 237),
          fontSize: 18,
          fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
          color: Color.fromARGB(255, 23, 24, 26),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    }),
  );
}
