import 'package:face_recognition/core/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RecognitionScreen.dart';
import 'RegistrationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff101018),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset(
                "assets/images/logo.png",
                width: screenWidth - 40,
                height: screenWidth - 40,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.secondBlueColor,
                    minimumSize: Size(screenWidth - 30, 50),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RecognitionScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.secondBlueColor,
                    minimumSize: Size(screenWidth - 30, 50),
                  ),
                  child: const Text(
                    "Recognize",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
