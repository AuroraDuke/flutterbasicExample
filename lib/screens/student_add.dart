import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidatorMixin{
  final List<Student> students;
  var student = Student.withId(0,"","",0);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  _StudentAddState(this.students);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New student add"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Form(key:formKey,child: Column(children: [
        buildFirstNameField(),
        buildLastNameField(),
        buildGradeField(),
        buildSubmitButton(),
      ],),),
      )
    );
  }


  Widget buildFirstNameField(){
  return TextFormField(
        decoration: InputDecoration(labelText: "Student name",hintText: "ilker"),
        validator : validateFirstName ,
        onSaved: (String? value){
          student.firstName = value??"";
        },

        );
}

Widget buildLastNameField(){
  return TextFormField(
        decoration: InputDecoration(labelText: "Student last name",hintText: "yayalar"),
        validator : validateLastName ,
        onSaved: (String? value){
          student.lastName = value??"";
        },

        );
}
Widget buildGradeField(){
  return TextFormField(
        decoration: InputDecoration(labelText: "grade",hintText: "50"),
        validator : validateGrade ,
        onSaved: (String? value){
          student.grade = int.parse(value??"");
        },

        );
}

  Widget buildSubmitButton() {
return ElevatedButton(onPressed: (){
if (formKey.currentState?.validate() ?? false){
   formKey.currentState?.save();
   students.add(student);
   Navigator.pop(context);
}
}, child: Text("save"));
  }



}

