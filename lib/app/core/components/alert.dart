import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  String leftButton;
  String rightButton;

  Alert({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
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
          onPressed: onPressed,
          child: Text(leftButton, style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(rightButton, style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
