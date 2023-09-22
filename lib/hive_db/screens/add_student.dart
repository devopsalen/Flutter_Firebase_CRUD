import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body:
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter name';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        hintText: 'Age',
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter age";
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton.icon(onPressed:(){
                      if(_formKey.currentState!.validate()){
                        onAddStudentButtonClicked(_nameController.text,_ageController.text);
                      }
                    },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Student'),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  onAddStudentButtonClicked(String name, String age) {
     var _name = name;
     var _age = age;
    print(_name + _age);
  }
}
