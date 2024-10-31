import 'package:flutter/cupertino.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CupertinoTextField(
        placeholder: "Procurar Pokemon",
      ),
    );
  }
}