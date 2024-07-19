import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/screens/student_add.dart';
import 'package:flutter_application_1/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
 Student selectedstudent = Student.withId(0,"firstName", "lastName", 0);
  List<Student> students = [
    Student.withId(1,"ilker", "yayalar", 25),
    Student.withId(2,"kadir", "kaymancı", 60),
    Student.withId(3,"sarı","mavi",45)
  ];

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba Flutter"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:NetworkImage("https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg"),
                    ),
                  title: Text(students[index].firstName + " " +students[index].lastName),
                  subtitle: Text("Grade:"+ students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                  trailing: buildStastusIcon(students[index].grade),
                  onTap:(){
                    setState(() {
                      selectedstudent = students[index];
                    });
                    print(selectedstudent.firstName);
                  }
                );
              },
              itemCount: students.length,
            ),
          ),
          Text("selected student: "+ selectedstudent.firstName),
//add
          Row(children:<Widget> [
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black
              ),
                child: Row(
                  children:<Widget> [
                    Text("add",textAlign: TextAlign.center),
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
// Update
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black
              ),
                child: Row(
                  children:<Widget> [
                    Text("update",textAlign: TextAlign.center),
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                  ],
                ),
                 onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context)=>StudentEdit(selectedstudent)))
                     .then((editedStudent) {
                      if (editedStudent != null) {
      // Update UI with editedStudent data
                  setState(() {
        selectedstudent = editedStudent;
      });
    }
});
                },
              ),
            ),
//Delete
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.black
              ),
                child: Row(
                  children: [
                    Text("sil"),
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                  ],
                ),
                onPressed: () {
                  showMesaj(context,"delete");
                  setState(() {
                  students.remove(selectedstudent);
                });
                },//onPressed
              ),
            ),

          ],)
        ],
      ),
    );
  }
}

void showMesaj(BuildContext context,String mesaj) {
  var alert = AlertDialog(
    title: Text("islem alert"),
    content: Text(mesaj),
  );

  showDialog(context: context, builder: (BuildContext context) => alert);
}

Widget buildStastusIcon(int grade) {
  if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
}