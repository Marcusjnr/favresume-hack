

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final int maxLines;
  final TextInputType type;
  final TextEditingController controller;

  AppTextField({
    @required this.hintText,
    @required this.controller,
    this.labelText,
    this.maxLines = 1,
    this.type,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.transparent,
        border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: widget.type,
          maxLines: widget.maxLines,
          controller: widget.controller,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.white,
            ),
            hintStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
