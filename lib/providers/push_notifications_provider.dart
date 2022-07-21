import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServices {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // print('On background message handler: ${message.messageId}');
    // print('asduiohasduiashduas ');
    // print(message.body);
    _messageStream.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('On message handler: ${message.messageId}');
    // print(message.data);
    // print('asduiohasduiashduas ');
    _messageStream.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('on Message Open App handler: ${message.messageId}');
    // print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No data');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    //eGvOZmGVRvmPmkJHyMzv-Q:APA91bEPYr88-a6571dnHxTRkdjWGyIsmcWDgLmpSpEr0OlNgFPNxlNmTSZAxqs5J_ieSZRNLmynNn03gWHm9LmjrtL2Wk-y6pD6Xee4rafytRv22wBlm66HGKsGxLTOZkc6CBc4ZOfg
    //fpO-jLytSz6S0s9-vTH_TM:APA91bEuuDPDKgjhY-MIpfUAVM2MrwjsMxjWg6duMtc7woDvlj5HmQz67h6Q9r-rPdOYDuKh14V91Wprmd8RKzVgRcwXTALxpHKPM-pPf8_u2IiK0a5a-50JjpWsoVKADVqA3t-BiX-p
    token = await FirebaseMessaging.instance.getToken();
    // print(token);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _messageStream.close();
  }
}
