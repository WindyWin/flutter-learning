import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/Course.dart';

class CourseService {
  Future<List<Course>> getAll() async {
    return Future.delayed(const Duration(seconds: 1), () {
      debugPrint("Get all course");
      List<Course> courses = List.generate(
          20,
          (index) => Course(
              index,
              faker.lorem.word(),
              faker.randomGenerator.integer(10),
              faker.guid.guid(),
              faker.date.dateTime(),
              faker.date.dateTime(),
              false));
      return courses;
    });
  }
}
