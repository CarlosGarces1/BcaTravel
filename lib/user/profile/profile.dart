import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'editprofile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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

  getuser(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final uid = user?.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SafeArea(
            child: Center(
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width,
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, bottom: 10, right: 20),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('edit');
                            },
                            child: ClipOval(
                              child: Image.network(
                                "${data['profileimage']}",
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
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
                                  Text(
                                    "${data['firstName']} ${data['lastName']}",
                                    style: const TextStyle(fontSize: 15),
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
                                  Text(
                                    '${data['email']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 95,
                        left: 100,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage(
                                      '${data['email']}',
                                      "${data['firstName']}",
                                      " ${data['lastName']}",
                                      "${data['profileimage']}")),
                            );
                          },
                          child: buildCircle(
                            color: Colors.white,
                            all: 3,
                            child: buildCircle(
                              color: Colors.blue,
                              all: 8,
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10),
                      child: Text('Perfil',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                getuser(context),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Column(children: [
                  Container(
                    color: Colors.grey.shade400,
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Acerca de:',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(50, 126, 126, 126))),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(50, 126, 126, 126),
                        child: Icon(
                          FontAwesomeIcons.info,
                          color: Color.fromARGB(50, 126, 126, 126),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(50, 126, 126, 126),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ListTile(
                    onTap: () {
                      launchURL(context,
                          'https://m.facebook.com/carlosfelipegarcesyepe/');
                    },
                    title: const Text('Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(FontAwesomeIcons.facebook),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ListTile(
                    onTap: () {
                      launchURL(context,
                          'https://instagram.com/cgarces16?igshid=YmMyMTA2M2Y=');
                    },
                    title: const Text('Instagram',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(FontAwesomeIcons.instagram),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ListTile(
                    onTap: () {
                      launchURL(context,
                          'https://twitter.com/carlosf86546392?s=11&t=3zaK0TQrZayHutGRfsh3mg');
                    },
                    title: const Text('Twitter',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(FontAwesomeIcons.twitter),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10,
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
          // ConfettiWidget(
          //   confettiController: _confettiController,
          //   blastDirection: 360,
          //   colors: [Colors.yellow, Colors.black],
          //   // emissionFrequency: 1,
          // ),
        ],
      ),
    );
  }

  Future launchURL(
    BuildContext context,
    String url,
  ) async {
    // final url ;

    if (await canLaunchUrlString(url)) {
      await launchUrlString(
        url,
        // Abrir sin navegador
        // mode: LaunchMode.inAppWebView,

        mode: LaunchMode.externalApplication,
        // webOnlyWindowName: '_self',
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
