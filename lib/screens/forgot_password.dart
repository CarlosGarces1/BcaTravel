import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Password reset email sent'),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message.toString()),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                          SizedBox(
                            width: media.width * 0.2,
                            height: media.height * 0.2,
                            child: Image.asset('assets/images/Logo.png'),
                          ),
                          // const Text(
                          //   'BCA Travel',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: media.height * 0.009,
                      ),
                      Text('Olvidaste tu contraseña?',
                          style: TextStyle(
                              fontSize: media.width * 0.05,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: media.height * 0.07,
                      ),
                      SizedBox(
                        height: media.height * 0.009,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, right: 40),
                        child: Text(
                            'Por favor, ingresa tu correo electronico y te enviaremos un correo con un enlace para restablecer tu contraseña.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: media.width * 0.05,
                                fontWeight: FontWeight.normal)),
                      ),
                      SizedBox(
                        height: media.height * 0.07,
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
                        height: media.height * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: media.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              passwordReset();
                            },
                            child: const Text('Enviar correo'),
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
}
