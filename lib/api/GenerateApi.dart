import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:favresume/models/GenerateModel.dart';
import 'package:favresume/screens/activities/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GenerateApi{
  static String url = 'https://fav-resume.herokuapp.com/generate';
  static String baseUrl = 'https://fav-resume.herokuapp.com';
  static String firstName;
  static String lastName;
  static Contact contact;
  static List<Detail> detailsList = [];
  Skills skills;
  static List<GithubProjectsItem> githubProjectItems = [];
  GithubProjects githubProjects;
  static List<OtherProjectsItem> otherProjectsItemsList = [];
  OtherProjects otherProjects;
  static List<WorkExperienceItem> workExperienceItems = [];
  WorkExperience workExperience;
  static List<String> involvementList = [];
  static Involvement involvement;
  static List<ResearchExperienceItem> researchExperienceItems = [];
  static ResearchExperience researchExperience;
  static List<School> schoolList = [];
  static Education education;


  static Future<GenerateModel> pushGenerate() async {
    Dio dio = new Dio();
    Response response;

    Skills skills = new Skills(details: detailsList);
    GithubProjects githubProjects = new GithubProjects(items: githubProjectItems);
    OtherProjects otherProjects = new OtherProjects(items: otherProjectsItemsList);
    WorkExperience workExperience = new WorkExperience(items: workExperienceItems);
    Involvement involvement = new Involvement(organizations: involvementList);
    Education education = new Education(schools: schoolList);
    ResearchExperience researchExperience = new ResearchExperience(items: researchExperienceItems);


    GenerateModel generateModel = new GenerateModel(
      firstname: firstName,
      lastname: lastName,
      contact: contact,
      skills: skills,
      githubProjects: githubProjects,
      otherProjects: otherProjects,
      workExperience: workExperience,
      involvement: involvement,
      education: education,
      researchExperience: researchExperience
    );

    var jsonVar = json.encode(workExperience.toJson());

    response = await dio.post(
        url,
        data: generateModel.toJson()
    );

    if(response.statusCode == 200){
      var responseJson = jsonEncode(response.data);
      var json = jsonDecode(responseJson);
      var fileNameJson = json['filename'];
      launchURL('$baseUrl/$fileNameJson');
      //print('Entire Response ${json.encode(diagnosisModel)}');
    }else{
      throw("Error ${response.statusCode}");
    }

    return generateModel;
  }

  static launchURL(String urlToGo) async {
    if (await canLaunch(urlToGo)) {
      await launch(urlToGo);

    } else {
      throw 'Could not launch $urlToGo';
    }
  }

  static void printStuff(){
    Skills skills = new Skills(details: detailsList);
    GithubProjects githubProjects = new GithubProjects(items: githubProjectItems);
    OtherProjects otherProjects = new OtherProjects(items: otherProjectsItemsList);
    WorkExperience workExperience = new WorkExperience(items: workExperienceItems);
    Involvement involvement = new Involvement(organizations: involvementList);
    Education education = new Education(schools: schoolList);
    ResearchExperience researchExperience = new ResearchExperience(items: researchExperienceItems);

    GenerateModel generateModel = new GenerateModel(
        firstname: firstName,
        lastname: lastName,
        contact: contact,
        skills: skills,
        githubProjects: githubProjects,
        otherProjects: otherProjects,
        workExperience: workExperience,
        involvement: involvement,
        education: education,
        researchExperience: researchExperience
    );

    var jsonVar = json.encode(generateModel.toJson());



    print(jsonVar);
  }
}