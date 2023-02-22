import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _emailController,
        decoration: const InputDecoration(
            focusColor: Colors.white,
            hoverColor: Colors.white,
            hintText: 'correo@gmail.com',
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              Icons.email_outlined,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        decoration: const InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
            )),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            body: SizedBox(
              width: media.width,
              height: media.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: media.height * 0.002,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            width: 200,
                            height: 200,
                            child: Image.asset(
                              'assets/logoCirculo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Bienvenido',
                          style: TextStyle(
                              fontSize: media.width * 0.05,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 50,
                      ),
                      _textFieldEmail(),
                      _textFieldPassword(),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: media.width * 0.4),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'forgot');
                              },
                              child: const Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontFamily: 'BreeSerif',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.08,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: media.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('bottom');
                            },
                            child: const Text('Iniciar sesion'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BreeSerif',
                              ),
                              elevation: 5,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
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
                                      shape: BoxShape.rectangle,
                                      border: Border(
                                        right: BorderSide(color: Colors.black),
                                      )),
                                  child: Image.asset(
                                    'assets/logoCirculo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: SizedBox(
                                  width: 160,
                                  child: Text(
                                    '¿Quieres registrarte'
                                    '           en BCA Travel?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'BreeSerif',
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Registrate',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily: 'BreeSerif',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
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
}
