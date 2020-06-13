
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello and welcome',
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w100,
                            fontSize: 20
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 15.0,),

                  Text(
                    'Tech Resume Problem Solved',
                    style: GoogleFonts.mukta(
                      color: Theme.of(context).primaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 15.0,),

                  Text(
                    'Click Next To Begin',
                    style: GoogleFonts.raleway(
                        color: Theme.of(context).accentColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w100
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
