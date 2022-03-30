import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF546e7a),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
