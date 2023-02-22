import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/button_app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedFileName = '';
  late XFile file;
  String sioadjas = '';
  final bool isEdit = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmedController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

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

    Widget _textFieldUsername() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
              hintText: 'Pepito',
              labelText: 'Nombre',
              suffixIcon: Icon(
                Icons.person_outline,
              )),
        ),
      );
    }

    Widget _textFieldUsername2() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
              hintText: 'Perez',
              labelText: 'Apellido',
              suffixIcon: Icon(
                Icons.person_outline,
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

    Widget _textFieldConfirmPassword() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: TextField(
          obscureText: true,
          controller: _passwordConfirmedController,
          decoration: const InputDecoration(
              labelText: 'Confirmar Contraseña',
              suffixIcon: Icon(
                Icons.lock_open_outlined,
              )),
        ),
      );
    }

    _selectFile(bool imageFrom) async {
      file = (await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera,
      ))!;

      setState(() {
        selectedFileName = file.name;
      });
    }

    _foto() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: media.height * 0.17,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                    ),
                    title: const Text(
                      'Galeria',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      _selectFile(true);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                  ),
                  title: const Text(
                    'Cámara',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    _selectFile(false);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buildImage() {
      return selectedFileName.isEmpty
          ? ClipOval(
              child: Image.asset(
                'assets/profilevacio.jpg',
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),
            )
          : ClipOval(
              child: Image.file(
                File(file.path),
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            );
    }

    Widget buildCircle({
      required Widget child,
      required double all,
      required Color color,
    }) =>
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: color,
            child: child,
          ),
        );

    Widget buildEditIcon() => buildCircle(
          color: Colors.white,
          all: 3,
          child: buildCircle(
            color: Colors.black,
            all: 8,
            child: Icon(
              selectedFileName.isEmpty ? Icons.add_a_photo : Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        );

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
          Positioned(
              child: Container(
            color: Colors.red,
            width: 1,
            height: 1,
          )),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: media.width,
              height: media.height,
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
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (() {
                          _foto();
                        }),
                        child: Center(
                          child: Stack(
                            children: [
                              buildImage(),
                              Positioned(
                                bottom: 0,
                                right: 4,
                                child: buildEditIcon(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _textFieldUsername(),
                      _textFieldUsername2(),
                      _textFieldEmail(),
                      _textFieldPassword(),
                      _textFieldConfirmPassword(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('bottom');
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 25),
                          child: ButtonApp(
                            color: Colors.black,
                            onPressed: () {},
                            text: 'Registrar ahora',
                            textColor: Colors.white,
                          ),
                        ),
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
}
