import 'package:flutter/material.dart';
import 'package:knighthacksproject/colors.dart';
import 'package:knighthacksproject/monitor.dart';
import 'package:knighthacksproject/saved.dart';
import 'package:knighthacksproject/searchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binder',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _currentBodyContent = MonitorPage();

  void _changeBodyContent(Widget newContent) {
    setState(() {
      _currentBodyContent = newContent;
    });
  }

  // loading page, haven't changed the colors yet
  Widget loadingBar() {
    return LinearProgressIndicator();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _currentBodyContent
          ],
        ),
      ),
      bottomNavigationBar: 
      Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BottomAppBar(
            color: bgDarker,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => _changeBodyContent(
                    MonitorPage()
                  ),
                  child: const Text('Monitor'),
                ),
                TextButton(
                  onPressed: () => _changeBodyContent(
                    SearchPage()
                  ),
                  child: const Text('Search'),
                ),
                TextButton(
                  onPressed: () => _changeBodyContent(
                    SavedPage()
                  ),
                  child: const Text('Saved'),
                ),
              ],
            )
          ),
        )
      ));
  }
}
