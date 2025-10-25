import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knighthacksproject/colors.dart';

class MangaCard extends StatelessWidget {
  MangaCard(this.mangaName, this.mangaImg, this.hasNotification, {super.key});

  String mangaName;
  Image mangaImg;
  bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 240,
      child: Stack(
        children: [
          Container(
            height: 19,
            color: const Color.fromARGB(107, 27, 33, 50),
            child: Text(mangaName),
          ),
          mangaImg,
          (hasNotification)
          ? Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20
              ),
              child: Text(
                '3',
                style: GoogleFonts.nunito(
                  color: majorTextColor,
                  fontSize: 9,
                ),
                textAlign: TextAlign.center,
              ),
            )
          )
          : SizedBox()
        ],
      ),
    );
  }
}
