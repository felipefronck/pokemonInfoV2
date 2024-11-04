import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/widgets/pokemon_card_widget.dart';

class PokemonGridviewWidget extends StatelessWidget{
  final List<PokemonModel> pokemons;
  final Function(int id) onDeletePokemon;

  const PokemonGridviewWidget({
    super.key, 
    required this.pokemons,
    required this.onDeletePokemon,
    });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7
        ), 
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return PokemonCardWidget(
          pokemon: pokemon,
          onDelete: () => onDeletePokemon(pokemon.id)
          );
      }
    );
  }
}