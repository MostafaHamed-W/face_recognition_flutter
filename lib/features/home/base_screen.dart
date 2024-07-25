import 'package:face_recognition/core/theming/colors.dart';
import 'package:face_recognition/core/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedLabelStyle: GoogleFonts.poppins(),
          unselectedLabelStyle: GoogleFonts.poppins(),
          selectedItemColor: ColorsManager.activeIconColor,
          unselectedItemColor: ColorsManager.inActiveIconColor,
          backgroundColor: ColorsManager.botttomNavBarColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome01,
                  color: _selectedIndex == 0 ? ColorsManager.activeIconColor : ColorsManager.inActiveIconColor
                  // size: 30.0,
                  ),
              backgroundColor: ColorsManager.botttomNavBarColor,
            ),
            BottomNavigationBarItem(
              label: 'Register',
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedMobileSecurity,
                color: _selectedIndex == 1 ? ColorsManager.activeIconColor : ColorsManager.inActiveIconColor,
              ),
              backgroundColor: ColorsManager.botttomNavBarColor,
            ),
            BottomNavigationBarItem(
              label: 'Recognize',
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCamera01,
                color: _selectedIndex == 2 ? ColorsManager.activeIconColor : ColorsManager.inActiveIconColor,
              ),
              backgroundColor: ColorsManager.botttomNavBarColor,
            ),
            BottomNavigationBarItem(
              label: 'Realtime',
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedLiver,
                color: _selectedIndex == 3 ? ColorsManager.activeIconColor : ColorsManager.inActiveIconColor,
              ),
              backgroundColor: ColorsManager.botttomNavBarColor,
            ),
            BottomNavigationBarItem(
              label: 'Faces',
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedManager,
                color: _selectedIndex == 4 ? ColorsManager.activeIconColor : ColorsManager.inActiveIconColor,
              ),
              backgroundColor: ColorsManager.botttomNavBarColor,
            ),
          ],
        ),
      ),
      backgroundColor: ColorsManager.baseBlueColor,
      body: Center(child: Pages.pages.elementAt(_selectedIndex)),
    );
  }
}
