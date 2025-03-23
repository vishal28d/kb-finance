import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(50, 214, 216, .1),
  100: Color.fromRGBO(50, 214, 216, .2),
  200: Color.fromRGBO(50, 214, 216, .3),
  300: Color.fromRGBO(50, 214, 216, .4),
  400: Color.fromRGBO(50, 214, 216, .5),
  500: Color.fromRGBO(50, 214, 216, .6),
  600: Color.fromRGBO(50, 214, 216, .7),
  700: Color.fromRGBO(50, 214, 216, .8),
  800: Color.fromRGBO(50, 214, 216, .9),
  900: Color.fromRGBO(50, 214, 216, 1),
};
ThemeData nativeTheme() {
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 22, color: Color(0xff32D6D8), fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      titleMedium: TextStyle(color: Color(0xff32D6D8), fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF7853FF),
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black, size: 15),
    // primaryColor: Color(0xff32D6D8),
    primaryColor: Color(0xFFC63437),
    primarySwatch: MaterialColor(0xff32D6D8, color),
    primaryTextTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),

      displayMedium: TextStyle(
        fontSize: 13,
        color: Colors.black,
      ), //
      displaySmall: TextStyle(fontSize: 14, color: Color(0xFF8A959E)), //
      headlineMedium: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      headlineSmall: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    scaffoldBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xff32D6D8)),
      shadowColor: WidgetStateProperty.all(Colors.white),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      )),
      textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
    )),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.grey[100],
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    fontFamily: 'Roboto',
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8A8D9F), fontWeight: FontWeight.w400),
      counterStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        borderSide: BorderSide(width: 0.2, color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      filled: true,
      fillColor: Color(0xFFF4F5F7),
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    ),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 10,
        shadowColor: Color(0xff32D6D8).withOpacity(0.09),
        actionsIconTheme: IconThemeData(
          color: Color(0xff32D6D8),
        ),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black, size: 23)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            EdgeInsets.only(left: 15, right: 15),
          ),
          backgroundColor: WidgetStateProperty.all(Color(0xff32D6D8)),
          shadowColor: WidgetStateProperty.all(Colors.white),
          overlayColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
    ),
  );
}
