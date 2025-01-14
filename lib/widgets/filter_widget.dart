import 'package:flutter/cupertino.dart';

class FilterWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController moveController;
  final VoidCallback onFilter;

  const FilterWidget({
    super.key,
    required this.nameController,
    required this.typeController,
    required this.moveController,
    required this.onFilter
  });

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
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nome",
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                    const SizedBox(height: 6,),
                    CupertinoTextField(
                      controller: nameController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tipo",
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                    const SizedBox(height: 6,),
                    CupertinoTextField(
                      controller: typeController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
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
                    CupertinoTextField(
                      controller: moveController,
                    ),
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
                      width: 250,
                      child: CupertinoButton(
                        onPressed: onFilter,
                        color: const Color.fromARGB(255, 63, 63, 65),
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
}