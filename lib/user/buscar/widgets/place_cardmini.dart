import 'package:bcatravel/user/home/extensions/text_theme_x.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/widgets/gradient_status_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceCardMini extends StatelessWidget {
  const PlaceCardMini({
    Key? key,
    required this.place,
    required this.onPressed,
  }) : super(key: key);

  final TravelPlace place;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final statusTag = place.statusTag;
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(place.imagesUrl.first),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Text(
                place.name,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
