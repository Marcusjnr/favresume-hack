
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstProjectOther extends StatefulWidget {
  final TextEditingController headLineController;
  final TextEditingController descriptionController;
  final TextEditingController technologyUsedController;

  FirstProjectOther({
    @required this.headLineController,
    @required this.descriptionController,
    @required this.technologyUsedController
  });
  @override
  _FirstProjectOtherState createState() => _FirstProjectOtherState();
}

class _FirstProjectOtherState extends State<FirstProjectOther> {


  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 30,),

                  AppTextField(
                    hintText: 'HeadLine',
                    controller: widget.headLineController,
                  ),

                  SizedBox(height: 18,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 105.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.transparent,
                        border: Border.all(color: Theme.of(context).primaryColor)),
                    child: TextField(
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      controller: widget.descriptionController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Points separate each with a comma',
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

                      keyboardType: TextInputType.multiline,
                    ),
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Technology Used, separate each with a comma',
                    controller: widget.technologyUsedController,
                  ),


                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
