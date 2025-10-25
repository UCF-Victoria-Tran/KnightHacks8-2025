import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/manga_card.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  static const String placeholderSvg = '''
    <svg width="240" height="320" viewBox="0 0 240 320" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect width="240" height="320" rx="8" fill="#3D4A66"/>
      <text x="120" y="160" font-family="sans-serif" font-size="24" fill="#FFFFFF" text-anchor="middle" alignment-baseline="middle">Manga Cover</text>
      <rect x="0" y="270" width="240" height="50" fill="#1B2132" fill-opacity="0.5"/>
    </svg>
  ''';

  final SvgPicture mangaImagePlaceholder = SvgPicture.string(
    placeholderSvg,
    width: 240.0,
    height: 320.0,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth < 450) {
      crossAxisCount = 2; // < 450px wide: 2 columns
    } else if (screenWidth <= 700) {
      crossAxisCount = 3; // 450px to 700px wide: 3 columns
    } else {
      crossAxisCount = 4; // > 700px wide: 4 columns
    }

    // calculate the aspect ratio to maintain card shape consistency
    final double cardHeight = 350;
    final double cardWidth = 240;
    final double childAspectRatio = cardWidth / cardHeight;

    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: childAspectRatio,
          children: [
            MangaCard("Gachiakuta", mangaImagePlaceholder, true, 212),
            MangaCard("The God of High School",mangaImagePlaceholder,false,0,),
            MangaCard("Jujutsu Kaisen", mangaImagePlaceholder, true, 12),
            MangaCard("Attack on Titan", mangaImagePlaceholder, false, 0),
            MangaCard("Chainsaw Man", mangaImagePlaceholder, false, 0),
            MangaCard("One Piece", mangaImagePlaceholder, true, 4),
            MangaCard("Boku no Hero Academia", mangaImagePlaceholder, false, 0),
            MangaCard("Tokyo Ghoul", mangaImagePlaceholder, false, 0),
            MangaCard("Death Note", mangaImagePlaceholder, false, 0),
            MangaCard("Dragon Ball", mangaImagePlaceholder, false, 0),
            MangaCard("Naruto", mangaImagePlaceholder, true, 36),
            MangaCard("Bleach", mangaImagePlaceholder, false, 0),
          ],
        ),
      ),
    );
  }
}
