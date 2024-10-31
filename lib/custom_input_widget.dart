import 'package:flutter/cupertino.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Procurar Pokemon",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 6),
          CupertinoTextField(),
        ],
      ),
    );
  }
}