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
              color: Color.fromARGB(255, 0, 0, 0)),
          headlineMedium: TextStyle(
              height: 1,
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700), //updated
          headlineSmall: TextStyle(
              height: 1.3,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          displayLarge: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700), //updated
          displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700), //updated
          displaySmall: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700), //updated
          titleLarge: TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 17.16,
              fontWeight: FontWeight.w600), //updated
          titleMedium: TextStyle(
              height: 1.5,
              color: Colors.grey, //updated
              fontSize: 14,
              fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: Color.fromRGBO(42, 45, 52, 1),
              height: 1.5,
              fontSize: 14,
              fontWeight: FontWeight.w600), //updated
          bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700), //updated
          bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 15.02,
              height: 1.5,
              fontWeight: FontWeight.w400), //updated
          bodySmall: TextStyle(
              color: Colors.white,
              fontSize: 12,
              height: 1.3,
              fontWeight: FontWeight.w500), //updated
          labelLarge: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(42, 45, 52, 1),
              fontSize: 12),
          labelMedium: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 236, 34, 34),
              fontSize: 10),
          labelSmall: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 225, 207, 28),
              fontSize: 10)),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 23, 101, 174),
              fontSize: 17,
              fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.all(15)),
      textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              foregroundColor: const Color.fromARGB(255, 23, 101, 174),
              disabledBackgroundColor: Colors.blue.shade300,
              disabledForegroundColor: Colors.white60,
              textStyle:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              backgroundColor: const Color(0xff30C5FF),
              disabledBackgroundColor: Colors.blue.shade200,
              disabledForegroundColor: Colors.white10,
              textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              foregroundColor: const Color.fromARGB(255, 49, 65, 77),
              disabledForegroundColor: Colors.black45,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      }));
}
