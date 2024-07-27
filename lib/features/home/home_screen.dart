import 'package:face_recognition/core/theming/colors.dart';
import 'package:face_recognition/core/theming/styles.dart';
import 'package:face_recognition/features/image/recognition_screen.dart';
import 'package:face_recognition/features/image/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, left: 30),
            child: Text(
              'Welcome Mostafa',
              style: TextStyles.font34White700Weight,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.buttonsColor,
                    minimumSize: Size(screenWidth - 30, 50),
                  ),
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(color: Colors.white),
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
                    backgroundColor: ColorsManager.buttonsColor,
                    minimumSize: Size(screenWidth - 30, 50),
                  ),
                  child: Text(
                    "Recognize",
                    style: GoogleFonts.poppins(color: Colors.white),
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
