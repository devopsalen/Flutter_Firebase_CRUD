import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushHomePage extends StatefulWidget {
  const PushHomePage({Key? key}) : super(key: key);
  static const route = '/notification-screen';

  @override
  State<PushHomePage> createState() => _PushHomePageState();
}

class _PushHomePageState extends State<PushHomePage> {

  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification'),
      ),
      body: const Column(
        children: [
          Text('Firebase FCM Token'),
          Text('Firebase FCM Token'),
          // Text('${message.notification!.title ?? "Empty"}'),
          // Text('${message.notification!.body ?? "Empty"} '),
        ],
      ),
    );
  }
}


