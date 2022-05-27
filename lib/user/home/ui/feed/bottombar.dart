import 'package:bcatravel/user/buscarScreen.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/theme/theme.dart';
import 'package:bcatravel/user/home/ui/detail/place_detail_screen.dart';
import 'package:bcatravel/user/home/widgets/place_card.dart';

import 'package:bcatravel/user/homeScreen.dart';
import 'package:bcatravel/user/maps/googlemap.dart';
import 'package:bcatravel/user/maps/main_animated_markers_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
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
    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      theme: TravelTheme.theme,
      home: Scaffold(
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[600],
            title: const Text('BCA Travel'),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bars),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.heart),
              ),
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Center(
                child: GoogleMapsScreen(),
              ),
              Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
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
                                      screenHeight:
                                          MediaQuery.of(context).size.height,
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
                extendBody: true,
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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[400],
            backgroundColor: Colors.yellow[600],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Mapa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Principal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
