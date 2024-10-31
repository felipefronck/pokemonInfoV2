import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/app/components/custom_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Pokedex"),
      ),
      child: CustomInputWidget(),
    );
  }
}