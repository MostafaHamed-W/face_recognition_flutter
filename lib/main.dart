import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'features/home/base_screen.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
    ),
    // const CameraApp(),
  );
}
