import 'package:flutter/material.dart';

ThemeData activeTheme() {
  return ThemeData(
    fontFamily: "Raleway",
    primaryColor: const Color.fromARGB(255, 30, 160, 255),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 55, 172, 255),
        background: Colors.white),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        height: 1.5,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      headlineMedium: TextStyle(
          height: 1,
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 25,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          height: 1.3,
          color: Color.fromARGB(170, 0, 0, 0),
          fontSize: 16,
          fontWeight: FontWeight.w700),
      displayLarge: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
      displayMedium: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          color: Color.fromARGB(255, 49, 65, 77),
          fontSize: 14,
          fontWeight: FontWeight.w900),
      titleLarge: TextStyle(
          height: 1.5,
          color: Color.fromARGB(255, 23, 24, 26),
          fontSize: 20,
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          height: 1.5,
          color: Color.fromARGB(150, 0, 0, 0),
          fontSize: 15,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: Color.fromARGB(255, 49, 65, 77),
          height: 1.5,
          fontSize: 11,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          color: Color.fromARGB(255, 49, 65, 77),
          fontSize: 13,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: Color.fromARGB(255, 49, 65, 77),
          fontSize: 14,
          height: 1.5,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Color.fromARGB(255, 49, 65, 77),
          fontSize: 11,
          height: 1.3,
          fontWeight: FontWeight.w500),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 17, 160, 57),
        fontSize: 10,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 236, 34, 34),
        fontSize: 10,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 225, 207, 28),
        fontSize: 10,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
          color: Color.fromARGB(255, 23, 101, 174),
          fontSize: 17,
          fontWeight: FontWeight.w500),
      contentPadding: EdgeInsets.all(15),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        foregroundColor: const Color.fromARGB(255, 23, 101, 174),
        disabledBackgroundColor: Colors.blue.shade300,
        disabledForegroundColor: Colors.white60,
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
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
            fontSize: 20,
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
