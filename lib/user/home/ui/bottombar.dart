import 'package:bcatravel/user/buscar/buscarScreen.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/ui/place_detail_screen.dart';
import 'package:bcatravel/user/home/widgets/place_card.dart';
import 'package:bcatravel/user/maps/googlemap.dart';
import 'package:bcatravel/user/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Center(
              child: GoogleMapsScreen(),
            ),
            Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Para ti',
                        style: TextStyle(
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
                        itemCount: TravelPlace.places.length,
                        itemExtent: 350,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(
                            20, 0, 20, kToolbarHeight + 20),
                        itemBuilder: (context, index) {
                          final place = TravelPlace.places[index];
                          return Hero(
                            tag: place.id,
                            child: Material(
                              child: PlaceCard(
                                place: place,
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, animation, __) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: PlaceDetailScreen(
                                          place: place,
                                          screenHeight: MediaQuery.of(context)
                                              .size
                                              .height,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // extendBody: true,
            ),
            const Center(
              child: BuscarScreen(),
            ),
            const Center(
              child: ProfileScreen(),
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
          // elevation: 8,
          color: Color.fromARGB(255, 220, 233, 10),
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

  showMenu() {
    // int index = 1;
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
              // color: Colors.black,
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
                    height: (size.height * 0.31).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color.fromARGB(255, 220, 233, 10),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: const Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    border: Border.all(
                                        color: Colors.orange, width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.stack.imgur.com/S11YG.jpg?s=64&g=1",
                                      fit: BoxFit.cover,
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: const Text(
                                      "Principal",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: Icon(FontAwesomeIcons.houseUser,
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
                                    leading:  Icon(
                                      FontAwesomeIcons.mapLocation,
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
                                      "Buscar",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.magnifyingGlass,
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
                                  ListTile(
                                    title: const Text(
                                      "Perfil",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    leading: const Icon(
                                      FontAwesomeIcons.user,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 3;
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
                    height: (size.height * 0.15).toDouble(),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color.fromARGB(255, 220, 233, 10),
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
                                    onTap: () {},
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
                                    onTap: () {},
                                  ),
                                  // ListTile(s
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
