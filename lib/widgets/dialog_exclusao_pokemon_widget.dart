import 'package:flutter/cupertino.dart';

  void showExcluirPokemon(BuildContext context) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Excluir Pokemon?'),
          content: Text('Tem certeza que deseja excluir esse '),
          actions: [
            CupertinoDialogAction(
              child: Text('Sim'),
              onPressed: () {
                
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
