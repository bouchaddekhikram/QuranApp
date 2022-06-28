import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/screens/juz_screen.dart';
import 'package:quran_app/screens/surah_details.dart';
import 'package:quran_app/services/api_services.dart';
import '../widgets/surah_custom_tile.dart';
import '../widgets/sajda_custom_tile.dart';
import '../models/surah.dart';
import '../models/sajda.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Constants.kSwatchColor.shade600,
              title: const Text('Quran'),
              centerTitle: true,
              bottom: const TabBar(tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sajda',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Juz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                )
              ]),
            ),
            body: TabBarView(children: <Widget>[
              FutureBuilder(
                future: apiServices.getSurah(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                        itemCount: surah!.length,
                        itemBuilder: ((context, index) => surahCustomListTile(
                              surah: surah[index],
                              context: context,
                              ontap: () {
                                setState(() {
                                  Constants.surahIndex = (index + 1);
                                });
                                Navigator.pushNamed(context, SurahDetail.id);
                              },
                            )));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              FutureBuilder(
                  future: apiServices.getSajda(),
                  builder: (context, AsyncSnapshot<SajdaList> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.sajdaAyahs.length,
                        itemBuilder: ((context, index) => sajdaCustomTile(
                            snapshot.data!.sajdaAyahs[index], context)));
                  }),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Constants.juzIndex = (index + 1);
                            });
                            Navigator.pushNamed(context, JuzScreen.id);
                          },
                          child: Card(
                            elevation: 4,
                            color: Constants.kSwatchColor.shade300,
                            child: Center(
                                child: Text(
                              '${index + 1}',
                        
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )),
                          ),
                        );
                      }),
                ),
              ),
            ]),
          ),
        ));
  }
}
