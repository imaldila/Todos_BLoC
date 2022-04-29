import 'package:flutter/material.dart';

const TextStyle kTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kThemeColor = Color(0xFF000A1F);

ThemeData kThemeData = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: kThemeColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    color: kThemeColor,
  ),
);
