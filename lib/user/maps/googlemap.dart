import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/maps/panelWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapsScreen extends StatefulWidget {
  final LatLng frompoint = const LatLng(7.042000, -73.849833);

  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final panelController = PanelController();

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SlidingUpPanel(
      // minHeight: size.height * 0.1,
      // maxHeight: size.height * 0.5,
      borderRadius: radius,
      backdropEnabled: true,
      parallaxEnabled: true,
      // parallaxOffset: 0.5,
      renderPanelSheet: false,
      panel: _floatingPanel(tittle, about, url, address),
      collapsed: _floatingCollapsed(),
      panelBuilder: (controller) => PanelWidget(
        controller: controller,
        panelController: panelController,
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: widget.frompoint, zoom: 15),
        markers: _markers(),
        // compassEnabled : false,
        // myLocationEnabled: true,
        // myLocationButtonEnabled: true,
        // onTap: (LatLng latLng) {
        //   // print('You tapped at: $latLng');
        // },
      ),
    );
  }

  // widget.place.description

  Set<Marker> _markers() {
    var tmp = <Marker>{};
    tmp.add(
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(7.042000, -73.849833),
        infoWindow: const InfoWindow(
          title: 'Tu ubicación',
          snippet: 'Calle 30B #32-84',
        ),
        onTap: () {
          setState(() {
            tittle = 'Tu ubicación';
            about = 'hola';
            url =
                'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg';
            address = 'Calle 30B #32-84';
          });
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(7.057192, -73.852825),
        infoWindow: const InfoWindow(
          title: '48 Steak House',
          snippet: 'Cl. 48 #22 -115',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[2].name;
            about = TravelPlace.places[2].description;
            url =
                'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg';
            address = TravelPlace.places[2].locationDesc;
          });
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('3'),
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
            ;
          });
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(7.058656, -73.854495),
        infoWindow: const InfoWindow(
          title: 'Pal caminito',
          snippet: 'Cl. 46 #25-05',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[3].name;
            about = TravelPlace.places[3].description;
            url =
                'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg';
            address = TravelPlace.places[3].locationDesc;
          });
        },
      ),
    );
    tmp.add(
      Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(7.057619, -73.850724),
        infoWindow: const InfoWindow(
          title: 'Que pizza!',
          snippet: 'Cra. 28 #46-31',
        ),
        onTap: () {
          setState(() {
            tittle = TravelPlace.places[1].name;
            about = TravelPlace.places[1].description;
            url =
                'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80';
            address = TravelPlace.places[1].locationDesc;
          });
        },
      ),
    );
    return tmp;
  }
}

Widget _floatingCollapsed() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    child: const Center(
      child: Text(
        "Desliza arriba para ver el lugar",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget _floatingPanel(tittle, about, url, address) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]),
    margin: const EdgeInsets.all(24.0),
    child: buildabouttext(tittle, about, url, address),
  );
}

buildabouttext(title, about, url, address) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Center(child: Text(title, style: TextStyle(color: Colors.black))),
          const SizedBox(height: 20),
          Text(about, style: TextStyle(color: Colors.black)),
          const SizedBox(height: 20),
          Text(address, style: TextStyle(color: Colors.black)),
          const SizedBox(height: 20),
          Image.network(url),
          const SizedBox(height: 20),
          Image.network(url),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
