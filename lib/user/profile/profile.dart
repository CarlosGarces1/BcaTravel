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
            Column(
              children: [
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
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  title: const Text('Cerrar sesión',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.logout_outlined)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
