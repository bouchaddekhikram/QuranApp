import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Read Quran",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Costumize your reading view, read in multiple languages, listen diffrent audio ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  "assets/quran.png",
                  fit: BoxFit.fitWidth,
                )),
              ),
              PageViewModel(
                title: "Prayer Alerts",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Choose your Adhan, which prayer to be notifeid of and how often",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  "assets/prayer.png",
                  fit: BoxFit.fitWidth,
                )),
              ),
              PageViewModel(
                title: "Build Better Habits",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mage Islamic practices a part of your daily life in a way that best suit your life",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                image: Center(
                    child: Image.asset(
                  "assets/zaqat.png",
                  fit: BoxFit.fitWidth,
                )),
              ),
            ],
            // showSkipButton: true,
            // skip: const Icon(
            //   Icons.skip_next,
            //   color: Colors.black,
            // ),
            // onSkip: () {},
            showNextButton: true,
            next: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            done: const Text("Done",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black)),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: const Color(0xcccddcd0),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              activeColor: Constants.kSwatchColor.shade100,
            ),
            onDone: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MainScreen()));
              // When done button is press
            },

            baseBtnStyle: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            // skipStyle: TextButton.styleFrom(primary: Colors.green),
          )),
    );
  }
}
