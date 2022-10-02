// ignore_for_file: unused_label

import 'dart:async';

import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/maps/constanst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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

    // GoogleMapController googlemapController = await _controller.future;

    location.onLocationChanged.listen((newloc) {
      currentLocation = newloc;
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleapikey,
      const PointLatLng(7.042000, -73.849833),
      const PointLatLng(7.058656, -73.854495),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    // getPolyPoints();
    getCurrentLocation();

    super.initState();
  }

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  late String tittle = 'BCA Travel';
  late String about =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare, orci sed commodo consequat, dui nibh egestas lorem, eu venenatis ex enim id dolor. Cras odio felis, mattis in fermentum in, venenatis quis tortor. Nunc placerat, justo sed fermentum dignissim, magna risus viverra ipsum, vel tristique nunc diam id magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque vitae sem ut mi faucibus lacinia. Aenean sit amet lacus mattis, posuere elit a, mollis magna. Aliquam volutpat nec ipsum vel dapibus. Pellentesque ullamcorper, ipsum a aliquam semper, nunc est condimentum neque, ut sagittis purus lacus vel dui. Vivamus nec magna leo. Praesent eu bibendum lectus, in pretium eros. Donec non quam maximus, convallis orci eget, sollicitudin urna. Quisque placerat lacinia aliquam. Mauris dolor nibh, laoreet eu magna eu, pulvinar laoreet nisi. Morbi dapibus nisi convallis elit vehicula, et faucibus ligula luctus. In pharetra vulputate metus, in finibus purus.'
      'Vestibulum vitae lectus eu tortor vestibulum semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit ornare cursus. Etiam eleifend tellus vitae sem tincidunt, sit amet faucibus ante ornare. Aenean porttitor sit amet lacus in accumsan. Pellentesque luctus urna rhoncus fermentum facilisis. Nulla finibus erat at metus luctus eleifend. Integer sed efficitur nulla. Curabitur convallis nibh ut mi ornare sodales. Phasellus laoreet nibh sit amet mi rhoncus, quis sagittis urna varius. Phasellus ex sapien, blandit pretium fermentum sed, laoreet eget magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut at viverra dolor. Quisque in tincidunt sapien. Ut urna augue, maximus eu mollis et, blandit vel eros. Quisque sed sagittis dui.';
  late String url =
      'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg';
  late String address = 'Calle 100 # 12-34';
  late LatLng positionlocal = const LatLng(7.057619, -73.850724);

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.of(context).size;
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
                  markers: _markers(tittle, about, url, address),
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      points: polylineCoordinates,
                      color: primaryColor,
                      width: 6,
                    ),
                  },
                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                  compassEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  // onTap: (LatLng latLng) {
                  //   // print('You tapped at: $latLng');
                  // },
                  // ),
                ),
        ),
        // Positioned(
        //   top: media.height * 0.8,
        //   left: media.width * 0.1,
        //   // right: media.width * 0.3,
        //   child: SizedBox(
        //       height: MediaQuery.of(context).size.height * 0.09,
        //       child: FloatingActionButton(
        //           onPressed: () {
        //             variablexd = variablexd == true ? false : true;
        //             setState(() {});
        //           },
        //           child: const Icon(Icons.my_location))),
        // ),
      ],
    );
  }

// widget.place.description

  Set<Marker> _markers(tittle, about, url, address) {
    var tmp = <Marker>{};
    // tmp.add(
    //   Marker(
    //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    //     markerId: const MarkerId('Current Location'),
    //     position:
    //         LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //     infoWindow: const InfoWindow(
    //       title: 'Tu ubicación',
    //       snippet: 'Usuario',
    //     ),
    //     onTap: () {},
    //   ),
    // );
    // tmp.add(
    //   Marker(
    //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    //     markerId: const MarkerId('Current Location'),
    //     position:
    //         LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //     infoWindow: const InfoWindow(
    //       title: 'Tu ubicación',
    //       snippet: 'Usuario',
    //     ),
    //     onTap: () {},
    //   ),
    // );
    tmp.add(
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(7.057192, -73.852825),
        infoWindow: const InfoWindow(
          title: '48 Steak House',
          snippet: 'Cl. 48 #22 -115',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[1].name;
            about = TravelPlace.places[1].description;
            url =
                'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg';
            address = TravelPlace.places[1].locationDesc;
            positionlocal:
            const LatLng(7.057192, -73.852825);
          });

          buildabouttext1(tittle, about, address, url);
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(7.068301, -73.857165),
        infoWindow: const InfoWindow(
          title: 'Max Burger 60',
          snippet: 'Cl. 60A #19-40',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[0].name;
            about = TravelPlace.places[0].description;
            url =
                'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg';
            address = TravelPlace.places[0].locationDesc;
            positionlocal:
            const LatLng(7.068301, -73.857165);
          });

          buildabouttext1(tittle, about, address, url);
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(7.058656, -73.854495),
        infoWindow: const InfoWindow(
          title: 'Pal caminito',
          snippet: 'Cl. 46 #25-05',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[2].name;
            about = TravelPlace.places[2].description;
            url =
                'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg';
            address = TravelPlace.places[2].locationDesc;
            positionlocal:
            const LatLng(7.057192, -73.852825);
          });

          buildabouttext1(tittle, about, address, url);
        },
      ),
    );
    // tmp.add(
    //   Marker(
    //     markerId: const MarkerId('4'),
    //     position: const LatLng(7.057619, -73.850724),
    //     infoWindow: const InfoWindow(
    //       title: 'Que pizza!',
    //       snippet: 'Cra. 28 #46-31',
    //     ),
    //     onTap: () {
    //       setState(() {
    //         tittle = TravelPlace.places[1].name;
    //         about = TravelPlace.places[1].description;
    //         url =
    //             'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80';
    //         address = TravelPlace.places[1].locationDesc;
    //         positionlocal:
    //         const LatLng(7.057619, -73.850724);
    //       });

    //       buildabouttext1(tittle, about, address, url);
    //     },
    //   ),
    // );
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
                      about,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      address,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Image.network(url),
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

//   return Container(
//     decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(24.0)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 20.0,
//             color: Colors.grey,
//           ),
//         ]),
//     margin: const EdgeInsets.all(24.0),
//     child: buildabouttext(tittle, about, url, address),
//   );
// }
