import 'package:flutter/material.dart';

import 'librum_theme.dart';
import 'package:librum/home.dart';

void main() {
  runApp(const Librum());
}

class Librum extends StatelessWidget {
  const Librum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = LibrumTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Librum',
      home: const Home(),
    );
  }
}
