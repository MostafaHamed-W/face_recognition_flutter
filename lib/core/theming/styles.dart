


import 'package:face_recognition/core/theming/colors.dart';
import 'package:face_recognition/core/utils/constatns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextStyles {

  static TextStyle font34White700Weight = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: Constants.interFont,
  );

  static TextStyle font24Black700Weight = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: Constants.interFont,
  );

  static TextStyle font32BlueBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.baseBlueColor,
    fontFamily: Constants.interFont,
  );



  static TextStyle font22WhiteSemiBold = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: Constants.interFont,
  );
}