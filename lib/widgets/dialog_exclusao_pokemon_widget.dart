import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';

  void showExcluirPokemon(BuildContext context, int id) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Deseja excluir o item?'),
          actions: [
            CupertinoDialogAction(
              child: Text('Sim'),
              onPressed: () async {
                await PokemonController().deletePokemon(id);
                Navigator.of(context).pop();
              }
            ),
            CupertinoDialogAction(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]
        );
      }
    );
  }
