import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String Txt;
  final Color color;
  final double size;
  final FontWeight bold;
  const TextView(
      {super.key,
      required this.Txt,
      required this.color,
      required this.size,
      required this.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      Txt,
      style: TextStyle(color: color, fontSize: size, fontWeight: bold),
    );
  }
}
