import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void showPokemonNaPokedex(BuildContext context) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Erro ao inserir Pokemon'),
          content: Text('Pokemon já está na pokedex'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
              Navigator.of(context).pop();
            })
          ]
        );
      }
    );
  }
