import 'package:face_recognition/features/image/recognition_screen.dart';
import 'package:face_recognition/features/image/registration_screen.dart';
import 'package:face_recognition/features/home/home_screen.dart';
import 'package:face_recognition/features/realtime/realtime_face_detection.dart';
import 'package:face_recognition/features/realtime/realtime_face_recognition.dart';
import 'package:flutter/material.dart';

class Pages {
  static List<Widget> pages = [
    const HomeScreen(),
    const RegistrationScreen(),
    const RecognitionScreen(),
    // RealtimeFaceDetection(
    //   title: 'detection',
    // ),
    RealtimeFaceRecognition(),
  ];
}
