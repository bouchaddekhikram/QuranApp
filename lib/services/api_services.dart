import 'dart:math';

import 'package:quran_app/models/aya_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/models/juz.dart';
import 'package:quran_app/models/translation.dart';
import 'dart:convert';

import '../models/surah.dart';
import '../models/sajda.dart';

class ApiServices {
  final endPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<List<Surah>> getSurah() async {
    http.Response res = await http.get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      return list;
    } else {
      throw ("Can't get the Surah");
    }
  }

  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyaOfTheDay.formJSON(json.decode(response.body));
    } else {
      throw Exception("failed to Load Post");
    }
  }

  //function to return random Ayah
  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  Future<SajdaList> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/en.asad ";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(response.body));
    } else {
      throw Exception("failed to Load Post");
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      throw Exception("failed to Load Post");
    }
  }

  Future<SurahTranslationList> getTranslation(int index) async {
    final url =
        "https://quranenc.com/api/v1/translation/sura/english_hilali_khan/$index";

    var res = await http.get(Uri.parse(url));
    return SurahTranslationList.fromJSON(json.decode(res.body));
  }
}
