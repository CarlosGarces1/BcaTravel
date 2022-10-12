import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Developers extends StatelessWidget {
  const Developers({Key? key}) : super(key: key);

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
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20),
                child: Text(
                  'Desarrolladores',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              developer(
                  'https://lh3.googleusercontent.com/a-/ACNPEu99cKtFiTdbsIoniKBjaTBakQaSU5OHx-SUY5xm=s288-p-no',
                  'Jesus Raúl Villalobos',
                  'Desarrollador FrontEnd',
                  'https://github.com/Jeravima',
                  context),
              const SizedBox(
                height: 20,
              ),
              developer(
                  'https://lh3.googleusercontent.com/a-/AFdZucpaioQw3FVX3MKuL26ARCnxTp1LNkbSRPmsNhKjDAo=s288-p-no',
                  'Carlos Felipe Garcés ',
                  "Desarrollador BackEnd",
                  'https://github.com/CarlosGarces1',
                  context),
              const SizedBox(
                height: 20,
              ),
              developer(
                  'https://lh3.googleusercontent.com/a-/ACNPEu9MHWsw9akPyu1KSGb9K7Auzgp0zXvisc1InV-xdQ=s288-p-no',
                  'Cipriano Lopéz Vides ',
                  "Director del Proyecto",
                  'https://github.com/lopezvides',
                  context),
            ],
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
    ));
  }

  Widget developer(image, String name, asd, github, BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: Image.network(
                  image,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  asd,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      launchURL(context, github);
                    },
                    child: const FaIcon(FontAwesomeIcons.github)),
              ],
            ),
          ),
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
