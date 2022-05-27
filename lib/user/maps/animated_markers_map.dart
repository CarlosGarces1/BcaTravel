// ignore_for_file: constant_identifier_names

import 'package:bcatravel/user/maps/map_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiZmVsaXBlZ2FyY2VzMSIsImEiOiJjbDNsMmNkbTEwcTl0M2NscHdhanhzeGhnIn0.xlpyzSqhwDHjPa04VBC7pw';
const MAPBOX_STYLE = 'mapbox/light-v10';
const MARKER_COLOR = Color(0xFF3DC5A7);
const MARKER_SIZE_EXPANDED = 30.0;
const MARKER_SIZE_SHRINKED = 20.0;

final _mylocation = LatLng(7.041981, -73.849841);

class AnimatedMarkersMap extends StatefulWidget {
  const AnimatedMarkersMap({Key? key}) : super(key: key);

  @override
  State<AnimatedMarkersMap> createState() => _AnimatedMarkersMapState();
}

class _AnimatedMarkersMapState extends State<AnimatedMarkersMap>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  int _selectedIndex = 0;
  late final AnimationController _animationController;

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: MARKER_SIZE_EXPANDED,
          width: MARKER_SIZE_EXPANDED,
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                setState(() {
                  _pageController.animateToPage(i,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.elasticOut);
                });
                // print('Selected: ${mapItem.tittle}');
              },
              child: _LocationMarker(
                selected: _selectedIndex == i,
              ),
            );
          },
        ),
      );
    }
    return _markerList;
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 20,
              zoom: 13,
              center: _mylocation,
            ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': MAPBOX_STYLE,
                },
              ),
              MarkerLayerOptions(
                markers: _markers,
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                      height: 60,
                      width: 60,
                      point: _mylocation,
                      builder: (_) {
                        return _MyLocationMarker(_animationController);
                      })
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mapMarkers.length,
              itemBuilder: (context, index) {
                final item = mapMarkers[index];
                return _MapItemDetails(
                  mapMarker: item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {
  const _LocationMarker({Key? key, this.selected = false}) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
        child: AnimatedContainer(
      height: size,
      width: size,
      duration: const Duration(milliseconds: 100),
      // child: Image.asset('assets/marker3.png'),
      child: Icon(
        Icons.location_on,
        color: selected ? Colors.yellow.shade600 : Colors.black,
        size: size,
      ),
    ));
  }
}

class _MyLocationMarker extends AnimatedWidget {
  const _MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    const size=60.0;
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: size*value,
              width: size*value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow.shade300.withOpacity(0.6),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({
    Key? key,
    required this.mapMarker,
  }) : super(key: key);

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    const _styletittle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    final _styleaddres = TextStyle(color: Colors.grey[800], fontSize: 14);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(mapMarker.image),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mapMarker.tittle,
                          style: _styletittle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          mapMarker.address,
                          style: _styleaddres,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: MARKER_COLOR,
              elevation: 6,
              child: const Text(
                'Llamar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
