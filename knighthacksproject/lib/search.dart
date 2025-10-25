import 'package:flutter/material.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/icon.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            headerHintStyle: TextStyle(color: unfocusedTextColor),
            headerTextStyle: TextStyle(color: minorTextColor),
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                hintText: "Search",
                textStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(color: minorTextColor)),
                hintStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(color: unfocusedTextColor)),
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
            // adjust this to popular titles?
            suggestionsBuilder: (
              BuildContext context,
              SearchController controller,
            ) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
        ),
      ],
    ));
  }
}
