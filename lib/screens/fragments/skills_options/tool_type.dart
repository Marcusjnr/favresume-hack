import 'package:favresume/custom/custom_checklist_tile.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolTypeScreen extends StatefulWidget {
  final List<String> itemList;
  final TextEditingController moreController;

  ToolTypeScreen({
    @required this.itemList,
    @required this.moreController
  });

  @override
  _ToolTypeScreenState createState() => _ToolTypeScreenState();
}

class _ToolTypeScreenState extends State<ToolTypeScreen> {
  bool gitValue = false;
  bool sketchValue = false;
  bool githubValue = false;
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
                  Text('Tools', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),
                  CustomCheckList(
                    text: 'Git',
                    value: gitValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Sketch',
                    value: sketchValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Github',
                    value: githubValue,
                    itemsList: widget.itemList,
                  ),


                  TextField(
                      controller: widget.moreController,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add More, Please separate with a comma',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor)
                        ),
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
                      ))
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
