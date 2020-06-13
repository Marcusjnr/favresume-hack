
import 'package:favresume/screens/fragments/github_projects_options/first_project.dart';
import 'package:favresume/screens/fragments/github_projects_options/second_project.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GitHubProjectsScreen extends StatelessWidget {
  final TextEditingController projectController;
  final TextEditingController tagLineController;
  final TextEditingController descriptionController;
  final TextEditingController technologyUsedController;

  final TextEditingController projectController2;
  final TextEditingController tagLineController2;
  final TextEditingController descriptionController2;
  final TextEditingController technologyUsedController2;

  GitHubProjectsScreen({
   @required this.projectController,
   @required this.tagLineController,
   @required this.descriptionController,
   @required this.technologyUsedController,
    @required this.projectController2,
    @required this.tagLineController2,
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
                    Text('Github Projects', style: GoogleFonts.montserrat(
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
                    FirstGithubProject(
                      projectController: projectController,
                      tagLineController: tagLineController,
                      descriptionController: descriptionController,
                      technologyUsedController: technologyUsedController,
                    ),
                    SecondGithubProject(
                      projectController2: projectController2,
                      tagLineController2: tagLineController2,
                      descriptionController2: descriptionController2,
                      technologyUsedController2: technologyUsedController2,
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
