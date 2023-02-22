import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/ui/place_detail_screen.dart';
import 'package:bcatravel/user/home/widgets/place_card.dart';
import 'package:flutter/material.dart';

class FeedScreentrans extends StatelessWidget {
  const FeedScreentrans({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/fondoPrincipal.png",
                  fit: BoxFit.cover,
                  width: media.width,
                  height: media.height,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, bottom: 20, left: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        SizedBox(
                          width: media.width * 0.06,
                        ),
                        const Text(
                          'Transporte',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  widgetList(0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView widgetList(numero) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemExtent: 350,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      itemBuilder: (context, index) {
        final place = TravelPlace.places[numero];
        return Hero(
          tag: numero,
          child: Material(
            child: PlaceCard(
              place: place,
              onPressed: () async {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, animation, __) => FadeTransition(
                      opacity: animation,
                      child: PlaceDetailScreen(
                        place: place,
                        screenHeight: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
