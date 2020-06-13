
import 'package:favresume/custom/custom_checklist_tile.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestsScreen extends StatefulWidget {
  final List<String> itemList;
  final TextEditingController moreController;

  InterestsScreen({
    @required this.itemList,
    @required this.moreController
  });

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  bool softwareDevelopmentValue = false;
  bool webDevelopmentValue = false;
  bool mLValue = false;
  bool iotValue = false;

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
                  Text('Interests', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),
                  CustomCheckList(
                    text: 'Software Development',
                    value: softwareDevelopmentValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Web Development',
                    value: webDevelopmentValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Machine Learning',
                    value: mLValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Internet Of Things',
                    value: iotValue,
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
