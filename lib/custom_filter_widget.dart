import 'package:flutter/cupertino.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filtros",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CupertinoTextField(
                  
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: CupertinoTextField(
                  
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: CupertinoTextField(
                  
                ),
              ),
              SizedBox(
                width: 20
              ),
              Expanded(
                flex: 1,
                child: CupertinoButton(
                  onPressed: onPressedBtnFiltrar(),
                  child: Text(
                    "Filtrar"
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}