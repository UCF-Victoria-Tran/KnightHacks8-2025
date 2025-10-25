import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knighthacksproject/colors.dart';

class MangaCard extends StatelessWidget {
  final String mangaName;
  final SvgPicture mangaImg;
  final bool hasNotification;
  final int notificationCount;

  const MangaCard(this.mangaName, this.mangaImg, this.hasNotification, this.notificationCount, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 240,
      child: Stack(
        children: [
          mangaImg,
          Column(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Container(
                height: 50,
                width: 240, 
                color: const Color.fromARGB(107, 27, 33, 50), 
                alignment: Alignment.center,
                child: Text(
                  mangaName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(color: majorTextColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          if (hasNotification)
            Positioned(
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
                  minHeight: 20,
                ),
                child: Text(
                  "$notificationCount", 
                  style: GoogleFonts.nunito(
                    color: majorTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
