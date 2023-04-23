import 'package:flutter/material.dart';
import 'package:mvvm/model/Course.dart';
import 'package:rxdart/rxdart.dart';

import '../data/CourseRepoImp.dart';

class CourseModelProvider with ChangeNotifier {
  final CourseRepoImp _courseRepoImp = CourseRepoImp();
  final List<Course> _courses = [];
  List<Course> get course => _courses;

  Future init() async {
    _courseRepoImp.init();
    _courses.addAll(await _courseRepoImp.getAllCourse());
    notifyListeners();
  }
}
