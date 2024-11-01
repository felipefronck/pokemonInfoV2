import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/api_service.dart';
import 'package:pokemon_info_2/pokemon_model.dart';

class CustomInputWidget extends StatelessWidget {
  CustomInputWidget({super.key});
  final TextEditingController controller = TextEditingController();

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

void onSubmittedPokemonSearch(controller) async{
  String query = controller.text.toLowerCase();
  ApiService apiService = ApiService();
  final List<PokemonModel> _pokemonList = [];

  try {
    PokemonModel pokemon = await apiService.getAll(query);
    
    setState(() {
      _pokemonCard = apiService.getAll(query);
      _pokemonList.add(pokemon);
    });

    controller.clear();

  } catch (e) {
    print("erro: $e");
  }

  controller.clear();

}