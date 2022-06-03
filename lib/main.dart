import 'package:bcatravel/screens/condiciones.dart';
import 'package:bcatravel/screens/initial.dart';
import 'package:bcatravel/screens/login.dart';
import 'package:bcatravel/screens/politicas.dart';
import 'package:bcatravel/screens/register.dart';
import 'package:bcatravel/screens/splash.dart';
import 'package:bcatravel/user/home/ui/bottombar.dart';

import 'package:bcatravel/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(200, 221, 233, 10),
    // statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.red,
      // theme: _buildShrineTheme(),
      debugShowCheckedModeBanner: false,
      title: 'BCA Travel',
      initialRoute: 'bottom',
      routes: {
        'splash': (BuildContext context) => const SplashScreen(),
        'initial': (BuildContext context) => const InitialScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'register': (BuildContext context) => const RegisterScreen(),
        'condiciones': (BuildContext context) => const CondicionesUso(),
        'politicas': (BuildContext context) => const PoliticasScreen(),
        'bottom': (BuildContext context) => const BottomBar(),
        'home': (BuildContext context) => const HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.light,
        // themeMode: ThemeMode.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  secondary: shrinePink50,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
