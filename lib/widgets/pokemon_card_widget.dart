import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';
import 'package:pokemon_info_2/widgets/dialog_exclusao_pokemon.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;
  final VoidCallback onDelete;
  final PokemonController controller;

  const PokemonCardWidget ({
    super.key, 
    required this.pokemon,
    required this.onDelete,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey3,
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.8),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "#${pokemon.id.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  pokemon.name.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
              const SizedBox(height: 15),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                pokemon.imgpath,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                 onPressed: () => showExcluirPokemon(context, pokemon.id, controller),
                  child: Icon(
                  EvaIcons.trash2Outline,
                  size: 20,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}