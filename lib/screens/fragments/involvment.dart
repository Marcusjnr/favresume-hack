import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvolvmentScreen extends StatelessWidget {
  final TextEditingController controller;

  InvolvmentScreen({
    @required this.controller,
});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Involvements', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    height: 105.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.transparent,
                        border: Border.all(color: Theme.of(context).primaryColor)),
                    child: TextField(
                      controller: controller,
                        maxLines: null,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Involvements, Please separate with a comma',
                          labelStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
