
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/common/firebase_api.dart';
import 'package:firebase_crud/hive_db/db/models/data_model.dart';
import 'package:firebase_crud/home/main_page.dart';
import 'package:firebase_crud/product_list/presentation/product_bloc/product_event.dart';
import 'package:firebase_crud/push_notification/screens/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'blood_bank/screens/add.dart';
import 'blood_bank/screens/home.dart';
import 'product_list/presentation/product_bloc/product_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


final navigatorKey = GlobalKey<NavigatorState>();

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAPI().initNotifications();
  await FirebaseMessaging.instance.setAutoInitEnabled(true); ///intialize tapping on notification
  FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);

  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
  {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MyApp());
}

Future<void> handleBackgroudMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
  print("I am Alen");

}

void handleMessage(RemoteMessage? message)
{
  if(message == null) return;
  navigatorKey.currentState?.pushNamed(PushHomePage.route,
  arguments: message);
}

Future initPushNotification() async {
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  //FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);
}



class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String lang = "ml";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      minTextAdapt: true,
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProductBloc()..add(FetchProductEvent()),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            navigatorKey: navigatorKey,

            routes: {
              // '/' : (context) => const Dashboard(),
              '/' : (context) => const LandingPage(),   //change this back
              '/home' : (context) => const HomePage(),
              '/add': (context) => const AddUser(),
              PushHomePage.route: (context) => PushHomePage()

            },
            initialRoute: '/',

            locale: Locale(lang),
            // locale: Locale('ml'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ml')
            ],
          ),
        );
      }
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:Column(
        children: [
          TextButton(
            child: Text("Change language"),
            onPressed: () {

            },
          ),
          // Text("language : $lang");

        ],
      ),
    );
  }
}


