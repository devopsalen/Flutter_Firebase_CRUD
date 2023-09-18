import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, /// for not to renderflow keyboard overlap
        body : Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.png'),
                )
              )
            ),
            Container(
              width: 350,
              height: 490,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      width: 100,
                      height: 35,
                      color: Colors.white,
                      child: const Text('Log in',style: TextStyle(fontSize: 30)),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 150,
                      height: 30,
                      color: Colors.white,
                      child: const Text('Email Id',style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 4,),
                    const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter your email'
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Container(
                      width: 150,
                      height: 30,
                      color: Colors.white,
                      child: const Text('Password',style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 4,),
                    TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: const Text('forgot password?',style: TextStyle(color: Colors.grey),)),
                      ],
                    ),
                    const SizedBox(height: 4,),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Background color
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4,),
                    TextButton(onPressed: (){}, child: const Text("Don't have an account?Signup",style: TextStyle(color: Colors.grey),)),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.white,
                          child: const Text('Or login with',style: TextStyle(fontSize: 15)),
                        ),
                        Image.asset('assets/images/login_ph.png',width: 50,height: 50,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Image.asset('assets/images/login_bg.png',height: 710.h,width: 414.w,)