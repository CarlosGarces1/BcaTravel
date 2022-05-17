import 'package:bcatravel/widgets/inputb.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    var texts = [
      'Al registrarse aceptas nuestras ',
      'Condiciones de uso ',
      ' y ',
      'Política de privacidad'
    ];

    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/fondologin.png",
              fit: BoxFit.cover,
              width: media.width,
              height: media.height * 1,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: media.width,
              height: media.height,
              // color: Colors.blue,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'BCA Travel',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      formRegister(),
                      const SizedBox(
                        height: 41,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: media.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'home');
                            },
                            child: const Text('Registrarme'),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BreeSerif',
                              ),
                              elevation: 5,
                              shadowColor: Colors.black,
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      Text.rich(
                        TextSpan(
                          text: texts[0],
                          children: [
                            TextSpan(
                              text: texts[1],
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'condiciones');
                                },
                            ),
                            TextSpan(
                              text: texts[2],
                            ),
                            TextSpan(
                              text: texts[3],
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'politicas');
                                },
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'BreeSerif',
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Form formRegister() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nombre completo',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BreeSerif',
                    fontSize: 16,
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InputV1B(
              icon: const Icon(Icons.person, color: Colors.black),
              colorIcon: Colors.black,
              type: TextInputType.text,
              placeholder: 'Nombre completo',
              onChanged: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Correo Electronico',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BreeSerif',
                    fontSize: 16,
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InputV1B(
              icon: const Icon(Icons.email, color: Colors.black),
              placeholder: 'Correo Electronico',
              type: TextInputType.number,
              onChanged: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contraseña',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BreeSerif',
                    fontSize: 16,
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // input password
            InputV1B(
              icon: const Icon(Icons.lock_rounded, color: Colors.black),
              password: true,
              placeholder: '********',
              type: TextInputType.visiblePassword,
              onChanged: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }

  // String generateBackground() {
  //   final List<dynamic> backgroundList = [
  //     "assets/images/fondoPromotorLogin.png",
  //     "assets/images/fondoArbitroAuth.png",
  //     "assets/images/fondoDtAuth.png",
  //   ];
  //   Random rdm = Random();
  //   int backgroundIndex = rdm.nextInt(backgroundList.length);
  //   String backgroundImage = backgroundList[backgroundIndex];
  //   return backgroundImage;
  // }
}
