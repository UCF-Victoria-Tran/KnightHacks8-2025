import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  Map<String, List<Map<String, dynamic>>> groupedManga = {};

  @override
  void initState() {
    super.initState();
    loadAndGroupManga();
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      print("refreshing");
    });
  }

  Future<void> loadAndGroupManga() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final List<dynamic> data = json.decode(response);

    groupedManga.clear();

    for (var item in data) {
      final String identifier = item['identifier'];

      final mangaEntry = {
        "title": item['title'],
        "read_chapters": item['read_chapters'] ?? 0,
        "total_chapters": item['total_chapters'] ?? 0,
        "identifier": item['identifier'],
        "cover_image": item['cover_image'] ?? mangaImagePlaceholder,
      };

      if (!groupedManga.containsKey(identifier)) {
        groupedManga[identifier] = [];
      }
      groupedManga[identifier]!.add(mangaEntry);
    }

    setState(() {});
  }

  // Function to compute if there should be a notification
  bool computeHasNotification(Map<String, dynamic> manga) {
    return (manga['identifier'] == "Waiting for updates") &&
        (manga['total_chapters'] > manga['read_chapters']);
  }

  // Function to compute notification count
  int computeNotificationCount(Map<String, dynamic> manga, bool hasNotification) {
    if (hasNotification) {
      return manga['total_chapters'] - manga['read_chapters'];
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth < 450) {
      crossAxisCount = 2;
    } else if (screenWidth <= 700) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    final double cardHeight = 350;
    final double cardWidth = 240;
    final double childAspectRatio = cardWidth / cardHeight;

    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            children: groupedManga.entries.map((entry) {
              final identifier = entry.key;
              final mangaList = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    identifier,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: childAspectRatio,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: mangaList.map((manga) {
                      final bool hasNotification = computeHasNotification(manga);
                      final int notificationCount = computeNotificationCount(manga, true);

                      return MangaCard(manga['title'], mangaImagePlaceholder, hasNotification, notificationCount,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
