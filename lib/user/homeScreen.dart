// ignore_for_file: file_names

import 'package:bcatravel/user/home/theme/theme.dart';
import 'package:bcatravel/user/home/ui/feed/feed_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TravelTheme.theme,
      home: const FeedScreen(),
    );
  }
}
