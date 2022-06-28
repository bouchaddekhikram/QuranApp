

class SurahTranslationList {
  final List<SurahTranslation> translationList;
  SurahTranslationList({required this.translationList});

  factory SurahTranslationList.fromJSON(Map<String, dynamic> map) {
    Iterable translation = map['result'];
    List<SurahTranslation> list =
        translation.map((e) => SurahTranslation.fromJSON(e)).toList();
    print(list.length);
    return SurahTranslationList(translationList: list);
  }

  
}


class SurahTranslation {
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;

  SurahTranslation({this.sura, this.aya, this.arabicText, this.translation});

  factory SurahTranslation.fromJSON(Map<String, dynamic> json) {
    return SurahTranslation(
      sura: json['sura'],
      aya: json['aya'],
      arabicText: json['arabic_text'],
      translation: json['translation'],
    );
  }
}