import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passwordConfirmedController = TextEditingController();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    // final _confettiController = ConfettiController();

    var texts = [
      'Al registrarse aceptas nuestras ',
      'Condiciones de uso ',
      ' y ',
      'Política de privacidad'
    ];

    bool passwordconfirmed() {
      // autenticar si las contraseñas coinciden
      if (_passwordController.text.trim() ==
          _passwordConfirmedController.text.trim()) {
        return true;
      } else {
        return false;
      }
    }

// añadir nombre y apellido al usuario

    Future addUserDetails(
        String firstName, String lastName, String email) async {
      await FirebaseFirestore.instance.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      });
    }

    Future signUp() async {
      if (passwordconfirmed()) {
        // registrar usuario en firebase, pero solo el correo y contraseña

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // registrar usuario en firestore

        addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
        );

        Navigator.of(context).pushReplacementNamed('bottom');
      }
    }

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
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          // keyboardType: TextInputType.name,ca
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'First Name',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'Last Name',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'Email',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          // keyboardType: TextInputType.,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'Password',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          controller: _passwordConfirmedController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: 'Confirm Password',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: media.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              signUp();
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
          Positioned(
            left: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }

  // Form formRegister() {

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
