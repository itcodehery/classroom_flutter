import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  final String text;
  final Color color;
  //onPressed function
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ))),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
