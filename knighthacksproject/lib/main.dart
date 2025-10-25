import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knighthacksproject/tabs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // loading bar, haven't changed the colors yet
  Widget loadingBar() {
    return const LinearProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binder',
      home: const Tabs()
    );
  }
}