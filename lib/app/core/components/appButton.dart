import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
  Appbutton({
    super.key,
    required this.label,
    required this.color,
    this.onPressed,
    required this.height,
    required this.width,
  });

  final String label;
  final color;
  void Function()? onPressed;
  double height = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
