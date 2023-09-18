import 'package:flutter/material.dart';

class InstagramHomepage extends StatefulWidget {
  const InstagramHomepage({Key? key}) : super(key: key);

  @override
  State<InstagramHomepage> createState() => _InstagramHomepageState();
}

class _InstagramHomepageState extends State<InstagramHomepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(
          children: [
            Text("Instagram"),
          ],
        ),
      ),
    );
  }
}
