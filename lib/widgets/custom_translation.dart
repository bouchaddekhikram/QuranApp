import 'package:quran_app/models/translation.dart';
import 'package:flutter/material.dart';

import 'package:quran_app/constants/constants.dart';
import '../models/translation.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final surahTranslationList;

  const TranslationTile(
      {required this.index, required this.surahTranslationList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Constants.kSwatchColor.shade700,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                ),
                Positioned(
                    top: 3,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Text(
                        surahTranslationList.aya!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    surahTranslationList.arabicText!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    surahTranslationList.translation!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
