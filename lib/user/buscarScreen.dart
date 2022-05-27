// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BuscarScreen extends StatelessWidget {
  const BuscarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: media.height,
          width: media.width,
        ),
      ),
    );
  }
}
