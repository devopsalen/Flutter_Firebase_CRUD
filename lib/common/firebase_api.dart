
import 'package:firebase_crud/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPI{
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// This is thing is already called in main.dart
  // Future<void> handleBackgroudMessage(RemoteMessage message) async {
  //   print("Sample message");
  //   print('Title : ${message.notification?.title}');
  //   print('Body : ${message.notification?.body}');
  //   print('Payload : ${message.data}');
  // }

  initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    initPushNotification();
  }
}