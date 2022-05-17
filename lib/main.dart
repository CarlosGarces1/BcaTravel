import 'package:bcatravel/screens/condiciones.dart';
import 'package:bcatravel/screens/initial.dart';
import 'package:bcatravel/screens/login.dart';
import 'package:bcatravel/screens/politicas.dart';
import 'package:bcatravel/screens/register.dart';
import 'package:bcatravel/screens/splash.dart';
import 'package:bcatravel/user/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BCA Travel',
      initialRoute: 'splash',
      routes: {
        'splash': (BuildContext context) => const SplashScreen(),
        'initial': (BuildContext context) => const InitialScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'register': (BuildContext context) => const RegisterScreen(),
        'condiciones': (BuildContext context) => const CondicionesUso(),
        'politicas': (BuildContext context) => const PoliticasScreen(),
        'home': (BuildContext context) => const HomeScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
