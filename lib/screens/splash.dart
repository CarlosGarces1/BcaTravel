import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  // Navigator.pushNamed(context, 'wt');
                  Navigator.pushReplacementNamed(context, 'principal');
                },
              );
            } else {
              Future.microtask(
                () async {
                  await Future.delayed(
                    const Duration(seconds: 2),
                  );
                  Navigator.pushReplacementNamed(context, 'initial');
                },
              );
            }
            return DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Image(
                        image: AssetImage("assets/images/Logo.png"),
                        height: 410),
                  ),
                  Image(
                      image: AssetImage("assets/images/logounipaz.jpg"),
                      height: 100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
