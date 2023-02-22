import 'package:bcatravel/user/buscar/buscarScreen.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/widgets/place_card_categoriesd.dart';
import 'package:bcatravel/user/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  final PageController _pageController = PageController(
    initialPage: 1,
  );
  int _selectedIndex = 1;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Center(
              child: Text('Google Maps'),
            ),
            Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/fondoPrincipal.png",
                        fit: BoxFit.cover,
                        width: media.width,
                        height: media.height,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/logoCirculo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20),
                          child: Text(
                            'Bienvenido',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: Categories1.places.length,
                            itemExtent: 350,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            itemBuilder: (context, index) {
                              final place = Categories1.places[index];
                              return Hero(
                                tag: place.id,
                                child: Material(
                                  child: PlaceCardCate(
                                    place: place,
                                    onPressed: () async {
                                      if (index == 0) {
                                        Navigator.pushNamed(
                                            context, 'transporte');
                                      }
                                      if (index == 1) {
                                        Navigator.pushNamed(context, 'hotel');
                                      }
                                      if (index == 2) {
                                        Navigator.pushNamed(context, 'resta');
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: ProfileScreen(),
            ),
            const Center(
              child: BuscarScreen(),
            ),
          ],
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xffF3E91E),
          child: Row(
            children: [
              GestureDetector(
                onVerticalDragStart: (details) {
                  showMenu();
                },
                child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      showMenu();
                    }),
              ),
              const Spacer(),
              GestureDetector(
                onVerticalDragStart: (details) {
                  showMenu1();
                },
                child: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showMenu1();
                    }),
              ),
            ],
          ),
        ),
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

  showMenu() {
    showModalBottomSheet(
        transitionAnimationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 400)),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: size.height * 0.00005,
                  color: Colors.transparent,
                ),
                SizedBox(
                    height: (size.height * 0.215).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color(0xffF3E91E),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: const Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: const Text(
                                      "Principal",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(FontAwesomeIcons.house,
                                        color: Colors.black),
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 1;
                                        _pageController.animateToPage(
                                          _selectedIndex,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      });
                                    },
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Mapa",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.locationDot,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 0;
                                        _pageController.animateToPage(
                                          _selectedIndex,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      });
                                    },
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Perfil",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.userNinja,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 2;
                                        _pageController.animateToPage(
                                          _selectedIndex,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear,
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          );
        });
  }

  showMenu1() {
    showModalBottomSheet(
        transitionAnimationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 400)),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;

          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(30.0),
              ),
              color: Colors.black,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: size.height * 0.00005,
                  color: Colors.transparent,
                ),
                SizedBox(
                    height: (size.height * 0.148).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color(0xffF3E91E),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: const Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: const Text(
                                      "Reportar un problema",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.bug,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      launchURL(context,
                                          'https://forms.gle/yQvqnE8poK6ENKcL6');
                                    },
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Desarrolladores",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.code,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, 'developer');
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          );
        });
  }
}
