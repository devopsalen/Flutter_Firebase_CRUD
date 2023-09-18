import 'package:firebase_crud/instagram_clone/insta_homepage.dart';
import 'package:firebase_crud/login_page/login.dart';
import 'package:firebase_crud/product_list/product_homeScreen.dart';
import 'package:firebase_crud/push_notification/screens/home.dart';
import 'package:flutter/material.dart';

import '../blood_bank/screens/home.dart';

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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PushHomePage()));
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
              SizedBox(height: 30,),
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
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
