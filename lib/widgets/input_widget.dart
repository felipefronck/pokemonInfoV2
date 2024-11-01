import 'package:flutter/cupertino.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final Function(String) onSubmittedPokemonSearch;
  
  InputWidget({
    super.key, 
    required this.onSubmittedPokemonSearch
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Procurar Pokemon",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          CupertinoTextField(
            controller: controller,
            onSubmitted: onSubmittedPokemonSearch,
          ),
        ],
      ),
    );
  }
}
