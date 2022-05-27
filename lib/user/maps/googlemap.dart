import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  final LatLng frompoint = const LatLng(7.042000, -73.849833);

  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: widget.frompoint, zoom: 15),
      markers: _markers(),
      myLocationEnabled: true,
    );
  }

  Set<Marker> _markers() {
    var tmp = <Marker>{};
    tmp.add(
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(7.042000, -73.849833),
        infoWindow: InfoWindow(
          title: 'Tu ubicación',
          snippet: 'Calle 30B #32-84',
        ),
      ),
    );
    tmp.add(
      const Marker(
        markerId: MarkerId('2'),
        position: LatLng(7.057192, -73.852825),
        infoWindow: InfoWindow(
          title: '48 Steak House',
          snippet: 'Cl. 48 #22 -115',
        ),
      ),
    );
    tmp.add(
      const Marker(
        markerId: MarkerId('3'),
        position: LatLng(7.068301, -73.857165),
        infoWindow: InfoWindow(
          title: 'Max Burger 60',
          snippet: 'Cl. 60A #19-40',
        ),
      ),
    );
    tmp.add(
      const Marker(
        markerId: MarkerId('4'),
        position: LatLng(7.058656, -73.854495),
        infoWindow: InfoWindow(
          title: 'Pal caminito',
          snippet: 'Cl. 46 #25-05',
        ),
      ),
    );
    tmp.add(
      const Marker(
        markerId: MarkerId('5'),
        position: LatLng(7.057619, -73.850724),
        infoWindow: InfoWindow(
          title: 'Que pizza!',
          snippet: 'Cra. 28 ##46-31',
        ),
      ),
    );
    return tmp;
  }
}
