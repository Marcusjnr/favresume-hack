import 'package:favresume/api/GenerateApi.dart';
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:favresume/models/GenerateModel.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationScreen extends StatelessWidget {
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController graduationController = TextEditingController();
  static List<School> schools =[];

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
                  Text('Education', style: GoogleFonts.montserrat(
              color: HexColor('F0C30F'),
                fontWeight: FontWeight.bold,
                fontSize: responsiveFontSize(mediaQuery)
            ),),
                  SizedBox(height: 30,),

                  AppTextField(
                    hintText: 'Degree',
                    controller: degreeController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Major',
                    controller: majorController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Institution',
                    controller: institutionController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Graduation Year',
                    controller: graduationController,
                  ),

                  SizedBox(height: 18,),


                  MaterialButton(
                    onPressed: (){
                      _gatherInfo();
                    },
                    child: Text('Add More', style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
                    ),),
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  void _gatherInfo(){

    School school = new School(
      degree: degreeController.text,
      major: majorController.text,
      institution: institutionController.text,
      graduationYear: int.parse(graduationController.text)
    );

    GenerateApi.schoolList.add(school);

    degreeController.text = '';
    majorController.text = '';
    institutionController.text = '';
    graduationController.text = '';

  }
}
