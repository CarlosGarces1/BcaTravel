import 'dart:async';

import 'package:bcatravel/user/home/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapsScreen extends StatefulWidget {
  final LatLng frompoint = const LatLng(7.042000, -73.849833);

  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final panelController = PanelController();

  bool variablexd = true;

  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });


    location.onLocationChanged.listen((newloc) {
      currentLocation = newloc;
      setState(() {});
    });
  }


  @override
  void initState() {
    getCurrentLocation();


    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          body: currentLocation == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 13.5),
                  markers: _markers(),

                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,

                ),
        ),

      ],
    );
  }


  Set<Marker> _markers() {
    var tmp = <Marker>{};
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: const MarkerId('1'),
        position: const LatLng(7.059702561234557, -73.87545835582267),
        infoWindow: InfoWindow(
          title: TravelPlace.places[0].name,
          snippet: 'Transporte',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[0].name,
              TravelPlace.places[0].description,
              TravelPlace.places[0].locationDesc,
              TravelPlace.places[0].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: const MarkerId('2'),
        position: const LatLng(7.156142639080276, -73.85217947217521),
        infoWindow: InfoWindow(
          title: TravelPlace.places[1].name,
          snippet: 'Restaurante',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[1].name,
              TravelPlace.places[1].description,
              TravelPlace.places[1].locationDesc,
              TravelPlace.places[1].imagesUrl[0]);
        },
      ),
    );

    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        markerId: const MarkerId('3'),
        position: const LatLng(7.059134957472392, -73.85796815146954),
        infoWindow: InfoWindow(
          title: TravelPlace.places[2].name,
          snippet: 'Hotel',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[2].name,
              TravelPlace.places[2].description,
              TravelPlace.places[2].locationDesc,
              TravelPlace.places[2].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: const MarkerId('4'),
        position: const LatLng(7.061589842087122, -73.85641801140035),
        infoWindow: InfoWindow(
          title: TravelPlace.places[3].name,
          snippet: 'Restaurante',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[3].name,
              TravelPlace.places[3].description,
              TravelPlace.places[3].locationDesc,
              TravelPlace.places[3].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: const MarkerId('5'),
        position: const LatLng(7.059385174967228, -73.857516736196),
        infoWindow: InfoWindow(
          title: TravelPlace.places[4].name,
          snippet: 'Restaurante',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[4].name,
              TravelPlace.places[4].description,
              TravelPlace.places[4].locationDesc,
              TravelPlace.places[4].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        markerId: const MarkerId('6'),
        position: const LatLng(7.077792700704442, -73.85829240220482),
        infoWindow: InfoWindow(
          title: TravelPlace.places[5].name,
          snippet: 'Hotel',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[5].name,
              TravelPlace.places[5].description,
              TravelPlace.places[5].locationDesc,
              TravelPlace.places[5].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        markerId: const MarkerId('7'),
        position: const LatLng(7.050701731394901, -73.84793853832322),
        infoWindow: InfoWindow(
          title: TravelPlace.places[6].name,
          snippet: 'Hotel',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[6].name,
              TravelPlace.places[6].description,
              TravelPlace.places[6].locationDesc,
              TravelPlace.places[6].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        markerId: const MarkerId('8'),
        position: const LatLng(7.063385047461872, -73.85826574453401),
        infoWindow: InfoWindow(
          title: TravelPlace.places[8].name,
          snippet: 'Hotel',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[8].name,
              TravelPlace.places[8].description,
              TravelPlace.places[8].locationDesc,
              TravelPlace.places[8].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: const MarkerId('9'),
        position: const LatLng(7.059705274855684, -73.85755601754668),
        infoWindow: InfoWindow(
          title: TravelPlace.places[7].name,
          snippet: 'Restaurante',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[7].name,
              TravelPlace.places[7].description,
              TravelPlace.places[7].locationDesc,
              TravelPlace.places[7].imagesUrl[0]);
        },
      ),
    );
    tmp.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: const MarkerId('10'),
        position: const LatLng(7.060232504068919, -73.85871548511406),
        infoWindow: InfoWindow(
          title: TravelPlace.places[9].name,
          snippet: 'Restaurante',
        ),
        onTap: () {
          buildabouttext1(
              TravelPlace.places[9].name,
              TravelPlace.places[9].description,
              TravelPlace.places[9].locationDesc,
              TravelPlace.places[9].imagesUrl[0]);
        },
      ),
    );

    return tmp;
  }

  buildabouttext1(title, about, address, url) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoPopupSurface(
          child: Container(
            color: CupertinoColors.white,
            alignment: Alignment.center,
            width: double.infinity,
            height: 500,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      address,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      about,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Image.asset(url),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
