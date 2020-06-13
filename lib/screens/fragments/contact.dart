
import 'package:favresume/custom/textfields/custom_text_field.dart';
import 'package:favresume/utils/hex_color.dart';
import 'package:favresume/utils/responsive_resize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController ;
  final TextEditingController websiteController;
  final TextEditingController linkedInController;
  final TextEditingController gitHubController;

  ContactScreen({
   @required this.emailController,
    @required this.phoneController,
    @required this.websiteController,
    @required this.linkedInController,
    @required this.gitHubController
});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contact', style: GoogleFonts.montserrat(
                  color: HexColor('F0C30F'),
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveFontSize(mediaQuery)
              ),),
              SizedBox(height: 30,),

              AppTextField(
                hintText: 'Email',
                controller: emailController,
              ),

              SizedBox(height: 30,),

              AppTextField(
                hintText: 'PhoneNumber',
                controller: phoneController,
              ),

              SizedBox(height: 30,),

              AppTextField(
                hintText: 'Website',
                controller: websiteController,
              ),

              SizedBox(height: 30,),

              AppTextField(
                hintText: 'LinkedIn',
                controller: linkedInController,
              ),

              SizedBox(height: 30,),

              AppTextField(
                hintText: 'GitHub',
                controller: gitHubController,
              ),
            ],
          )

        ],
      ),
    );
  }
}
