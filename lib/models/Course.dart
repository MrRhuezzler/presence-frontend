import 'package:codekaine/models/Student.dart';

class Course{
  String name;
  String code;
  String description;
  List<Student>? students;
  Course({required this.name,required this.code,required this.description,this.students});
}