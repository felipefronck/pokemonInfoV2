import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/app/pages/home/home_page.dart';

class Appwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor:CupertinoColors.systemPurple,
      ),
      home: HomePage(),
    );
  }
}