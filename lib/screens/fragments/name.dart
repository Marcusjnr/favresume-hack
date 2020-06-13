import 'dart:html';

import 'package:event_bus/event_bus.dart';
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameScreen extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  NameScreen({
    @required this.firstNameController,
    @required this.lastNameController
});

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Names', style: GoogleFonts.montserrat(
              color: HexColor('F0C30F'),
              fontWeight: FontWeight.bold,
              fontSize: responsiveFontSize(mediaQuery)
          ),),

          SizedBox(height: 50,),

          AppTextField(
            hintText: 'First Name',
            controller: widget.firstNameController,
          ),

          SizedBox(height: 50,),

          AppTextField(
            hintText: 'Last Name',
            controller: widget.lastNameController,
          ),
        ],
      ),
    );
  }
}



