import 'package:bloggios_mart/Constants/global-variables.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: GlobalVariables.lightBackgroundColor,
        // textTheme: Typography.blackCupertino,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: GlobalVariables.secondaryColor)),
        colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: GlobalVariables.darkBackGroundColor,
        textTheme: Typography.whiteCupertino,
        colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
}
