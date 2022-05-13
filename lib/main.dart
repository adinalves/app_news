import 'package:app_news/screens/home.dart';
import 'package:app_news/style/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App News',
    theme: ThemeData(
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackgroundColor,
      ),
      scaffoldBackgroundColor: kBackgroundColor,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: primaryTextColor),
      ),
    ),
    home: HomePage(),
  ));
}
