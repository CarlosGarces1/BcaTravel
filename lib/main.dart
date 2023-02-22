import 'package:bcatravel/screens/condiciones.dart';
import 'package:bcatravel/screens/developers.dart';
import 'package:bcatravel/screens/forgot_password.dart';
import 'package:bcatravel/screens/login.dart';
import 'package:bcatravel/screens/politicas.dart';
import 'package:bcatravel/screens/register.dart';
import 'package:bcatravel/screens/swiper.dart';
import 'package:bcatravel/user/home/ui/bottombar.dart';
import 'package:bcatravel/user/home/ui/feed_screen_hote.dart';
import 'package:bcatravel/user/home/ui/feed_screen_resta.dart';
import 'package:bcatravel/user/home/ui/feed_screen_trans.dart';
import 'package:bcatravel/user/profile/about.dart';
import 'package:bcatravel/user/profile/editprofile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffF3E91E),
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(microseconds: 1));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SwiperScreen(),
      title: 'BCA Travel',
      routes: {
        'swiper': (BuildContext context) => const SwiperScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'register': (BuildContext context) => const RegisterScreen(),
        'condiciones': (BuildContext context) => const CondicionesUso(),
        'politicas': (BuildContext context) => const PoliticasScreen(),
        'bottom': (BuildContext context) => const BottomBar(),
        'forgot': (BuildContext context) => const ForgotPassword(),
        'developer': (_) => const Developers(),
        'about': (_) => const AboutPage(),
        'edit': (_) => const EditProfilePage(
            'felipegarces1608@gmail.com',
            'Carlos Felipe',
            'Garcés Yepes',
            'https://lh3.googleusercontent.com/a-/AFdZucpaioQw3FVX3MKuL26ARCnxTp1LNkbSRPmsNhKjDAo=s288-p-no'),
        'transporte': (_) => const FeedScreentrans(),
        'hotel': (_) => const FeedScreenHote(),
        'resta': (_) => const FeedScreenResta(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
