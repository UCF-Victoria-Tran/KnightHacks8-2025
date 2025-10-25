import 'package:flutter/material.dart';
import 'package:knighthacksproject/colors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Text("Saved Page", style: TextStyle(color: majorTextColor),);
  }
}
