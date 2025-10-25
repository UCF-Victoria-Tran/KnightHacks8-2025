import 'package:flutter/material.dart';
import 'package:knighthacksproject/colors.dart';

// TODO: fix when multiple manga/manhwa are in the list it will go through
// the box constraints. Got to append and add a ListViewer/horizontal scroll

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key});

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  Widget savedTitleCards(List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var title in titles)
          (title.length > 20)
              ? ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(2),
                  color: bg,
                  child: Text(
                    "${title.substring(20)}...",
                    style: TextStyle(fontSize: 9, color: minorTextColor),
                  ),
                ),
              )
              : ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(2),
                  color: bg,
                  child: Text(title, style: TextStyle(fontSize: 9, color: minorTextColor)),
                ),
              ),
      ],
    );
  }

  Widget MonitoringCard(
    double width,
    String siteName,
    List<String> titles,
    bool isError,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: [
          SizedBox(height: 60, width: width, child: Container(color: bgDarker)),
          SizedBox(
            width: width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(radius: 10),
                  ),
                ),
                SizedBox(
                  width: width - 120,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        siteName,
                        style: TextStyle(fontSize: 16, color: majorTextColor),
                        textAlign: TextAlign.left,
                      ),
                      savedTitleCards(titles),
                    ],
                  ),
                ),
                (isError)
                    ? SizedBox(width: 20, child: Container(color: error))
                    : SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        MonitoringCard(screenWidth - 20, 'Mangadex', [
          'Chainsaw Man',
          'Gachiakuta',
        ], false),
        SizedBox(height: 15),
        MonitoringCard(screenWidth - 20, 'Asurascans', ['One Piece'], true),
      ],
    );
  }
}
