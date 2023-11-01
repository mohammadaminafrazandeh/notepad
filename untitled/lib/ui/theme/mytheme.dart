import 'package:flutter/material.dart';

class MyTheme{
  MyTheme();

  static ThemeData get myTheme => ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.teal[50],
          shape: ShapeBorder.lerp(null, Border.all(), 0.1),
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(selectedItemColor: Colors.teal[700]),
        //
        useMaterial3: true,
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      );

  static ThemeData get myDarkTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      //
      useMaterial3: true,
      //
      brightness: Brightness.dark);
}
