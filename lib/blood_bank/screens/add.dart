

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroups = ['A','A+','B+','O-ve'];
  String ? selectedGroup;
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

  void addDonor(){
    final data = {
      'name' : donorName.text,
      'phone' : donorPhone.text,
      'group' : selectedGroup
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Donors'),
        backgroundColor: Colors.red,

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
            TextField(
              controller: donorName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Donor name')
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: donorPhone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Phone number')
              ),
            ),
            const SizedBox(height: 10,),
            DropdownButtonFormField(hint:
            const Text('Select blood group'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                ),
                items: bloodGroups
                    .map((e) => DropdownMenuItem(
              child: Text(e),

              value: e,
            ))
                    .toList(),
                onChanged: (val){
                  selectedGroup = val as String?;
                }),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              addDonor();
              Navigator.pop(context);
            },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
