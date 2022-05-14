import 'package:bcatravel/widgets/inputb.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
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
          // Positioned(
          //     child: Container(
          //   width: media.width,
          //   height: media.height,
          //   color: Colors.black,
          // )),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: media.width,
              height: media.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: const [
                          Text(
                            'BCA Travel',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                      formLogin(),
                      const SizedBox(
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: media.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Iniciar sesion'),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BreeSerif',
                              ),
                              elevation: 5,
                              shadowColor: Colors.grey,
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: media.width,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    right: BorderSide(color: Colors.white),
                                  )),
                                  // child: Image.asset(
                                  //   'assets/images/cancha.png',
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: SizedBox(
                                  width: 120,
                                  child: Text(
                                    '¿Quieres saber más sobre BCA Travel?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'BreeSerif',
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(context, 'infoRol');
                                      },
                                      child: const Text(
                                        'Conoce más',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily: 'BreeSerif',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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

  Form formLogin() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // label phone
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
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
          // input phone
          InputV1B(
            icon: const Icon(Icons.email, color: Colors.black),
            colorIcon: Colors.black,
            type: TextInputType.emailAddress,
            placeholder: 'Email',
            onChanged: (value) {},
            validator: (value) {},
          ),
          const SizedBox(
            height: 15,
          ),
          // label password
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
            icon: const Icon(
              Icons.lock_rounded,
              color: Colors.black,
            ),
            password: true,
            placeholder: '********',
            type: TextInputType.visiblePassword,
            onChanged: (value) {},
            validator: (value) {},
          ),
        ],
      ),
    );
  }
}
