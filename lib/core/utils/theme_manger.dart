// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_manger.dart';
// Project imports:

abstract class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    bottomAppBarColor: Colors.white,

    /// TEXT THEME

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        // fontSize: 13,
        color: Colors.black,
      ),
    ),

    /// BOTTOM NAVIGATION BAR ITEM

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    /// APPBAR THEME
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: mainColor,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: mainColor,
    ),

    /// CARD THEME
    cardTheme: CardTheme(
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: mainColor,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    bottomAppBarColor: Colors.white,

    /// TEXT THEME

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        // fontSize: 13,
        color: Colors.black,
      ),
    ),

    /// BOTTOM NAVIGATION BAR ITEM

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    /// APPBAR THEME

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkGreyClr,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: darkGreyClr,
    ),

    /// CARD THEME

    cardTheme: CardTheme(
      elevation: 10,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );
}
