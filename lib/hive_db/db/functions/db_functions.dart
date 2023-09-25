import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel student) async {
  try {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    student.id = DateTime.now().hashCode;
    await studentDB.put(student.id, student);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  }
  catch (e) {
    print('Error adding student: $e');
  }
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future <void> deleteStudents(int id) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();


}