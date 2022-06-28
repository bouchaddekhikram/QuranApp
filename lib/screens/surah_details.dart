import 'package:flutter/material.dart';

import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/services/api_services.dart';
import '../models/translation.dart';

import 'package:quran_app/widgets/custom_translation.dart';

class SurahDetail extends StatefulWidget {
  const SurahDetail({Key? key}) : super(key: key);
  static const String id = 'surahDetail_screen';

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  final ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _apiServices.getTranslation(Constants.surahIndex!),
        builder: (BuildContext context,
            AsyncSnapshot<SurahTranslationList> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.translationList.length,
                itemBuilder: (context, index) {
                  return TranslationTile(
                    index: index,
                    surahTranslationList: snapshot.data!.translationList[index],
                  );
                });
          } else {
            return const Center(
              child: Text('Translation not found'),
            );
          }
        },
      ),
    );
  }
}
