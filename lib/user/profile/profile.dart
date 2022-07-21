import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10),
                  child: Text('Perfil',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.2,
              width: size.width,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, bottom: 10, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      // backgroundColor: Colors.red,
                      radius: size.height * 0.08,
                      backgroundImage: const NetworkImage(
                        "https://i.stack.imgur.com/S11YG.jpg?s=64&g=1",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.56,
                      height: size.height * 1,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              'Nombre:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'Carlos Felipe Garces Yepes',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'Correo:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'felipe@gmail.com',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Column(children: [
              ListTile(
                onTap: () {},
                title: const Text('Editar perfil',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.userPen),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Acerca de:',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.info),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Facebook',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.facebook),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Instagram',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.instagram),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Twitter',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.twitter),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('swiper');
                },
                title: const Text('Cerrar sesión',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(FontAwesomeIcons.rightFromBracket),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: Colors.red,
              //   child: CupertinoButton(
              //     onPressed: () {
              //       FirebaseAuth.instance.signOut();
              //       Navigator.of(context).pushReplacementNamed('swiper');

              //       // showCupertinoDialog<void>(
              //       //   context: context,
              //       //   builder: (BuildContext context) => CupertinoAlertDialog(
              //       //     title: const Text('Cerrar Sesion'),
              //       //     content: const Text(
              //       //         '¿Estas seguro de que quieres cerrar sesion?'),
              //       //     actions: <CupertinoDialogAction>[
              //       //       CupertinoDialogAction(
              //       //         child: const Text('No'),
              //       //         isDestructiveAction: true,
              //       //         onPressed: () {
              //       //           Navigator.pop(context);
              //       //         },
              //       //       ),
              //       //       CupertinoDialogAction(
              //       //         child: const Text('Si'),
              //       //         onPressed: () {
              //       //           Navigator.pushReplacementNamed(context, 'login');
              //       //         },
              //       //       ),
              //       //     ],
              //       //   ),
              //       // );
              //     },
              //     child: const Text('Cerrar sesion'),
              //   ),
              // ),
              //Pruebas futuras cosas
              // CupertinoContextMenu(
              //     child: Image.network(
              //         'https://cdn.icon-icons.com/icons2/272/PNG/512/Youtube_30038.png'),
              //     actions: <Widget>[
              //       CupertinoContextMenuAction(
              //         child: const Text('Opcion 1'),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       CupertinoContextMenuAction(
              //         child: const Text('Opcion 1'),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       CupertinoContextMenuAction(
              //         child: const Text('Opcion 1'),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       CupertinoContextMenuAction(
              //         child: const Text('Opcion 1'),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       CupertinoContextMenuAction(
              //         child: const Text('Salir'),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ])
              // CupertinoContextMenuAction
              // ListTile(
              //   onTap: () {
              //     CupertinoAlertDialog(
              //       title: const Text('Cerrar sesion'),
              //       content: const Text('Quieres cerrar Sesion?'),
              //       actions:[
              //         CupertinoDialogAction(
              //           child: const Text('No'),
              //           isDestructiveAction: true,
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //         ),
              //         CupertinoDialogAction(
              //           child: const Text('Yes'),
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //         ),
              //       ],
              //     );
              //     // Navigator.pushReplacementNamed(context, 'login');
              //     print('object');
              //   },
              //   title: const Text('Cerrar sesión',
              //       style: TextStyle(fontSize: 18, color: Colors.black)),
              //   leading: const CircleAvatar(
              //       backgroundColor: Colors.blue,
              //       child: Icon(Icons.logout_outlined)),
              //   trailing: const Icon(Icons.arrow_forward_ios),
              // ),
            ]),
          ],
        ),
      ),
    );
  }
}
