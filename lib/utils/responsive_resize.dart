

import 'package:flutter/material.dart';

double responsiveFontSize(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 460) {
    return 25;
  }else if(deviceWidth < 600){
    return 40;
  }else{
    return 50;
  }
}

double responsivePadding(MediaQueryData mediaQuery){
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 460) {
    return 25;
  }else if(deviceWidth < 600){
    return 40;
  }else{
    return 70;
  }
}

double responsiveWidth(MediaQueryData mediaQuery){
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 460) {
    return 0.8;
  }else{
    return 0.6;
  }
}