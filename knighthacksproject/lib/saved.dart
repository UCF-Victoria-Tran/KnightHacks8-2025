import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/manga_card.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.count(
      crossAxisCount: 4,
      children: [
        MangaCard(
          "Gachiakuta",
          Image.asset('assets/mangaImage3.png', fit: BoxFit.cover),
          true,
        ),
        MangaCard(
          "Gachiakuta",
          Image.asset('assets/mangaImage3.png', fit: BoxFit.cover),
          false,
        ),
      ],
    ));
  }
}
