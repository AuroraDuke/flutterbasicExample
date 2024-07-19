class Student {
  static int _idCounter = 0;
  int id;
  String firstName;
  String lastName;
  int grade;
  // ignore: unused_field
  String _status;

 Student.withId(this.id, this.firstName,
                 this.lastName, this.grade): _status = "";

 Student(this.firstName, this.lastName, this.grade) : _status = "", id = _idCounter++;
 

 String get getStatus{

     String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade  >= 40) {
      message = "tekrar dene";
    } else {
      message = "kaldı";
    }
    return message;
 }
}
