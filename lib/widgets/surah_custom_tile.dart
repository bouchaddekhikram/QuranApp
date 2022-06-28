import 'package:flutter/material.dart';
import '../models/surah.dart';

Widget surahCustomListTile(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: Colors.black12,
        ),
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
                  (surah.number).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(surah.englishNameTranslation!)
                ],
              ),
              const Spacer(),
              Text(
                surah.name!,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
