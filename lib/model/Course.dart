class Course {
  int courseID;
  String name;
  String subjectID;
  int slot;
  DateTime startDate;
  DateTime endDate;
  bool selected;
  Course(this.courseID, this.name, this.slot, this.subjectID, this.startDate,
      this.endDate, this.selected);
  // DisplayCourse toDisplayCourse() {
  //   return DisplayCourse(courseID, name, slot, subjectID, startDate, endDate,);
  // }
}

// class DisplayCourse extends Course {
//   bool selected;
//   DisplayCourse(super.courseID, super.name, super.slot, super.subjectID,
//       super.startDate, super.endDate,
//       {this.selected = false});
// }
