import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonitorIcon extends StatelessWidget {
  const MonitorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/monitor.svg', width: 24.0, height: 24.0);
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/search.svg', width: 24.0, height: 24.0);
  }
}

class SavedIcon extends StatelessWidget {
  const SavedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/saved.svg', width: 24.0, height: 24.0);
  }
}
