import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/icon.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> searchBarItems = [
    'One Piece',
    'Pokemon',
    'Gachiakuta',
    'Solo Leveling',
    'Chainsaw Man'
  ];

  bool _showWidgetAfterSearch = false;

  Widget _widgetAfterSearch() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: unfocusedTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        'You selected ${searchBarItems.first}!',
        style: GoogleFonts.nunito(color: majorTextColor, fontSize: 16),
      ),
    );
  }

  // loading bar, haven't changed the colors yet
  Widget loadingBar() {
    return const LinearProgressIndicator();
  }

  void editSearchBarItems() {
    
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: unfocusedTextColor
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: unfocusedTextColor
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: unfocusedTextColor,
          selectionColor: unfocusedTextColor,
        )
      ),
      child: Column(
      children: [
        SizedBox(height: 15),
        SizedBox(
          height: 45,
          width: screenWidth - 20,
          child: SearchAnchor(
            viewBackgroundColor: bgDarker,
            viewSurfaceTintColor: unfocusedTextColor,
            viewHintText: "Search",
            headerHintStyle: GoogleFonts.nunito(color: unfocusedTextColor),
            headerTextStyle: GoogleFonts.nunito(color: minorTextColor),
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                hintText: "Search",
                textStyle: WidgetStatePropertyAll<TextStyle>(GoogleFonts.nunito(color: minorTextColor)),
                hintStyle: WidgetStatePropertyAll<TextStyle>(GoogleFonts.nunito(color: unfocusedTextColor)),
                backgroundColor: WidgetStatePropertyAll<Color>(bgDarker),
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 5.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const SearchUnfocusedIcon(),
              );
            },
            suggestionsBuilder: (
              BuildContext context,
              SearchController controller,
            ) {
              return List<ListTile>.generate(searchBarItems.length, (int index) {
                final String item = searchBarItems[index];
                return ListTile(
                  title: Text(item, style: GoogleFonts.nunito(color: majorTextColor),),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                      if (index == 0) {
                        _showWidgetAfterSearch = true;
                      } else {
                        _showWidgetAfterSearch = false;
                      }
                    });
                  },
                );
              });
            },
          ),
        ),
        if (_showWidgetAfterSearch) ...[
          const SizedBox(height: 15),
          _widgetAfterSearch()
        ]
      ],
    ));
  }
}
