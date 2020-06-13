

import 'package:flutter/material.dart';

double responsiveFontSize(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return 30;
  } else if (deviceWidth < 1200) {
    return 40;
  } else if (deviceWidth < 1650) {
    return 50;
  }
  return 50;
}