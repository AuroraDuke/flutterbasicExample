import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  final Student selectedStudent;

  StudentEdit(this.selectedStudent);
 
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidatorMixin{
  final Student selectedStudent;


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _StudentEditState(this.selectedStudent);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student edit"),
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
    initialValue: selectedStudent.firstName,
        decoration: InputDecoration(labelText: "Student name",hintText: "ilker"),
        validator : validateFirstName ,
        onSaved: (String? value){
          selectedStudent.firstName = value??"";
        },

        );
}

Widget buildLastNameField(){
  return TextFormField(
    initialValue: selectedStudent.lastName,
        decoration: InputDecoration(labelText: "Student last name",hintText: "yayalar"),
        validator : validateLastName ,
        onSaved: (String? value){
          selectedStudent.lastName = value??"";
        },

        );
}
Widget buildGradeField(){
  return TextFormField(
    initialValue:selectedStudent.grade.toString(),
        decoration: InputDecoration(labelText: "grade",hintText: "50"),
        validator : validateGrade ,
        onSaved: (String? value){
          selectedStudent.grade = int.parse(value??"");
        },

        );
}

  Widget buildSubmitButton() {
return ElevatedButton(onPressed: (){
if (formKey.currentState?.validate() ?? false){
   formKey.currentState?.save();
   Navigator.pop(context,selectedStudent);
}
}, child: Text("save"));
  }



}

