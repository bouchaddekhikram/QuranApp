import 'package:flutter/material.dart';
import 'package:quran_app/models/sajda.dart';

Widget sajdaCustomTile(SajdaAyat sajdaAyat, context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 3.0,
      )
    ]),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                sajdaAyat.juzNumber.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '${sajdaAyat.surahEnglishName} \n',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  TextSpan(
                      text: sajdaAyat.revelationType,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ])),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const Spacer(),
            Text(sajdaAyat.surahName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))
          ],
        )
      ],
    ),
  );
}
