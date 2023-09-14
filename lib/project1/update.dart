

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  final String name,phone,group,id;
  const UpdateUser({Key? key, required this.name, required this.phone, required this.group, required this.id}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final bloodGroups = ['A', 'A+', 'B+', 'O-ve'];
  String ? selectedGroup, id;
  final CollectionReference donor = FirebaseFirestore.instance.collection(
      'donor');

  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

  @override
  void initState() {
    donorName.text = widget.name;
    donorPhone.text = widget.phone;
    selectedGroup = widget.group;
    id = widget.id;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Donors'),
        backgroundColor: Colors.red,

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
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
            Text(selectedGroup.toString()),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: bloodGroups
                    .map((e) =>
                    DropdownMenuItem(
                      child: Text(e),

                      value: e,
                    ))
                    .toList(),
                onChanged: (val) {
                  selectedGroup = val as String?;
                }),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              updateDonor();
              Navigator.pop(context);
            },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                child: const Text('Update', style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }

  void updateDonor() {
    // print(donorName.text);
    // print(donorPhone.text);
    // print(selectedGroup);
    // print(id);

    final data = {
      'name' : donorName.text,
      'phone' : donorPhone.text,
      'group' : selectedGroup
    };
    donor.doc(id).update(data).then((value) => Navigator.pop(context));
  }
}
