import 'package:bcatravel/user/buscar/twopanels.dart';
import 'package:flutter/material.dart';

class BuscarScreen extends StatefulWidget {
  const BuscarScreen({Key? key}) : super(key: key);

  @override
  _BuscarScreenState createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 5), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busca por lugares"),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: controller.view,
          ),
        ),
      ),
      body: TwoPanels(
        controller: controller,
      ),
    );
  }
}
