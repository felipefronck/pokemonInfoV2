import 'package:flutter/cupertino.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';

  void showExcluirPokemon(BuildContext context, int id, PokemonController controller) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Deseja excluir o item?'),
          actions: [
            CupertinoDialogAction(
              child: Text('Sim'),
              onPressed: () async {
                Navigator.of(context).pop();
                await controller.deletePokemon(id, context);
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
