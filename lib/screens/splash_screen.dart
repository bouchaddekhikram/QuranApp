import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed = false;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
           
            MaterialPageRoute(
              builder: (context) {
                return alreadyUsed ? const MainScreen() : const OnBoardingScreen();
              },
            ),
            ));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text(
                'Muslim Soul',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              child: Image.asset("assets/mosquee.png"),
              left: 0,
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      ),
    );
  }
}
