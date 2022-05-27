import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/ui/detail/place_detail_screen.dart';
import 'package:bcatravel/user/home/widgets/place_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bars),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.heart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: TravelPlace.places.length,
        itemExtent: 350,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return Hero(
            tag: place.id,
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
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: const BottomAppBar(
        shape:  CircularNotchedRectangle(),
        notchMargin: 6,
      ),
    );
  }
}
