
import 'package:firebase_crud/hive_db/db/functions/db_functions.dart';
import 'package:firebase_crud/hive_db/screens/add_student.dart';
import 'package:firebase_crud/hive_db/screens/list_student.dart';
import 'package:flutter/material.dart';

class ScreenHive extends StatefulWidget {
  const ScreenHive({Key? key}) : super(key: key);

  @override
  State<ScreenHive> createState() => _ScreenHiveState();
}

class _ScreenHiveState extends State<ScreenHive> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child:
      Column(
        children: [
          Expanded(child: AddStudent()),
          const Expanded(child: ListStudent()),

        ],
      )),

    );
  }
}
