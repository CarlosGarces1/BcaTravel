import 'package:bcatravel/user/buscarScreen.dart';
import 'package:bcatravel/user/homeScreen.dart';
import 'package:bcatravel/user/maps/googlemap.dart';
import 'package:bcatravel/user/maps/main_animated_markers_map.dart';
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
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Center(
              child: GoogleMapsScreen(),
            ),
            Center(
              child: HomeScreen(),
            ),
            Center(
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
          backgroundColor:  Colors.yellow[600],
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
    );
  }
}
