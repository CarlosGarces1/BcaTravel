import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/ui/place_detail_screen.dart';
import 'package:bcatravel/user/buscar/widgets/place_cardmini.dart';
import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  const TwoPanels({Key? key, required this.controller}) : super(key: key);

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  // ignore: constant_identifier_names
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height * 0.4 - header_height;
    const frontPanelHeight = -header_height;

    return RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(
            CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    // final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Positioned(
          top: 95,
          left: 1,
          child: Container(
            height: 50,
            width: 400,
            color: Colors.grey.shade400,
            child: const Text(
                '                                                                                                   '
                '----------------PROXIMAMENTE---------------------',
                textAlign: TextAlign.center),
          ),
        ),
        Positioned(
          top: 160,
          left: 1,
          child: Container(
            height: 50,
            width: 400,
            color: Colors.grey.shade400,
            child: const Text(
                '                                                                                                      '
                '    -------------------PROXIMAMENTE---------------------',
                textAlign: TextAlign.center),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  title: Text(
                    "Restaurante",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.restaurant,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  title: Text(
                    "Hotel",
                    style: TextStyle(color: Color.fromARGB(50, 126, 126, 126)),
                  ),
                  leading: Icon(
                    Icons.hotel,
                    color: Color.fromARGB(50, 126, 126, 126),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  // enabled: false,
                  title: Text(
                    "Transporte",
                    style: TextStyle(color: Color.fromARGB(50, 126, 126, 126)),
                  ),
                  leading: Icon(
                    Icons.emoji_transportation,
                    color: Color.fromARGB(50, 126, 126, 126),
                  ),
                ),
              ],
            ),
          ],
        ),
        PositionedTransition(
          rect: getPanelAnimation(constraints),
          child: Material(
            elevation: 12.0,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: header_height,
                  child: GestureDetector(
                    onVerticalDragDown: (details) {
                      widget.controller.fling(velocity: -1.0);
                    },
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 8,
                          width: 100,
                          color: Colors.white,
                        ),
                        Container(
                          height: 8,
                          width: 100,
                          color: Colors.grey.shade300,
                        ),
                        Text(
                          "Desliza hacia abajo para abrir",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: TravelPlace.places.length,
                      itemExtent: 100,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                          20, 0, 20, kToolbarHeight + 20),
                      itemBuilder: (context, index) {
                        final place = TravelPlace.places[index];
                        return Hero(
                          tag: place.id,
                          child: Material(
                            child: PlaceCardMini(
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
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}
