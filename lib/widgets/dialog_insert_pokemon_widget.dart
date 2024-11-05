import 'package:flutter/cupertino.dart';

  void showErroInserPokemon(BuildContext context, String e) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Erro ao inserir Pokemon'),
          content: Text(e),
          actions: [
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
              Navigator.of(context).pop();
            })
          ]
        );
      }
    );
  }
