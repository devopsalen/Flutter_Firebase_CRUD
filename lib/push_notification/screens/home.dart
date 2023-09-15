import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushHomePage extends StatefulWidget {
  const PushHomePage({Key? key}) : super(key: key);

  @override
  State<PushHomePage> createState() => _PushHomePageState();
}

class _PushHomePageState extends State<PushHomePage> {

  // Future<void> handleBackgroudMessage(RemoteMessage message) async {
  //   print('Title : ${message.notification?.title}');
  //   print('Body : ${message.notification?.body}');
  //   print('Payload : ${message.data}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification'),
      ),
      body: Column(
        children: [
          Text('Firebase FCM Token'),
          Text('Firebase FCM Token'),
        ],
      ),
    );
  }
}


