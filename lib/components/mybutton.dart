import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 120,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
