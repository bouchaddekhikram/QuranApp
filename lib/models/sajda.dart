class SajdaList {
  final List<SajdaAyat> sajdaAyahs;

  SajdaList({required this.sajdaAyahs});

  factory SajdaList.fromJSON(Map<String, dynamic> json) {
    Iterable allSajdas = json['data']['ayahs'];
    List<SajdaAyat> sajdas =
        allSajdas.map((e) => SajdaAyat.fromJSON(e)).toList();

    return SajdaList(sajdaAyahs: sajdas);
  }
}

class SajdaAyat {
  final int number;
  final String text;
  final String surahName;
  final String surahEnglishName;
  final String englishNameTranslation;

  final String revelationType;
  final int juzNumber;
  final int rukuNumber;
  final int manzilNumber;
  final int sajdaNumber;

  SajdaAyat({
    required this.number,
    required this.text,
    required this.surahName,
    required this.surahEnglishName,
    required this.englishNameTranslation,
    required this.manzilNumber,
    required this.revelationType,
    required this.juzNumber,
    required this.rukuNumber,
    required this.sajdaNumber,
  });

  factory SajdaAyat.fromJSON(Map<String, dynamic> json) {
    return SajdaAyat(
        number: json['number'],
        text: json['text'],
        surahName: json['surah']['name'],
        surahEnglishName: json['surah']['englishName'],
        englishNameTranslation: json['surah']['englishNameTranslation'],
        revelationType: json['surah']['revelationType'],
        juzNumber: json['juz'],
        rukuNumber: json['ruku'],
        sajdaNumber: json['sajda']['id'],
        manzilNumber: json['manzil']);
  }
}
