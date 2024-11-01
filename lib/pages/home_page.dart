import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/widgets/custom_filter_widget.dart';
import 'package:pokemon_info_2/widgets/custom_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView( 
        child: Column(
          children: [
            CustomInputWidget(),
            const CustomFilterWidget(),
          ]
        )
      )
    );
  }
}