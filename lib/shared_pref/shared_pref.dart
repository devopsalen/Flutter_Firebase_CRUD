import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  TextEditingController newName = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String name="";

  @override
  void initState() {
    // TODO: implement initState
    readSharedPreference();
    super.initState();
  }
  @override
  setSharedpreference() async {
    // TODO: implement initState
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('name',newName.text);
      readSharedPreference();
  }

  readSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {

      name = pref.getString('name')!;
      // print("Name : $name");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared preference"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter new name"
                  ),
                  controller: newName,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter name';
                    }
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                setSharedpreference();
              }
            }, child: const Text("Submit")),
            const SizedBox(height: 30,),
            Text("Name in Shared preference : $name")

          ],
        ),
      ),

    );
  }
}
