
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondGithubProject extends StatefulWidget {
  final TextEditingController projectController2;
  final TextEditingController tagLineController2;
  final TextEditingController descriptionController2;
  final TextEditingController technologyUsedController2;

  SecondGithubProject({
    @required this.projectController2,
    @required this.tagLineController2,
    @required this.descriptionController2,
    @required this.technologyUsedController2
  });
  @override
  _SecondGithubProjectState createState() => _SecondGithubProjectState();
}

class _SecondGithubProjectState extends State<SecondGithubProject> {

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
                    hintText: 'Project Name',
                    controller: widget.projectController2,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Tag Line',
                    controller: widget.tagLineController2,
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
                      controller: widget.descriptionController2,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description separate each with a comma',
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
                    controller: widget.technologyUsedController2,
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
