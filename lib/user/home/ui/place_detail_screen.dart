import 'package:bcatravel/user/home/models/place.dart';
import 'package:bcatravel/user/home/widgets/animated_detail_header.dart';
import 'package:bcatravel/user/home/widgets/translate_animation.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
    required this.screenHeight,
  }) : super(key: key);

  final TravelPlace place;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late ScrollController _controller;
  late ValueNotifier<double> bottomPercentNotifier;
  double velocity = 0;

  void _scrollListener() {
    final percent =
        _controller.position.pixels / MediaQuery.of(context).size.height;
    bottomPercentNotifier.value = (percent / .3).clamp(0.0, 1.0);
  }

  void _restoreScrollPosition() {
    final percent = _controller.position.pixels / widget.screenHeight;
    if (!_controller.position.isScrollingNotifier.value) {
      if (percent < .3 && percent > .1) {
        _controller.animateTo(
          widget.screenHeight * .3,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
      }
      if (percent < .1 && percent > 0) {
        _controller.animateTo(
          0,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
      }
      if (percent < .6 && percent > .3) {
        _controller.animateTo(
          widget.screenHeight * .3,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
      }
    }
  }

  @override
  void initState() {
    _controller =
        ScrollController(initialScrollOffset: widget.screenHeight * .3);
    _controller.addListener(_scrollListener);
    bottomPercentNotifier = ValueNotifier(1);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final upperLimit = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragEnd: (_) => _restoreScrollPosition(),
            onVerticalDragStart: (details) =>
                velocity = details.localPosition.dy * .025,
            onVerticalDragUpdate: (details) {
              final posY = _controller.position.pixels -
                  ((details.localPosition.dy * .025) - velocity);
              final posYFixed = posY.clamp(0.0, upperLimit);
              _controller.jumpTo(posYFixed);
            },
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: BuilderPersistentDelegate(
                    maxExtent: MediaQuery.of(context).size.height,
                    minExtent: 240,
                    builder: (percent) {
                      final bottomPercent = (percent / .2).clamp(0.0, 1.0);
                      return AnimatedDetailHeader(
                        topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
                        bottomPercent: bottomPercent,
                        place: widget.place,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: TranslateAnimation(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(widget.place.description),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
