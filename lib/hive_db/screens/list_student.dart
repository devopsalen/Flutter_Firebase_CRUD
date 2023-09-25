import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
              title: Text('Name ${studentListNotifier[index].name} ID ${studentListNotifier[index].id}'),
              subtitle: Text('Age ${studentListNotifier[index].age}'),

              trailing: IconButton(onPressed: (){
                if(studentListNotifier[index].id != null){
                  print(studentListNotifier[index].id);
                  deleteStudents(studentListNotifier[index].id!);
                }
                else
                  {
                    print('Student id is null');
                  }
              }, icon: Icon(Icons.delete,color: Colors.red,)),
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
