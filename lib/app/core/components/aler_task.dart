import 'package:flutter/material.dart';

class AlerTask extends StatelessWidget {
  final String title;
  final String content;
  String leftButton;
  String rightButton;

  AlerTask({
    super.key,
    required this.title,
    required this.content,
    required this.leftButton,
    required this.rightButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(leftButton, style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {},
          child: Text(rightButton, style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
