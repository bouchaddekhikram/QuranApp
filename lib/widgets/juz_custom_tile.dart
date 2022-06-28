import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';

import 'package:quran_app/models/juz.dart';

class JuzCustomTile extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;

  const JuzCustomTile({required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Constants.kSwatchColor.shade600,
          blurRadius: 3.0,
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(list[index].ayahNumber.toString()),
          Text(
            list[index].ayahsText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            list[index].surahName,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}

