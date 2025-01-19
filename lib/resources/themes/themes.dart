import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: const Color(0xffFF7628),
      primaryColorLight: const Color(0xffFFFFFF),
      primaryColorDark: const Color(0xff000000),
      disabledColor: Colors.grey,
      focusColor: const Color(0xff1D535D),
      colorScheme: const ColorScheme.light(
          error: Color(0xffFE0000), primary: Color(0xffD0A2F7)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1D535D),
              minimumSize: const Size(double.maxFinite, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)))),
      inputDecorationTheme: InputDecorationTheme(
        // prefixIconColor: Color(0xff0165FC),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.0))),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 67, 70, 74)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xffFF7628)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xffFF7628),
      ),
    );
  }
}
