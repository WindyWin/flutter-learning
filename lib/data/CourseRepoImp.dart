import 'package:mvvm/data/local/CourseDAO.dart';
import 'package:mvvm/model/Course.dart';
import 'package:mvvm/repo/CourseRepo.dart';

class CourseRepoImp with CourseRepo {
  WeatherDao weatherDao = WeatherDao();

  // CourseRepoImp() {
  //   weatherDao.open();
  // }
  Future init() async {
    return await weatherDao.open();
  }

  @override
  Future<List<Course>> getAllCourse() {
    List<Course> courses = [];
    // TODO: implement getAllCourse
    return weatherDao.getAllCourses();
  }
}
