import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void showErroLoadDb(BuildContext context, String e) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Erro'),
          content: Text(e),
          actions: [
            CupertinoDialogAction(
              child: Text('Ok',
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
