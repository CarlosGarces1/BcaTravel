import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text( '$args' , style: const TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}