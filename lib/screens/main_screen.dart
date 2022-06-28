import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/screens/homePage.dart';
import 'package:quran_app/screens/audio_screen.dart';
import 'package:quran_app/screens/prayer_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
  final List<Widget> _widgetList = const [
    HomePage(),
    QuranScreen(),
    AudioScreen(),
    PrayerScreen()
  ];

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        body: _widgetList[selectindex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Constants.kSwatchColor.shade300,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.book, title: 'Quran'),
            TabItem(icon: Icons.audiotrack, title: 'Audio'),
            TabItem(icon: Icons.mosque, title: 'Prayer'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: updateIndex,
        ),
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
