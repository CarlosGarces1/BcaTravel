import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/fondologin.png",
              fit: BoxFit.cover,
              width: media.width,
              height: media.height,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Image(
                                image: AssetImage("assets/images/Logo.png"),
                                height: 180)),
                        const Text(
                          'BCA',
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Travel',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: media.height * 0.317,
                    width: media.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: media.height * 0.1,
                          width: media.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text('Iniciar sesion'),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BreeSerif',
                              ),
                              elevation: 10,
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: media.height * 0.1,
                          width: media.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: const Text('Registrase'),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BreeSerif',
                              ),
                              elevation: 10,
                              shadowColor: Colors.black,
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Necesitas Ayuda?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
