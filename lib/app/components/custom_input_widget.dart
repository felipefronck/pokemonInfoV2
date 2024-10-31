import 'package:flutter/cupertino.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoTextField(
      placeholder: "Informe o ID ou Nome do Pokemon",
    );
  }
}