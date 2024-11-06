import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void showErroFiltragem(BuildContext context, String e) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Ocorreu um erro ao filtrar'),
          content: Text(e),
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
              }
            )
          ]
        );
      }
    );
  }
