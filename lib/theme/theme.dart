import 'package:flutter/material.dart';

//light theme ----------------------------------
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffFCFDF6),

  //appbar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffFCFDF6),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

  //textField theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xffe1eedf),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.black87,
      ),
    ),
  ),

  // divider
  dividerColor: Colors.black12,
);

//dark theme ----------------------------------
ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff1A1C19),

  //appbar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1A1C19),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  //textField theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xff454f45),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.black87,
      ),
    ),
  ),

  // divider
  dividerColor: const Color(0xff777777),
);

TextStyle descriptionStyle(context) {
  final platformBrightness = MediaQuery.platformBrightnessOf(context);
  return TextStyle(
    color: platformBrightness == Brightness.dark
        ? const Color(0xffBBBBBB)
        : Colors.grey.shade800,
  );
}
