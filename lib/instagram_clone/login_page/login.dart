import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/login_bg.png"),
                    fit: BoxFit.cover),
              ),
              child: const Text(
                'Image in fullscreen',
                style: TextStyle(fontSize: 34, color: Colors.red),
              ),
            )

          ],
        ),
      ),
    );
  }
}




// Container(
// constraints: BoxConstraints.expand(),
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/cat2.jpg"),
// fit: BoxFit.cover),
// ),
// child: const Text(
// 'Image in fullscreen',
// style: TextStyle(fontSize: 34, color: Colors.red),
// ),
// )


// Container(
//   constraints: BoxConstraints.expand(),
//     decoration: const BoxDecoration(
//       image: DecorationImage(image: AssetImage('assets/images/login_bg.png'),
//       fit: BoxFit.cover),
//     )
//     // child: Image.asset('assets/images/login_bg.png',height: 710.h,width: 414.w,)
// ),
// 736
