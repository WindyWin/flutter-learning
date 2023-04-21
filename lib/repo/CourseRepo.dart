import 'package:mvvm/model/Course.dart';

abstract class CourseRepo {
  Future<List<Course>> getAllCourse();
}
