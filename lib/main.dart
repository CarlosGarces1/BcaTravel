import 'package:bcatravel/providers/push_notifications_provider.dart';
import 'package:bcatravel/screens/condiciones.dart';
import 'package:bcatravel/screens/forgot_password.dart';
import 'package:bcatravel/screens/login.dart';
import 'package:bcatravel/screens/politicas.dart';
import 'package:bcatravel/screens/register.dart';
import 'package:bcatravel/screens/splash.dart';
import 'package:bcatravel/screens/swiper.dart';
import 'package:bcatravel/user/home/ui/bottombar.dart';

import 'package:bcatravel/user/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'message_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffF3E91E),
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  await PushNotificationServices.initializeApp();
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerkey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    PushNotificationServices.messagesStream.listen((message) {
      navigatorkey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messengerkey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      scaffoldMessengerKey: messengerkey,
      // color: Colors.red,
      // theme: _buildShrineTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      title: 'BCA Travel',
      initialRoute: 'register',
      routes: {
        'splash': (BuildContext context) => const SplashScreen(),
        'swiper': (BuildContext context) => const SwiperScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'register': (BuildContext context) => const RegisterScreen(),
        'condiciones': (BuildContext context) => const CondicionesUso(),
        'politicas': (BuildContext context) => const PoliticasScreen(),
        'bottom': (BuildContext context) => const BottomBar(),
        'home': (BuildContext context) => const HomeScreen(),
        'forgot': (BuildContext context) => const ForgotPassword(),
        'message': (_) => const MessageScreen(),
      },
      theme: ThemeData(
        // primarySwatch: Colors.deepOrange,
        
        // elevatedButtonTheme: ElevatedButtonThemeData(style: ),
        brightness: Brightness.light,
        // themeMode: ThemeMode.light,
      ),
      darkTheme: ThemeData(
        // primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}


// ThemeData _buildShrineTheme() {
//   final ThemeData base = ThemeData.dark();
//   return base.copyWith(
//     colorScheme: _shrineColorScheme,
//     textTheme: _buildShrineTextTheme(base.textTheme),
//   );
// }

// TextTheme _buildShrineTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         caption: base.caption?.copyWith(
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//           letterSpacing: defaultLetterSpacing,
//         ),
//         button: base.button?.copyWith(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           letterSpacing: defaultLetterSpacing,
//         ),
//       )
//       .apply(
//         fontFamily: 'Rubik',
//         displayColor: shrineBrown900,
//         bodyColor: shrineBrown900,
//       );
// }

// const ColorScheme _shrineColorScheme = ColorScheme(
//   primary: shrinePink100,
//   secondary: shrinePink50,
//   surface: shrineSurfaceWhite,
//   background: shrineBackgroundWhite,
//   error: shrineErrorRed,
//   onPrimary: shrineBrown900,
//   onSecondary: shrineBrown900,
//   onSurface: shrineBrown900,
//   onBackground: shrineBrown900,
//   onError: shrineSurfaceWhite,
//   brightness: Brightness.light,
// );

// const Color shrinePink50 = Color(0xFFFEEAE6);
// const Color shrinePink100 = Color(0xFFFEDBD0);
// const Color shrinePink300 = Color(0xFFFBB8AC);
// const Color shrinePink400 = Color(0xFFEAA4A4);

// const Color shrineBrown900 = Color(0xFF442B2D);
// const Color shrineBrown600 = Color(0xFF7D4F52);

// const Color shrineErrorRed = Color(0xFFC5032B);

// const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
// const Color shrineBackgroundWhite = Colors.white;

// const defaultLetterSpacing = 0.03;