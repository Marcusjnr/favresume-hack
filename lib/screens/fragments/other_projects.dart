import 'package:favresume/screens/fragments/other_projects_options/first_project_other.dart';
import 'package:favresume/screens/fragments/other_projects_options/second_project_other.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherProjectsScreen extends StatelessWidget {
  final TextEditingController headLineController;
  final TextEditingController descriptionController;
  final TextEditingController technologyUsedController;
  final TextEditingController headLineController2;
  final TextEditingController descriptionController2;
  final TextEditingController technologyUsedController2;

  OtherProjectsScreen({
    @required this.headLineController,
    @required this.descriptionController,
    @required this.technologyUsedController,
    @required this.headLineController2,
    @required this.descriptionController2,
    @required this.technologyUsedController2
});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return DefaultTabController(
      length: 2,
      child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Text('Other Projects', style: GoogleFonts.montserrat(
                        color: HexColor('F0C30F'),
                        fontWeight: FontWeight.bold,
                        fontSize: responsiveFontSize(mediaQuery)
                    ),)
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10
                  ),
                  child: TabBar(
                      unselectedLabelColor: Theme.of(context).accentColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor
                      ),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Project 1'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Project 2'),
                          ),
                        ),

                      ]
                  ),
                ),
              ),

              SizedBox(height: 18,),

              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    FirstProjectOther(
                      headLineController: headLineController,
                      descriptionController: descriptionController,
                      technologyUsedController: technologyUsedController,
                    ),
                    SecondProjectOther(
                      headLineController2: headLineController2,
                      descriptionController2: descriptionController2,
                      technologyUsedController2: technologyUsedController2,
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );;
  }
}
