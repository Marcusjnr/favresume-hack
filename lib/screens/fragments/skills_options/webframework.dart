import 'package:favresume/custom/custom_checklist_tile.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebFrameWorkScreen extends StatefulWidget {
  final List<String> itemList;
  final TextEditingController moreController;

  WebFrameWorkScreen({
   @required this.itemList,
   @required this.moreController
});
  @override
  _WebFrameWorkScreenState createState() => _WebFrameWorkScreenState();
}

class _WebFrameWorkScreenState extends State<WebFrameWorkScreen> {
  bool bootStrapValue = false;
  bool materializeValue = false;
  bool railsValue = false;

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
                  Text('Web Framework', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),
                  CustomCheckList(
                    text: 'BootStrap',
                    value: bootStrapValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Materialize',
                    value: materializeValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Rails',
                    value: railsValue,
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
