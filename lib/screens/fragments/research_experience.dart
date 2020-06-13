import 'package:favresume/api/GenerateApi.dart';
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:favresume/models/GenerateModel.dart';
import 'package:favresume/utils/check_add_more.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ResearchExperienceScreen extends StatefulWidget {
  @override
  _ResearchExperienceScreenState createState() => _ResearchExperienceScreenState();
}

class _ResearchExperienceScreenState extends State<ResearchExperienceScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _organisationController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  DateTime _selectedFromDate = DateTime.now();
  DateTime _selectedToDate = DateTime.now();
  var newFormat = DateFormat("MMMM-yyyy");
  String _updatedFromDt = DateFormat("MMMM-yyyy").format(DateTime.now());
  String _updatedToDt = DateFormat("MMMM-yyyy").format(DateTime.now());


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
                  Text('Research Experiment', style: GoogleFonts.montserrat(
                      color: HexColor('F0C30F'),
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(mediaQuery)
                  ),),
                  SizedBox(height: 30,),

                  AppTextField(
                    hintText: 'Title',
                    controller: _titleController,
                  ),

                  SizedBox(height: 18,),

                  AppTextField(
                    hintText: 'Organisation',
                    controller: _organisationController,
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
                            Text('To $_updatedToDt', style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  AppTextField(
                    hintText: 'Points separate each with a comma',
                    controller: _pointsController,
                  ),

                  SizedBox(height: 18,),


                  MaterialButton(
                    onPressed: (){
                      CheckAddMoreHelper.isAddMoreResearchExClicked = true;
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
    List<String> points = [];
    if(_pointsController.text.isNotEmpty && _pointsController.text.contains(',')){

      List<String> splitString = _pointsController.text.split(',');
      for(var string in splitString){
        points.add(string);
      }
    }else{
      points.add(_pointsController.text);
    }

    ResearchExperienceItem researchExperienceItem = new ResearchExperienceItem(
      title: _titleController.text,
      organisation: _organisationController.text,
      from: _updatedFromDt,
      to: _updatedToDt,
      points: points
    );

    GenerateApi.researchExperienceItems.add(researchExperienceItem);


    _titleController.text = '';
    _organisationController.text = '';
    _pointsController.text = '';
    _updatedToDt = '';
    _updatedFromDt = '';
  }
}
