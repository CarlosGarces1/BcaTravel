import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.tittle,
    required this.address,
    required this.location,
  });
  final String image;
  final String tittle;
  final String address;
  final LatLng location;
}

final _locations = [
  LatLng(7.057619, -73.850724),
  LatLng(7.058656, -73.854495),
  LatLng(7.068301, -73.857165),
  LatLng(7.057192, -73.852825),
  LatLng(7.059439, -73.854269),
  LatLng(7.060678, -73.853298),
  LatLng(7.062325, -73.861984),
];

// const _path = 'assets/animated_markers_map/';

final mapMarkers = [
  MapMarker(
    image: 'assets/animated_markers_map/1.png',
    tittle: 'Que pizza',
    address: 'Cra. 28 ##46-31',
    location: _locations[0],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/2.jpg',
    tittle: '48 Steak House',
    address: 'Cl. 48 #22 -115',
    location: _locations[1],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/3.jpg',
    tittle: 'Max Burger 60',
    address: 'Cl. 60A #19-40',
    location: _locations[2],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/4.jpg',
    tittle: 'Pal caminito',
    address: 'Cl. 46 #25-05',
    location: _locations[3],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/5.jpg',
    tittle: 'Orale',
    address: 'Cl. 49 #24-06',
    location: _locations[4],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/6.jpeg',
    tittle: 'Bufalo Sentao',
    address: 'Cl. 50 #25a1, ',
    location: _locations[5],
  ),
  MapMarker(
    image: 'assets/animated_markers_map/7.jpg',
    tittle: 'Sabor Marino',
    address: 'Cl. 52 #20-21',
    location: _locations[6],
  ),
];
