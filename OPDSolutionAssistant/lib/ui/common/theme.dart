import 'package:flutter/material.dart';

import 'index.dart';

ThemeData activeTheme() {
  return ThemeData(
    fontFamily: "Lato",
    primaryColor: const Color.fromARGB(255, 30, 160, 255),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 55, 172, 255),
        background: Colors.white),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 26,
            color: Color.fromARGB(255, 23, 24, 26)),
        headlineMedium: TextStyle(
            color: Color.fromARGB(255, 23, 24, 26),
            fontSize: 18,
            fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(
            color: Color.fromARGB(255, 23, 24, 26),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: Color(0xFF17181A),
            fontSize: 12,
            fontWeight: FontWeight.w500)),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
          color: Color.fromARGB(255, 39, 36, 36),
          fontSize: 14,
          height: 1,
          fontWeight: FontWeight.w500),
      contentPadding: EdgeInsets.all(15),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        foregroundColor: primaryColor,
        disabledBackgroundColor: Colors.blue.shade300,
        disabledForegroundColor: Colors.white60,
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: const Color.fromARGB(255, 23, 101, 174),
        disabledBackgroundColor: Colors.blue.shade300,
        disabledForegroundColor: Colors.white60,
        textStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.w700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 55),
      foregroundColor: const Color.fromARGB(255, 49, 65, 77),
      disabledForegroundColor: Colors.black45,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    )),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    }),
  );
}
