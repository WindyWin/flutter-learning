import 'package:flutter/material.dart';
import 'package:mvvm/model/Course.dart';
import 'package:mvvm/service/course_service.dart';

class CourseModelProvider with ChangeNotifier {
  // final CourseRepoImp _courseRepoImp = CourseRepoImp();
  final CourseService _courseService = CourseService();
  bool isLoading = false;
  List<Course> _courses = [];
  List<Course> get courses => _courses;

  Future<void> getAllCourse() async {
    isLoading = true;
    notifyListeners();

    final courses = await _courseService.getAll();

    _courses = courses;
    isLoading = false;
    notifyListeners();
  }
}
