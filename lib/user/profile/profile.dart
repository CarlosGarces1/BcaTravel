import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  //Widget circular de foto

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

  // Obtener datos de los usuarios de la base de datos

  getuser(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: SizedBox(
          height: media.height * 0.21,
          width: media.width,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10, right: 20),
            child: Stack(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'edit');
                      },
                      child: ClipOval(
                        child: Image.network(
                          "https://lh3.googleusercontent.com/a-/AFdZucpaioQw3FVX3MKuL26ARCnxTp1LNkbSRPmsNhKjDAo=s288-p-no",
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.56,
                      height: media.height * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              'Nombre:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: media.height * 0.01,
                            ),
                            const Text(
                              "Carlos Felipe Garcés Yepes",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: media.height * 0.01,
                            ),
                            const Text(
                              'Correo:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: media.height * 0.01,
                            ),
                            const Text(
                              'felipegarces1608@gmail.com',
                              style: TextStyle(fontSize: 15),
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
                      Navigator.pushNamed(context, 'edit');
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          //Imagen de fondo
          Positioned(
            child: Image.asset(
              "assets/fondoPrincipal.png",
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
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
                //informacion del usuario(nombre, correo)
                getuser(context),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Column(children: [
                  ListTile(
                    //Ir al about page
                    onTap: () {
                      Navigator.pushNamed(context, 'about');
                    },
                    title: const Text('Acerca de:',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        FontAwesomeIcons.info,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Ir a facebook
                  ListTile(
                    onTap: () {
                      launchURL(context,
                          'https://www.facebook.com/profile.php?id=100086288089514');
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
                  //Ir a instagram
                  ListTile(
                    onTap: () {
                      launchURL(
                          context, 'https://www.instagram.com/bcatravelapp/');
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
                  //Ir a twitter
                  ListTile(
                    onTap: () {
                      launchURL(context,
                          'https://twitter.com/BarrancaTravel?t=CB4797Am_kEMq01OpAgkeg&s=09');
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
                  //Cerrar sesion
                  ListTile(
                    onTap: () {
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
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Lanzar una url en internet

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
