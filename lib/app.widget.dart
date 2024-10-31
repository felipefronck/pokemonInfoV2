import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/home_module.dart';

class Appwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Pokedex',
      theme: CupertinoThemeData(
        primaryColor:CupertinoColors.systemPurple,
      ),
      home: HomePage(),
    );
  }
}