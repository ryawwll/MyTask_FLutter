import 'package:flutter/material.dart';
import 'package:lapanganku/app/core/appColors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
    this.buttonColor,
  });

  final String label;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? Appcolors.basicColor,
          ),
        ),
        child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
