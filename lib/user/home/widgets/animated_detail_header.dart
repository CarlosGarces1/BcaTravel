import 'dart:ui';

import 'package:bcatravel/user/home/extensions/text_theme_x.dart';
import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/widgets/gradient_status_tag.dart';
import 'package:bcatravel/user/home/widgets/place_images_page_view.dart';
import 'package:bcatravel/user/home/widgets/translate_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vocsy_esys_flutter_share/vocsy_esys_flutter_share.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final TravelPlace place;
  final double topPercent;
  final double bottomPercent;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final imagesUrl = place.imagesUrl;
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - bottomPercent),
                      bottom: 160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                      scale: lerpDouble(1, 1.3, bottomPercent)!,
                      child: PlaceImagesPageView(imagesUrl: imagesUrl),
                    ),
                  ),
                  Positioned(
                    top: topPadding,
                    left: -60 * (1 - bottomPercent),
                    child: const BackButton(
                      color: Colors.white,
                    ),
                  ),
                  // Positioned(
                  //   top: topPadding,
                  //   right: -60 * (1 - bottomPercent),
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       Icons.more_horiz,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: lerpDouble(-100, 140, topPercent)!
                        .clamp(topPadding + 10, 140),
                    left: lerpDouble(100, 20, topPercent)!.clamp(20.0, 50.0),
                    right: 20,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: bottomPercent < 1 ? 0 : 1,
                      child: Text(
                        place.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              lerpDouble(0, 40, topPercent)!.clamp(20.0, 40.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 200,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: bottomPercent < 1 ? 0 : 1,
                      child: Opacity(
                        opacity: topPercent,
                        child: GradientStatusTag(
                          statusTag: place.statusTag,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 20,
                  //   top: 250,
                  //   child: Container(
                  //     height: 40,
                  //     width: 210,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.shade400,
                  //       borderRadius: BorderRadius.circular(20),

                  //     ),
                  //     //
                  //     // width: 300,
                  //     child: Center(
                  //       child: RatingBar.builder(
                  //         initialRating: place.rating,
                  //         minRating: 1,
                  //         direction: Axis.horizontal,
                  //         allowHalfRating: true,
                  //         itemCount: 5,
                  //         // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //         itemBuilder: (context, _) => const Icon(
                  //           Icons.star,
                  //           color: Colors.amber,
                  //         ),
                  //         onRatingUpdate: (rating) {
                  //           // print(rating);
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          bottom: -140 * (1 - topPercent),
          child: TranslateAnimation(
            child: _LikesAndSharesContainer(place: place),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 10),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(
            child: _UserInfoContainer(place: place),
          ),
        )
      ],
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(place.user.urlPhoto),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.user.name,
                style: context.bodyText1,
              ),
              Text(
                'Creado en 2019',
                style: context.bodyText2.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _LikesAndSharesContainer extends StatelessWidget {
  const _LikesAndSharesContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: LikeButton(
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
                final color = isLiked ? Colors.yellowAccent : Colors.black;
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
                  color: isLiked ? Colors.yellowAccent : Colors.black,
                );
              },
            ),
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: TextButton.icon(
              onPressed: () async {
                // print('share');
                Share.text(
                    'Comparte con tus amigos ',
                    'Te comparto el nombre de un sitio que me gustó mucho.'
                        ' ${place.name}',
                    'text/plain');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
              ),
              icon: const Icon(CupertinoIcons.reply),
              label: const Text('share', style: TextStyle(fontSize: 17)),
            ),
          ),

          // const Spacer(),
        ],
      ),
    );
  }
}
