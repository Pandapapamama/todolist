import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text; //ประกาศให้จับเก็บ string ใน text
  VoidCallback onPressed;
  Mybutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(text),
    );
  }
}
