import 'package:favresume/screens/activities/main_activity.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor('F0C30F'),
        accentColor: Colors.white,
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
              color: HexColor('F0C30F'),
              fontWeight: FontWeight.bold,
              fontSize: 50
          ),

          headline2: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 15
          ),

          headline3: GoogleFonts.openSansCondensed(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 50,
            letterSpacing: 2
          ),
        ),
      ),
      home: MainActivity(),
    );
  }
}

