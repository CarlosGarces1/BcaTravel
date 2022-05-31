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
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          // color: theme.primaryColor,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const <Widget>[
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
                  ListTile(
                    title: Text(
                      "Hotel",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.hotel,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Transporte",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(
                      Icons.emoji_transportation,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
                const Expanded(
                  child: Center(
                    child: Text(
                      "Lugares aqui",
                      style: TextStyle(fontSize: 24.0, color: Colors.black),
                    ),
                  ),
                )
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
