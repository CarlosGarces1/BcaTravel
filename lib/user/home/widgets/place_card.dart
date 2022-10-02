import 'dart:io';

import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/widgets/gradient_status_tag.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vocsy_esys_flutter_share/vocsy_esys_flutter_share.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
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
        padding: const EdgeInsets.all(16),
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
            Text(
              place.name,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 55,
                // fontWeight: FontWeight.w3,
              ),
            ),
            const SizedBox(height: 10),
            GradientStatusTag(statusTag: statusTag),
            const Spacer(),
            Row(
              children: [
                LikeButton(
                  size: 40,
                  likeCount: place.likes,
                  likeCountPadding: const EdgeInsets.only(left: 0.0, right: 5),
                  circleColor: const CircleColor(
                    start: Colors.yellow,
                    end: Colors.yellowAccent,
                  ),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.yellowAccent,
                    dotSecondaryColor: Colors.red,
                  ),
                  countBuilder: (count, isLiked, text) {
                    final color =
                        isLiked ? Colors.yellowAccent : Colors.white70;
                    return Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.yellowAccent : Colors.white70,
                    );
                  },
                ),
                TextButton.icon(
                  onPressed: () async {
                    // print('share');
                    var request = await HttpClient().getUrl(Uri.parse(
                        'https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1'));
                    var response = await request.close();
                    Uint8List bytes =
                        await consolidateHttpClientResponseBytes(response);
                    await Share.file(
                        'ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
                    // Share.text(
                    //     'chupelo uwu',
                    //     'Entra a este link para ver algo maravilloso.' + '${place.name}',
                    //     'text/plain');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white70,
                    shape: const StadiumBorder(),
                  ),
                  icon: const Icon(CupertinoIcons.reply),
                  label: const Text('share'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
