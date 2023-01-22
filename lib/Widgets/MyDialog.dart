import 'package:flutter/material.dart';

class MyDialog{
  Future<void> showMyDialog(context, String title,String mesaj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('$title'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(mesaj),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}