import 'package:flutter/cupertino.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filtros",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome",
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                    SizedBox(height: 6,),
                    CupertinoTextField(),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo",
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                    SizedBox(height: 6,),
                    CupertinoTextField(),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Movimentos",
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                    SizedBox(height: 6,),
                    CupertinoTextField(),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 35,
                      child: CupertinoButton.filled(
                        onPressed: onPressedBtnFiltrar,
                        borderRadius: BorderRadius.circular(50),
                        padding: EdgeInsets.zero,
                        child: const Center(
                          child: Text("Filtrar")
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }

  onPressedBtnFiltrar() async {
    return 0;
  }
}