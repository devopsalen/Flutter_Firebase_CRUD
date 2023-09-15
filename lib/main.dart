
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/common/firebase_api.dart';
import 'package:firebase_crud/home/main_page.dart';
import 'package:firebase_crud/push_notification/screens/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'blood_bank/screens/add.dart';
import 'blood_bank/screens/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAPI().initNotifications();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);
  runApp(const MyApp());
}

Future<void> handleBackgroudMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => const LandingPage(),
        '/home' : (context) => const HomePage(),
        '/add': (context) => const AddUser(),
        // '/update' : (context) => UpdateUser(name: '',) err
      },
      initialRoute: '/',
    );
  }
}

