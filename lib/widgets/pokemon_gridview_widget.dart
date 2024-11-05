import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/widgets/pokemon_card_widget.dart';

class PokemonGridviewWidget extends StatelessWidget{
  final List<PokemonModel> pokemons;
  final Function(int id) onDeletePokemon;
  final PokemonController controller;

  const PokemonGridviewWidget({
    super.key, 
    required this.pokemons,
    required this.onDeletePokemon,
    required this.controller,
    });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:LayoutBuilder(
        builder: (context, constraints) {
          int columns = (constraints.maxWidth / 180).floor();

          return Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  childAspectRatio: 1,
                  ), 
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return PokemonCardWidget(
                  pokemon: pokemon,
                  onDelete: () => onDeletePokemon(pokemon.id),
                  controller: controller,
                  );
                }
              )
            ]
          );
        }
      )
    );
  }
}