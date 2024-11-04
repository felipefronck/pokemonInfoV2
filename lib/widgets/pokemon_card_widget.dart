import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/models/pokemon_model.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;
  final VoidCallback onDelete;

  const PokemonCardWidget ({
    super.key, 
    required this.pokemon,
    required this.onDelete,
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
          children: [
            Text(
              "#${pokemon.id.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(
              child: Text(
                pokemon.name.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
              const SizedBox(height: 20),
            SizedBox(
              width: 65,
              height: 65,
              child: Image.network(
                pokemon.imgpath,
                fit: BoxFit.scaleDown,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CupertinoButton(
                 onPressed: onDelete,
                child: Icon(
                CupertinoIcons.delete
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}