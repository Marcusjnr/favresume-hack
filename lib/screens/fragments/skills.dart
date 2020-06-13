import 'package:favresume/custom/custom_checklist_tile.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatefulWidget {
  final List<String> itemList;
  final TextEditingController moreController;

  SkillsScreen({
    @required this.itemList,
    @required this.moreController
});
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
   bool javaValue = false;
   bool swiftValue = false;
   bool pythonValue = false;
   bool javaScriptValue = false;
   bool phpValue = false;
   bool rubyValue = false;
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
                  Text('Programming Languages', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),

                  CustomCheckList(
                    text: 'Java',
                    value: javaValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Swift',
                    value: swiftValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Python',
                    value: pythonValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'JavaScript',
                    value: javaScriptValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Php',
                    value: phpValue,
                    itemsList: widget.itemList,
                  ),

                  CustomCheckList(
                    text: 'Ruby',
                    value: rubyValue,
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
