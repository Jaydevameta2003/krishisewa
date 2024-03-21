import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
        headline3: GoogleFonts.montserrat(
            color: Colors.black87,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
        headline5: GoogleFonts.montserrat(
          color: Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.bold
        )
    )
  );
  static ThemeData darkTheme = ThemeData();
}