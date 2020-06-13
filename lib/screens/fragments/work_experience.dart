import 'package:favresume/api/GenerateApi.dart';
import 'package:favresume/custom/custom_checklist_tile.dart';
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:favresume/models/GenerateModel.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WorkExperienceScreen extends StatefulWidget {
  @override
  _WorkExperienceScreenState createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController organisationController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController technologyUsedWorkExperienceController = TextEditingController();


  DateTime _selectedFromDate = DateTime.now();
  DateTime _selectedToDate = DateTime.now();
  var newFormat = DateFormat("yy-MM-dd");
  String _updatedFromDt = DateFormat("yy-MM-dd").format(DateTime.now());
  String _updatedToDt = DateFormat("yy-MM-dd").format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    void _pickFromDateDialog() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          //which date will display when user open the picker
          firstDate: DateTime(1950),
          //what will be the previous supported year in picker
          lastDate: DateTime
              .now()) //what will be the up to supported date in picker
          .then((pickedDate) {
        //then usually do the future job
        if (pickedDate == null) {
          //if user tap cancel then this function will stop
          return;
        }
        setState(() {
          //for rebuilding the ui
          _selectedFromDate = pickedDate;
          _updatedFromDt = newFormat.format(_selectedFromDate);
        });
      });
    }

    void _pickToDateDialog() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          //which date will display when user open the picker
          firstDate: DateTime(1950),
          //what will be the previous supported year in picker
          lastDate: DateTime
              .now()) //what will be the up to supported date in picker
          .then((pickedDate) {
        //then usually do the future job
        if (pickedDate == null) {
          //if user tap cancel then this function will stop
          return;
        }
        setState(() {
          //for rebuilding the ui
          _selectedToDate = pickedDate;
          _updatedToDt = newFormat.format(_selectedToDate);
        });
      });
    }


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
                  Text('Work Experience', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),

                  AppTextField(
                    hintText: 'Title',
                    controller: titleController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Organisation',
                    controller: organisationController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Location',
                    controller: locationController,
                  ),

                  SizedBox(height: 18,),

                  InkWell(
                    onTap: (){
                      _pickFromDateDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      height: 55.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('From $_updatedFromDt', style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18,),

                  InkWell(
                    onTap: (){
                      _pickToDateDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      height: 55.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Theme.of(context).primaryColor)
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To $_updatedToDt', style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Details, separate each with a comma',
                    controller: detailsController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Technology Used, separate each with a comma',
                    controller: technologyUsedWorkExperienceController,
                  ),

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
    List<String> workExperienceDetailsList = [];
    List<String> technologyUsedWorkExperience = [];
    if(detailsController.text.isNotEmpty && detailsController.text.contains(',')){
      List<String> splitString = detailsController.text.split(',');
      for(var string in splitString){
        workExperienceDetailsList.add(string);
      }
    }else{
      workExperienceDetailsList.add(detailsController.text);
    }

    if(technologyUsedWorkExperienceController.text.isNotEmpty && technologyUsedWorkExperienceController.text.contains(',')){
      List<String> splitString = technologyUsedWorkExperienceController.text.split(',');
      for(var string in splitString){
        technologyUsedWorkExperience.add(string);
      }
    }else{
      technologyUsedWorkExperience.add(technologyUsedWorkExperienceController.text);
    }

    TechnologyUsed technologyUsed = new TechnologyUsed(
      tools: technologyUsedWorkExperience
    );

    WorkExperienceItem workExperienceItem = new WorkExperienceItem(
      title: titleController.text,
      organisation: organisationController.text,
      location: locationController.text,
      from: _updatedFromDt,
      to: _updatedToDt,
      details: workExperienceDetailsList,
      technologyUsed: technologyUsed
    );

    GenerateApi.workExperienceItems.add(workExperienceItem);

    titleController.text = '';
    organisationController.text = '';
    locationController.text = '';
    detailsController.text ='';
    technologyUsedWorkExperienceController.text = '';
    _updatedFromDt = '';
    _updatedToDt = '';


  }
}
