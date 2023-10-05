
import 'package:firebase_crud/google_map/gmap_home.dart';
import 'package:firebase_crud/hive_db/screen_home.dart';
import 'package:firebase_crud/instagram_clone/insta_homepage.dart';
import 'package:firebase_crud/language_translation/language_home.dart';
import 'package:firebase_crud/login_page/login.dart';
import 'package:firebase_crud/main.dart';
import 'package:firebase_crud/paytmSDK/paytm.dart';
import 'package:firebase_crud/product_list/product_homeScreen.dart';
import 'package:firebase_crud/push_notification/screens/home.dart';
import 'package:firebase_crud/shared_pref/shared_pref.dart';
import 'package:firebase_crud/url_launcher/url_launcher.dart';
import 'package:firebase_crud/video_player/VideoApp.dart';
import 'package:flutter/material.dart';

import '../blood_bank/screens/home.dart';
import '../hive_db/screens/add_student.dart';
import '../razorpay/razorpay.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("My Projects",style: TextStyle(fontSize: 20),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// used for firebase
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Blood Bank"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PushHomePage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 120,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Push Notification"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InstagramHomepage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Instagram"))),
                      )),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,

                            child: const Center(child: Text("Login page"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductHomeScreen()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,

                            child: const Center(child: Text("Product list"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VideoApp()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,

                            child: const Center(child: Text("Video Player"))),
                      )),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UrlLauncher()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Url Launcher"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SharedPref()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 120,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Shared Preference"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage(title: 'RazorPay',)));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Razorpay"))),
                      )),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaytmSDK()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Paytm"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenHive()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Hive DB"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GmapHomePage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Google map"))),
                      )),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LanguageHomePage()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Language trans"))),
                      )),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));
                      },
                      child:  Center(
                        child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.tealAccent,
                            child: const Center(child: Text("Choose lang"))),
                      )),

                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
