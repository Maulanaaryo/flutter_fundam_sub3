import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xff0096ff);
const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Color(0xff6610f2);
const Color favoriteColor = Color(0xFFFF1744);

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: primaryColor,
    onPrimary: Colors.black,
    secondary: secondaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    primary: secondaryColor,
    textStyle: const TextStyle(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: darkPrimaryColor,
    onPrimary: Colors.black,
    secondary: darkSecondaryColor,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: darkSecondaryColor,
    unselectedItemColor: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0),
        ),
      ),
    ),
  ),
);