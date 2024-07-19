
import 'package:face_recognition/core/theming/colors.dart';
import 'package:face_recognition/features/home/widgets/pages.dart';
import 'package:flutter/material.dart';
import 'RecognitionScreen.dart';
import 'RegistrationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'inter',
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'inter',
        ),
        selectedItemColor: ColorsManager.activeIconColor,
        unselectedItemColor: ColorsManager.inActiveIconColor,
        backgroundColor: ColorsManager.botttomNavBarColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: ColorsManager.botttomNavBarColor,
          ),
          BottomNavigationBarItem(
            label: 'Register',
            icon: Icon(Icons.app_registration_outlined),
            backgroundColor: ColorsManager.botttomNavBarColor,
          ),
          BottomNavigationBarItem(
            label: 'Recognize',
            icon: Icon(Icons.search),
            backgroundColor: ColorsManager.botttomNavBarColor,
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
            backgroundColor: ColorsManager.botttomNavBarColor,
          ),
        ],
      ),
      backgroundColor: ColorsManager.baseBlueColor,
      body: Center(child: Pages.pages.elementAt(_selectedIndex)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
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
                  backgroundColor: ColorsManager.buttonsColor,
                  minimumSize: Size(screenWidth - 30, 50),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "inter",
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
                  backgroundColor: ColorsManager.buttonsColor,
                  minimumSize: Size(screenWidth - 30, 50),
                ),
                child: const Text(
                  "Recognize",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "inter",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


