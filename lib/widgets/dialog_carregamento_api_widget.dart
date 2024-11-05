import 'package:flutter/cupertino.dart';

  void showErroLoadDb(BuildContext context, String e) {
    showCupertinoDialog(
      context: context, 
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Erro'),
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
