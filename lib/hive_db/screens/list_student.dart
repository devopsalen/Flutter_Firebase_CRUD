import 'package:flutter/material.dart';

import '../db/functions/db_functions.dart';
import '../db/models/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctc, List<StudentModel> studentListNotifier, Widget? child){
        return ListView.separated(
          itemBuilder: (ctx,index){
            return ListTile(
              title: Text('Name ${studentListNotifier[index].name}'),
              subtitle: Text('Age ${studentListNotifier[index].age}'),
            );
          },
          separatorBuilder: (ctx,index){
            return  const Divider();
          },
          itemCount: studentListNotifier.length,
        );
    },
    );
  }
}
