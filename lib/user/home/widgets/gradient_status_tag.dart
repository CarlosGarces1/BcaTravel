import 'package:bcatravel/user/home/extensions/text_theme_x.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:flutter/material.dart';

class GradientStatusTag extends StatelessWidget {
  const GradientStatusTag({
    Key? key,
    required this.statusTag,
  }) : super(key: key);

  final StatusTag statusTag;

  @override
  Widget build(BuildContext context) {
    String text;
    List<Color> colors;
    switch (statusTag) {
      case StatusTag.popular:
        text = 'Lugar popular';
        colors = [Colors.amber, Colors.orange.shade600];
        break;
      case StatusTag.evento:
        text = 'Evento';
        colors = [Colors.cyan, Colors.blue.shade600];
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Text(
        text,
        style: context.subtitle1.copyWith(color: Colors.white),
      ),
    );
  }
}
