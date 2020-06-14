import 'dart:ui';

import 'package:favresume/api/GenerateApi.dart';
import 'package:favresume/models/GenerateModel.dart';
import 'package:favresume/screens/fragments/contact.dart';
import 'package:favresume/screens/fragments/education.dart';
import 'package:favresume/screens/fragments/github_projects.dart';
import 'package:favresume/screens/fragments/introduction.dart';
import 'package:favresume/screens/fragments/involvment.dart';
import 'package:favresume/screens/fragments/name.dart';
import 'package:favresume/screens/fragments/other_projects.dart';
import 'package:favresume/screens/fragments/research_experience.dart';
import 'package:favresume/screens/fragments/skills.dart';
import 'package:favresume/screens/fragments/skills_options/databases.dart';
import 'package:favresume/screens/fragments/skills_options/interests.dart';
import 'package:favresume/screens/fragments/skills_options/tool_type.dart';
import 'package:favresume/screens/fragments/skills_options/webframework.dart';
import 'package:favresume/screens/fragments/work_experience.dart';
import 'package:favresume/utils/check_add_more.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  AppBar appBar = new AppBar();
  int _selectedIndex = 0;
  String nextText;
  int addEndBra = 0;
  //name controllers
  static TextEditingController firstNameController = new TextEditingController();
  static TextEditingController lastNameController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  //contact controller
  static TextEditingController emailController = new TextEditingController();
  static TextEditingController phoneController = new TextEditingController();
  static TextEditingController websiteController = new TextEditingController();
  static TextEditingController linkedInController = new TextEditingController();
  static TextEditingController gitHubController = new TextEditingController();

  //githubproject controllers
  static TextEditingController projectController = TextEditingController();
  static TextEditingController tagLineController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController technologyUsedController = TextEditingController();
  static TextEditingController projectController2 = TextEditingController();
  static TextEditingController tagLineController2 = TextEditingController();
  static TextEditingController descriptionController2 = TextEditingController();
  static TextEditingController technologyUsedController2 = TextEditingController();

  //other projects controllers
  static TextEditingController headLineOtherController = TextEditingController();
  static TextEditingController descriptionOtherController = TextEditingController();
  static TextEditingController technologyUsedOtherController = TextEditingController();
  static TextEditingController headLineOtherController2 = TextEditingController();
  static TextEditingController descriptionOtherController2 = TextEditingController();
  static TextEditingController technologyUsedOtherController2 = TextEditingController();


  //Involvement
  static TextEditingController involvementController = TextEditingController();

  //skills programming languages
  static List<String> skillsItemList = [];
  static TextEditingController moreController = new TextEditingController();

  //skills webframework
  static List<String> webFrameWorkSkillsItemList = [];
  static TextEditingController webFrameWorkSkillMoreController = new TextEditingController();

  //skills Databases
  static List<String> dataBasesSkillsItemList = [];
  static TextEditingController dataBasesSkillMoreController = new TextEditingController();

  //skills Interests
  static List<String> interestSkillsItemList = [];
  static TextEditingController interestSkillMoreController = new TextEditingController();

  //skills tooltype
  static List<String> toolTypeSkillsItemList = [];
  static TextEditingController toolTypeSkillMoreController = new TextEditingController();

  //github projects
  static List<String> firstProjectGitList = [];
  static List<String> firstProjectGitTechUsedList = [];
  static List<String> secondProjectGitList = [];
  static List<String> secondProjectGitTechUsedList = [];

  //other projects
  static List<String> firstProjectOtherList = [];
  static List<String> firstProjectOtherTechUsedList = [];
  static List<String> secondProjectOtherList = [];
  static List<String> secondProjectOtherTechUsedList = [];



  String changeNextStatus(){
    if(addEndBra == 2){
      return 'LOADING..';
    } else if(_selectedIndex == 13){
      return 'FINISH';
    }else{
      return 'NEXT';
    }
  }


  static List<Widget> _widgetOptions = <Widget>[
    IntroductionScreen(),

    NameScreen(firstNameController: firstNameController, lastNameController: lastNameController,),

    ContactScreen(
      emailController: emailController,
      phoneController: phoneController,
      websiteController: websiteController,
      linkedInController: linkedInController,
      gitHubController: gitHubController,
    ),

    SkillsScreen(itemList: skillsItemList, moreController: moreController,),

    WebFrameWorkScreen(
      itemList: webFrameWorkSkillsItemList,
      moreController: webFrameWorkSkillMoreController,
    ),

    DatabaseScreen(
      itemList: dataBasesSkillsItemList,
      moreController: dataBasesSkillMoreController,
    ),

    ToolTypeScreen(
      itemList: toolTypeSkillsItemList,
      moreController: toolTypeSkillMoreController,
    ),

    InterestsScreen(
      itemList: interestSkillsItemList,
      moreController: interestSkillMoreController,
    ),

    GitHubProjectsScreen(
      projectController: projectController,
      tagLineController: tagLineController,
      descriptionController: descriptionController,
      technologyUsedController: technologyUsedController,
      projectController2: projectController2,
      tagLineController2: tagLineController2,
      descriptionController2: descriptionController2,
      technologyUsedController2: technologyUsedController2,
    ),

    OtherProjectsScreen(
      headLineController: headLineOtherController,
      descriptionController: descriptionOtherController,
      technologyUsedController: technologyUsedOtherController,
      headLineController2: headLineOtherController2,
      descriptionController2: descriptionOtherController2,
      technologyUsedController2: technologyUsedOtherController2,
    ),

    WorkExperienceScreen(),

    InvolvmentScreen(
      controller: involvementController,
    ),

    EducationScreen(),

    ResearchExperienceScreen(),


  ];

  void _onItemTapped() {
    
    setState(() {
      if(_selectedIndex < _widgetOptions.length -1){
        _selectedIndex++;
      }
    });
  }

  void _onBackItemTapped() {
    addEndBra = 0;
    setState(() {
      if(!(_selectedIndex == 0)){
        _selectedIndex--;
      }
    });
  }

  void _onNextPressed(){
    
    if(changeNextStatus() == 'FINISH'){
      addEndBra++;
    }

    if(addEndBra == 2){

      GenerateApi.pushGenerate();
    }else{
      if(_selectedIndex == 2){
        GenerateApi.firstName = firstNameController.text;
        GenerateApi.lastName = lastNameController.text;

      }else if(_selectedIndex == 3){
        Contact contact = new Contact(
            email: emailController.text,
            phone: phoneController.text,
            website: websiteController.text,
            linkedin: linkedInController.text,
            github: gitHubController.text
        );

        GenerateApi.contact = contact;


      }else if(_selectedIndex == 4){

        if(moreController.text.isNotEmpty && moreController.text.contains(',')){
          List<String> splitString = moreController.text.split(',');
          for(var string in splitString){
            skillsItemList.add(string);
          }
        }else{
          skillsItemList.add(moreController.text);
        }

        Detail detail = new Detail(
            type: 'Programming Languages',
            items: skillsItemList
        );

        GenerateApi.detailsList.add(detail);

      }else if(_selectedIndex == 5){
        if(webFrameWorkSkillMoreController.text.isNotEmpty && webFrameWorkSkillMoreController.text.contains(',')){
          List<String> splitString = webFrameWorkSkillMoreController.text.split(',');
          for(var string in splitString){
            webFrameWorkSkillsItemList.add(string);
          }
        }else{
          webFrameWorkSkillsItemList.add(webFrameWorkSkillMoreController.text);
        }

        Detail detail = new Detail(
            type: 'Web FrameWork',
            items: webFrameWorkSkillsItemList
        );

        GenerateApi.detailsList.add(detail);

      }else if(_selectedIndex == 6){
        if(dataBasesSkillMoreController.text.isNotEmpty && dataBasesSkillMoreController.text.contains(',')){
          List<String> splitString = dataBasesSkillMoreController.text.split(',');
          for(var string in splitString){
            dataBasesSkillsItemList.add(string);
          }
        }else{
          dataBasesSkillsItemList.add(dataBasesSkillMoreController.text);
        }

        Detail detail = new Detail(
            type: 'Databases',
            items: dataBasesSkillsItemList
        );

        GenerateApi.detailsList.add(detail);

      }else if(_selectedIndex == 7){

        if(toolTypeSkillMoreController.text.isNotEmpty && toolTypeSkillMoreController.text.contains(',')){
          List<String> splitString = toolTypeSkillMoreController.text.split(',');
          for(var string in splitString){
            toolTypeSkillsItemList.add(string);
          }
        }else{
          toolTypeSkillsItemList.add(toolTypeSkillMoreController.text);
        }

        Detail detail = new Detail(
            type: 'Tools',
            items: toolTypeSkillsItemList
        );

        GenerateApi.detailsList.add(detail);

      }else if(_selectedIndex == 8){
        if(interestSkillMoreController.text.isNotEmpty && interestSkillMoreController.text.contains(',')){
          List<String> splitString = interestSkillMoreController.text.split(',');
          for(var string in splitString){
            interestSkillsItemList.add(string);
          }
        }else{
          interestSkillsItemList.add(interestSkillMoreController.text);
        }

        Detail detail = new Detail(
            type: 'Interests',
            items: interestSkillsItemList
        );

        GenerateApi.detailsList.add(detail);

      }else if(_selectedIndex == 9){
        // First github screen

        if(descriptionController.text.isNotEmpty && descriptionController.text.contains(',')){
          List<String> splitString = descriptionController.text.split(',');
          for(var string in splitString){
            firstProjectGitList.add(string);
          }
        }else{
          firstProjectGitList.add(descriptionController.text);
        }

        if(technologyUsedController.text.isNotEmpty && technologyUsedController.text.contains(',')){
          List<String> splitString = technologyUsedController.text.split(',');
          for(var string in splitString){
            firstProjectGitTechUsedList.add(string);
          }
        }else{
          firstProjectGitTechUsedList.add(technologyUsedController.text);
        }

        TechnologyUsed technologyUsed1 = new TechnologyUsed(
            tools: firstProjectGitTechUsedList
        );

        GithubProjectsItem githubProjectsItem = new GithubProjectsItem(
            projectName: projectController.text,
            tagline: tagLineController.text,
            description: firstProjectGitList,
            technologyUsed: technologyUsed1
        );

        GenerateApi.githubProjectItems.add(githubProjectsItem);


        //second screen
        if(descriptionController2.text.isNotEmpty && descriptionController2.text.contains(',')){
          List<String> splitString = descriptionController2.text.split(',');
          for(var string in splitString){
            secondProjectGitList.add(string);
          }
        }else{
          secondProjectGitList.add(descriptionController2.text);
        }

        if(technologyUsedController2.text.isNotEmpty && technologyUsedController2.text.contains(',')){
          List<String> splitString = technologyUsedController2.text.split(',');
          for(var string in splitString){
            secondProjectGitTechUsedList.add(string);
          }
        }else{
          secondProjectGitTechUsedList.add(technologyUsedController2.text);
        }

        TechnologyUsed technologyUsed2 = new TechnologyUsed(
            tools: secondProjectGitTechUsedList
        );

        GithubProjectsItem githubProjectsItem2 = new GithubProjectsItem(
            projectName: projectController2.text,
            tagline: tagLineController2.text,
            description: secondProjectGitList,
            technologyUsed: technologyUsed2
        );

        GenerateApi.githubProjectItems.add(githubProjectsItem2);


      }else if(_selectedIndex == 10){
        //first other screen

        if(descriptionOtherController.text.isNotEmpty && descriptionOtherController.text.contains(',')){
          List<String> splitString = descriptionOtherController.text.split(',');
          for(var string in splitString){
            firstProjectOtherList.add(string);
          }
        }else{
          firstProjectOtherList.add(descriptionOtherController.text);
        }

        if(technologyUsedOtherController.text.isNotEmpty && technologyUsedOtherController.text.contains(',')){
          List<String> splitString = technologyUsedOtherController.text.split(',');
          for(var string in splitString){
            firstProjectOtherTechUsedList.add(string);
          }
        }else{
          firstProjectOtherTechUsedList.add(technologyUsedOtherController.text);
        }

        TechnologyUsed technologyUsed1 = new TechnologyUsed(
            tools: firstProjectOtherTechUsedList
        );

        OtherProjectsItem otherProjectsItem = new OtherProjectsItem(
            headline: headLineOtherController.text,
            points: firstProjectOtherList,
            technologyUsed: technologyUsed1
        );

        GenerateApi.otherProjectsItemsList.add(otherProjectsItem);

        //second other screen
        if(descriptionOtherController2.text.isNotEmpty && descriptionOtherController2.text.contains(',')){
          List<String> splitString = descriptionOtherController2.text.split(',');
          for(var string in splitString){
            secondProjectOtherList.add(string);
          }
        }else{
          secondProjectOtherList.add(descriptionOtherController2.text);
        }

        if(technologyUsedOtherController2.text.isNotEmpty && technologyUsedOtherController2.text.contains(',')){
          List<String> splitString = technologyUsedOtherController2.text.split(',');
          for(var string in splitString){
            secondProjectOtherTechUsedList.add(string);
          }
        }else{
          secondProjectOtherTechUsedList.add(technologyUsedOtherController2.text);
        }

        TechnologyUsed technologyUsed2 = new TechnologyUsed(
            tools: secondProjectOtherTechUsedList
        );

        OtherProjectsItem otherProjectsItem2 = new OtherProjectsItem(
            headline: headLineOtherController2.text,
            points: secondProjectOtherList,
            technologyUsed: technologyUsed2
        );

        GenerateApi.otherProjectsItemsList.add(otherProjectsItem2);
      } else if(_selectedIndex == 12){

        if(involvementController.text.isNotEmpty && involvementController.text.contains(',')){
          List<String> splitString = involvementController.text.split(',');
          for(var string in splitString){
            GenerateApi.involvementList.add(string);
          }
        }else{
          GenerateApi.involvementList.add(involvementController.text);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 30.0, left: responsivePadding(mediaQuery), right: responsivePadding(mediaQuery)),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: ExactAssetImage('images/background.jpg',),
                fit: BoxFit.cover,
              )
          ),
          child: Scaffold(
            key: _scaffoldKey,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                        text: 'FAV',
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w100,
                            fontSize: responsiveFontSize(mediaQuery)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'RESUME',
                            style: GoogleFonts.openSans(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: responsiveFontSize(mediaQuery)
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ),
              body: Container(
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '$_selectedIndex/ ${(_widgetOptions.length - 1).toString()}',
                          style: GoogleFonts.openSansCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: responsiveFontSize(mediaQuery),
                              letterSpacing: 2
                          ),)
                    ),

                    //main alignment
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, top: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * responsiveWidth(mediaQuery),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            transitionBuilder: (Widget child, Animation<double> animation){
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                            child: _widgetOptions.elementAt(_selectedIndex),
                          ),
                        ),
                      ),
                    ),

                    mediaQuery.size.width > 450 ?
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [

                                  _decideCircle(_selectedIndex, 0),
                                  _decideCircle(_selectedIndex, 1),
                                  _decideCircle(_selectedIndex, 2),
                                  _decideCircle(_selectedIndex, 3),
                                  _decideCircle(_selectedIndex, 4),
                                  _decideCircle(_selectedIndex, 5),
                                  _decideCircle(_selectedIndex, 6),
                                  _decideCircle(_selectedIndex, 7),
                                  _decideCircle(_selectedIndex, 8),
                                  _decideCircle(_selectedIndex, 9),
                                  _decideCircle(_selectedIndex, 10),
                                  _decideCircle(_selectedIndex, 11),
                                  _decideCircle(_selectedIndex, 12),
                                  _decideCircle(_selectedIndex, 13),
                                ],
                              ),
                            )
                        ),
                      ),
                    )
                    : Container(width: 0.0),

                    Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).primaryColor)
                                ),
                                child: Text('PREV', style: Theme.of(context).textTheme.headline2,),
                              ),
                              onTap: (){
                                _onBackItemTapped();
                              },
                            ),

                            SizedBox(width: 15.0,),

                            InkWell(
                              onTap: (){
                                if(_selectedIndex == 10 && CheckAddMoreHelper.isAddMoreWorkExClicked == false){
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Please Click Add More To Add To Your List'),
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ));
                                }else if(_selectedIndex == 12 && CheckAddMoreHelper.isAddMoreEducationClicked == false){
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Please Click Add More To Add To Your List'),
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ));
                                } else{
                                  _onItemTapped();
                                  _onNextPressed();
                                }


                              },
                              child: Container(
                                  padding: const EdgeInsets.all(14.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Theme.of(context).primaryColor)
                                  ),
                                  child: Text( changeNextStatus(), style: Theme.of(context).textTheme.headline2,)

                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              )
          ),
        ),

      ],
    );
  }

  Widget _decideCircle(int currentIndex, int indexClicked){
    if(currentIndex == indexClicked){
      return  AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).primaryColor)
        ),
        child: Icon(Icons.fiber_manual_record, size: 20, color: Theme.of(context).primaryColor,),
      );
    }else{
      return  AnimatedContainer(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(10.0),

        child: Icon(Icons.fiber_manual_record, size: 20, color: Theme.of(context).accentColor,),
      );
    }
  }
}
