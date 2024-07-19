import 'package:face_recognition/features/home/HomeScreen.dart';
import 'package:face_recognition/features/home/RecognitionScreen.dart';
import 'package:face_recognition/features/home/RegistrationScreen.dart';
import 'package:flutter/material.dart';

class Pages {
  static const List<Widget> pages = [
    HomePage(),
    RegistrationScreen(),
    RecognitionScreen(),
    Icon(Icons.person, size: 150),
  ];
}
