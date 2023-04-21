import 'package:flutter/material.dart';
import 'package:mvvm/model/Course.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/CourseRepoImp.dart';

class CourseModelProvider with ChangeNotifier {
  final CourseRepoImp _courseRepoImp = CourseRepoImp();
  final _courses = BehaviorSubject<List<Course>>();
  Stream<List<Course>> get courses => _courses.stream;
  CourseModelProvider() {
    init();
  }
  void init() async {
    _courseRepoImp.init();
    _courses.add(await _courseRepoImp.getAllCourse());
    notifyListeners();
  }
}
