import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/models/aya_of_the_day.dart';
import 'package:quran_app/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiServices _apiServices = ApiServices();

  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE, d MMM yyyy');
    var formatted = format.format(day);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.22,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/home_bg1.jpg"),
                ),
              ),
              child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        formatted,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                          text: TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            child: Text(
                              _hijri.hDay.toString(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(4.0),
                          ),
                        ),
                        WidgetSpan(
                            child: Padding(
                          child: Text(
                            _hijri.longMonthName,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(4.0),
                        )),
                        WidgetSpan(
                            child: Padding(
                          child: Text(
                            '${_hijri.hYear} AH',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(4.0),
                        ))
                      ])),
                    ),
                  ]),
            ),
            Flexible(
                child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: Column(
                children: [
                  FutureBuilder<AyaOfTheDay>(
                      future: _apiServices.getAyaOfTheDay(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return const CircularProgressIndicator();
                          case ConnectionState.done:
                            return Container(
                              margin: const EdgeInsetsDirectional.all(16),
                              padding: const EdgeInsetsDirectional.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  const Text(
                                    "Quran Aya Of The Day",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 0.5,
                                  ),
                                  Text(
                                    snapshot.data!.arText!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot.data!.enTran!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  RichText(
                                      text: TextSpan(children: <InlineSpan>[
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data!.surNumber!.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data!.surEnName!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                  ]))
                                ],
                              ),
                            );
                        }
                      })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
