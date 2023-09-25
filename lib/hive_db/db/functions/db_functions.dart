import 'package:flutter/material.dart';

import '../models/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

void addStudent(StudentModel value){
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  print(value.toString());
}