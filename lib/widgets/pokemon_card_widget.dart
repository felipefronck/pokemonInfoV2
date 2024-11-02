import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCardWidget ({
    super.key, 
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              blurRadius: 4.0,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Column(
          children: [
            Text(pokemon.id.toString()),
            Text(pokemon.name),
            Image.network(pokemon.imgpath)
          ],
        ),
      ),
    );
  }
}