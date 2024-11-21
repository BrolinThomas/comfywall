import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      inversePrimary: Colors.grey.shade900,
      tertiary: Colors.white
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[800],
          displayColor: Colors.black,
        ));
