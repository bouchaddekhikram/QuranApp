import 'package:flutter/material.dart';

import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/services/api_services.dart';

import '../models/juz.dart';
import '../widgets/juz_custom_tile.dart';

class JuzScreen extends StatelessWidget {
  static const String id = 'juz_screen';

  ApiServices apiServices = ApiServices();

  JuzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<JuzModel>(
        future: apiServices.getJuzz(Constants.juzIndex!),
        builder: (context, AsyncSnapshot<JuzModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzCustomTile(
                    index: index,
                    list: snapshot.data!.juzAyahs,
                  );
                });
          } else {
            return const Center(
              child: Text('Data not found'),
            );
          }
        },
      ),
    ));
  }
}
