import 'package:bcatravel/user/maps/animated_markers_map.dart';
import 'package:flutter/material.dart';

class MainAnimatedMarkersMap extends StatelessWidget {
  const MainAnimatedMarkersMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const AnimatedMarkersMap(),
    );
  }
}
