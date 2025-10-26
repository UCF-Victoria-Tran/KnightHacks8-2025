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
  String? _selectedItem; // <-- store the selected item

  Widget _widgetAfterSearch() {
    if (_selectedItem == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: unfocusedTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        'You selected $_selectedItem!',
        style: GoogleFonts.nunito(color: majorTextColor, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: unfocusedTextColor,
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: unfocusedTextColor,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: unfocusedTextColor,
          selectionColor: unfocusedTextColor,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
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
                  textStyle: WidgetStatePropertyAll<TextStyle>(
                      GoogleFonts.nunito(color: minorTextColor)),
                  hintStyle: WidgetStatePropertyAll<TextStyle>(
                      GoogleFonts.nunito(color: unfocusedTextColor)),
                  backgroundColor: WidgetStatePropertyAll<Color>(bgDarker),
                  controller: controller,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 5.0),
                  ),
                  onTap: () => controller.openView(),
                  onChanged: (_) => controller.openView(),
                  leading: const SearchUnfocusedIcon(),
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                final input = controller.text.toLowerCase();
                final filteredItems = searchBarItems
                    .where((item) => item.toLowerCase().contains(input))
                    .toList();

                return List<ListTile>.generate(filteredItems.length, (int index) {
                  final String item = filteredItems[index];
                  return ListTile(
                    title: Text(item, style: GoogleFonts.nunito(color: majorTextColor)),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                        _selectedItem = item; // <-- store the selected item
                        _showWidgetAfterSearch = true;
                      });
                    },
                  );
                });
              },
            ),
          ),
          if (_showWidgetAfterSearch) ...[
            const SizedBox(height: 15),
            _widgetAfterSearch(), // <-- now shows the actual selected item
          ],
        ],
      ),
    );
  }
}

