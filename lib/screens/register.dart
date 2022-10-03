import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passwordConfirmedController = TextEditingController();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    // final _confettiController = ConfettiController();

    // Widget _buttonRegister() {}

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
        //backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: media.height * 0.15,
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
              child: Image.network(
                'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
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

    Future addUserDetails(String firstName, String lastName, String email,
        String imageUrl) async {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final User? user = auth.currentUser;
      final uid = user?.uid;

      final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

      final json = {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profileimage': imageUrl
      };

      await docUser.set(json);

      // await FirebaseFirestore.instance.collection('users').add({
      //   'uid': uid,
      //   'firstName': firstName,
      //   'lastName': lastName,
      //   'email': email,
      //   'profileimage': imageUrl
      // });
    }

    Future signUp() async {
      if (_emailController.text.trim() != '' &&
          _passwordController.text.trim() != '') {
        if (passwordconfirmed()) {
          // registrar usuario en firebase, pero solo el correo y contraseña
          Fluttertoast.showToast(
              msg: "Registrando usuario",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0);
          String imageUrl = '';
          try {
            firebase_storage.UploadTask uploadTask;

            firebase_storage.Reference ref = firebase_storage
                .FirebaseStorage.instance
                .ref()
                .child('userimage')
                .child('/' + file.name);

            uploadTask = ref.putFile(File(file.path));

            await uploadTask.whenComplete(() => null);

            imageUrl = await ref.getDownloadURL();

            setState(() {
              sioadjas = imageUrl;
            });
          } catch (e) {
            Fluttertoast.showToast(
                msg: e.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

          // registrar usuario en firestore

          addUserDetails(
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            _emailController.text.trim(),
            imageUrl,
          );

          Navigator.of(context).pushReplacementNamed('bottom');
        } else {
          Fluttertoast.showToast(
              msg: "Las contraseñas no son iguales",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Llene los campos solicitados",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }

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
                        height: 50,
                      ),
                      // Column(
                      //   children: [
                      //     selectedFileName.isEmpty
                      //         ? ClipOval(
                      //             child: Image.network(
                      //               'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                      //               width: 160,
                      //               height: 160,
                      //               fit: BoxFit.contain,
                      //             ),
                      //           )
                      //         : ClipOval(
                      //             child: Image.file(
                      //               File(file.path),
                      //               width: 160,
                      //               height: 160,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //   ],
                      // ),
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
                      // ProfileWidget(
                      //   imagePath:
                      //       'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                      //   onClicked: () {
                      //     // _showPicker(context);
                      //   },
                      // ),
                      _textFieldUsername(),
                      _textFieldUsername2(),
                      _textFieldEmail(),
                      _textFieldPassword(),
                      _textFieldConfirmPassword(),
                      GestureDetector(
                        onTap: () {
                          signUp();
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
