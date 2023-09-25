import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(brightness: Brightness.dark),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter App'),
//         ),
//         body: HomeScreen(),
//       ),
//     );
//   }
// }

class PaytmSDK extends StatefulWidget {
  const PaytmSDK({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<PaytmSDK> {
  String mid = "", orderId = "", amount = "", txnToken = "";
  String result = "";
  bool isStaging = false;
  bool isApiCallInprogress = false;
  String callbackUrl = "";
  bool restrictAppInvoke = false;
  bool enableAssist = true;
  @override
  void initState() {
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: "Mid"
                ),
                onChanged: (val){
                mid = val;
              },),
              TextField(
                decoration: const InputDecoration(
                    hintText: "Order ID"
                ),
                onChanged: (val){
                orderId = val;
              },),
              TextField(
                decoration: const InputDecoration(
                    hintText: "Amount"
                ),
                onChanged: (val){
                amount = val;
              },),
              TextField(
                decoration: const InputDecoration(
                    hintText: "TXN Token"
                ),
                onChanged: (val){
                txnToken = val;
              },),
              TextField(
                decoration: const InputDecoration(
                    hintText: "callbackUrl"
                ),
                onChanged: (val){
                callbackUrl = val;
              },),

              Row(
                children: <Widget>[
                  Checkbox(
                      activeColor: Colors.cyan,
                      value: isStaging,
                      onChanged: (bool? val) {
                        setState(() {
                          isStaging = val!;
                        });
                      }),
                  Text("Staging")
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      activeColor: Colors.cyan,
                      value: restrictAppInvoke,
                      onChanged: (bool? val) {
                        setState(() {
                          restrictAppInvoke = val!;
                        });
                      }),
                  Text("Restrict AppInvoke")
                ],
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: isApiCallInprogress
                      ? null
                      : () {
                    _startTransaction();
                  },
                  child: Text('Start Transcation'),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text("Message : "),
              ),
              Container(
                child: Text(result),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startTransaction() async {
    if (txnToken.isEmpty) {
      return;
    }
    var sendMap = <String, dynamic>{
      "mid": mid,
      "orderId": orderId,
      "amount": amount,
      "txnToken": txnToken,
      "callbackUrl": callbackUrl,
      "isStaging": isStaging,
      "restrictAppInvoke": restrictAppInvoke,
      "enableAssist": enableAssist
    };
    print(sendMap);
    try {
      var response = AllInOneSdk.startTransaction(mid, orderId, amount,
          txnToken, callbackUrl, isStaging, restrictAppInvoke, enableAssist);
      response.then((value) {
        print(value);
        setState(() {
          result = value.toString();
        });
      }).catchError((onError) {
        if (onError is PlatformException) {
          setState(() {
            result = onError.message.toString() +
                " \n  " +
                onError.details.toString();
          });
        } else {
          setState(() {
            result = onError.toString();
          });
        }
      });
    } catch (err) {
      result = err.toString();
    }
  }
}