import 'package:flutter/material.dart';

final appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 246, 247, 255),
        scrolledUnderElevation: 0.0,
        titleTextStyle:
            TextStyle(fontSize: 16, color: Color.fromARGB(255, 20, 25, 69))),
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 255),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Inter'),
      bodyMedium: TextStyle(fontFamily: 'Inter'),
      bodySmall: TextStyle(fontFamily: 'Inter'),
    ));
