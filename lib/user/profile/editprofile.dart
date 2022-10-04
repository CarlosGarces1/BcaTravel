import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/button_app.dart';

class EditProfilePage extends StatefulWidget {
  final String email;
  final String nombre;
  final String nombre2;
  final String foto;

  const EditProfilePage(this.email, this.nombre, this.nombre2, this.foto,
      {Key? key})
      : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String selectedFileName = '';

  late XFile file;

  String sioadjas = '';

  final bool isEdit = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  late final User? user = auth.currentUser;

  late final uid = user?.uid;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final _emailController = TextEditingController(text: widget.email);
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    // final _confettiController = ConfettiController();

    // Widget _buttonRegister() {}

    Widget _textFieldEmail() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          enabled: false,
          controller: _emailController,
          decoration: const InputDecoration(
              focusColor: Colors.white,
              hoverColor: Colors.white,
              // hintText: ,
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
          decoration: InputDecoration(
              hintText: widget.nombre,
              labelText: 'Nombre',
              suffixIcon: const Icon(
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
          decoration: InputDecoration(
              hintText: widget.nombre2,
              labelText: 'Apellido',
              suffixIcon: const Icon(
                Icons.person_outline,
              )),
        ),
      );
    }

    _selectFile(bool imageFrom) async {
      file = (await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera,
      ))!;
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
                widget.foto,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
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
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          users
                              .doc(uid)
                              .update({
                                'firstName': _firstNameController.text.trim(),
                                'lastName': _lastNameController.text.trim(),
                              })
                              .then(
                                (value) => Fluttertoast.showToast(
                                    msg: "Usuario actualizado ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0),
                              )
                              .catchError((error) => Fluttertoast.showToast(
                                  msg: error,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0));
                                  Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 25),
                          child: ButtonApp(
                            color: Colors.black,
                            onPressed: () {
                              users
                                  .doc(uid)
                                  .update({
                                    'firstName':
                                        _firstNameController.text.trim(),
                                    'lastName': _lastNameController.text.trim(),
                                  })
                                  .then(
                                    (value) => Fluttertoast.showToast(
                                        msg: "Usuario actualizado ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                                  )
                                  .catchError((error) => Fluttertoast.showToast(
                                      msg: error,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0));
                            },
                            text: 'Guardar usuario',
                            textColor: Colors.white,
                          ),
                        ),
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
