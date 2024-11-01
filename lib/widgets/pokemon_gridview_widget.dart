import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';

class PokemonGridviewWidget extends StatelessWidget {
  final List<PokemonModel> pokemons;

  const PokemonGridviewWidget({
    super.key, 
    required this.pokemons
    });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4
        ), 
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return card;
      }
      );
  }
}