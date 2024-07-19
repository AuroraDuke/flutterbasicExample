mixin  StudentValidatorMixin{

  String? validateFirstName(String? value){
    if(value == null || value.length<2){
      return "name has at least 2 charachter";
    }
    return null;
  }

  String? validateLastName(String? value){
    if(value == null || value.length<2){
      return "name has at least 2 charachter";
    }
    return null;
  }

  String? validateGrade(String? value){
    var grade = int.parse(value??"");
    if(0>grade || grade>100){
      return "between 0 to 100";
    }
    return null;
  }
}