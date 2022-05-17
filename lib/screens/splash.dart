import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    String hola = 'g';
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          // future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (hola == '') {
              Future.microtask(
                () async {
                  await Future.delayed(
                    const Duration(seconds: 2),
                  );
                  Navigator.pushReplacementNamed(context, 'home');
                },
              );
            } else {
              Future.microtask(
                () async {
                  await Future.delayed(
                    const Duration(seconds: 2),
                  );
                  Navigator.pushReplacementNamed(context, 'login');
                },
              );
            }
            return Positioned(
              child: Image.asset(
                "assets/images/Splash.png",
                fit: BoxFit.cover,
                width: media.width,
                height: media.height,
              ),
            );
          },
        ),
      ),
    );
  }
}
