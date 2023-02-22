import 'package:bcatravel/user/home/models/place.dart';
import 'package:flutter/material.dart';

class PlaceCardCate extends StatelessWidget {
  const PlaceCardCate({
    Key? key,
    required this.place,
    required this.onPressed,
  }) : super(key: key);

  final Categories1 place;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(place.imagesUrl.first),
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
            Text(
              place.name,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 55,
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
