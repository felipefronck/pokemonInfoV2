import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/home_module.dart';

class Appwidget extends StatelessWidget {
  const Appwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Pokedex',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor:CupertinoColors.systemGrey,
      ),
      home: HomePage(),
    );
  }
}