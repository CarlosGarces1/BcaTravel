import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonApp extends StatelessWidget {
  Color color;
  Color textColor;
  String text;
  IconData icon;
  Function onPressed;

  ButtonApp(
      {Key? key,
      this.color = Colors.black,
      this.textColor = Colors.white,
      this.icon = Icons.arrow_forward_ios,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor
          ),
        ));
  }
}
