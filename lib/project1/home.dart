import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'update.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blood Donation App"),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, '/add');
            },
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: StreamBuilder(
            stream: donor.orderBy('name').snapshots(),
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    final DocumentSnapshot donorsnap = snapshot.data.docs[index];
                    // return Text(donorsnap['name']);
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 15)
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 30,
                                  child: Text(donorsnap['group']),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(donorsnap['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(donorsnap['phone'].toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){

                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateUser(
                                      name: donorsnap['name'],phone:donorsnap['phone'].toString(),group:donorsnap['group'],id:donorsnap.id)));


                                }, icon: const Icon(Icons.edit),iconSize: 30,color: Colors.blue,),
                                IconButton(onPressed: (){
                                  donor.doc(donorsnap.id).delete();

                                }, icon: const Icon(Icons.delete),iconSize: 30,color: Colors.red,),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },);

              }
              return Container();
            }, ),
      ),
    );
  }
}
