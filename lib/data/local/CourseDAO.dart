import 'package:faker/faker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/Course.dart';

class WeatherDao {
  final String tableName = "courses";
  final String courseID = "couseID";
  final String name = "name";
  final String slot = "slot";
  final String subjectID = "subjectID";
  final String startDate = "startDate";
  final String endDate = "endDate";
  final String selected = "selected";

  Database? database;

  Future<Database?> open() async {
    if (database == null) {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, 'e.db');

      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName ($courseID INTEGER PRIMARY KEY, "
            "$name TEXT, $subjectID TEXT,$slot NUM, $startDate DATETIME,$endDate DATETIME,$selected INTEGER);");
        List<Course> courses = List.generate(
            20,
            (index) => Course(index, faker.lorem.word(), 100, faker.guid.guid(),
                faker.date.dateTime(), faker.date.dateTime(), false));
        courses.forEach((element) async {
          await saveCourse(element);
        });
      });
    }
    return database;
  }

  Future<int> saveCourse(Course course) async {
    Database? db = await open();

    var map = <String, dynamic>{};
    map[courseID] = course.courseID;
    map[name] = course.name;
    map[slot] = course.slot;
    map[subjectID] = course.subjectID;
    map[startDate] = course.startDate.toIso8601String();
    map[endDate] = course.endDate.toIso8601String();
    map[selected] = course.selected ? 1 : 0;
    var result = await db?.insert(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result ?? -1;
  }

  Future<List<Course>> getAllCourses() async {
    Database? db = await open();
    var result = await db?.query(tableName);
    return result?.map((e) => getCourseFromRaw(e)).toList() ?? [];
    // return result?.map((e) => getCourseFromRaw(e)).toList();
  }

  Course getCourseFromRaw(Map<String, dynamic> result) {
    return Course(
      result[courseID],
      result[name],
      result[slot],
      result[subjectID],
      DateTime.parse(result[startDate]),
      DateTime.parse(result[endDate]),
      result[selected] == 1 ? true : false,
    );
  }
}
