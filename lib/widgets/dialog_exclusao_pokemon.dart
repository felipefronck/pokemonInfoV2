import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_info_2/controllers/pokemon_controller.dart';

  void showExcluirPokemon(BuildContext context, int id, PokemonController controller) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Deseja excluir o item?'),
          actions: [
            CupertinoDialogAction(
              child: Text('SIM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await controller.deletePokemon(id, context);
              }
            ),
            CupertinoDialogAction(
              child: Text('NÃO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]
        );
      }
    );
  }
