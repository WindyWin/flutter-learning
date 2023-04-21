import 'package:flutter/material.dart';
import 'package:mvvm/presentation/Course/course_view_model.dart';

import '../../model/Course.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final _viewModel = CourseModelProvider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: _viewModel.courses,
        builder: (context, snapshot) {
          List<Widget> widgets;
          if (!snapshot.hasError) {
            widgets = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              Text("Error: ${snapshot.error}"),
            ];
          }
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                final courses = snapshot.data!;
                widgets = <Widget>[
                  ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return ListTile(
                          leading: Checkbox(
                            value: course.selected,
                            onChanged: (value) {
                              setState(() {
                                course.selected = value!;
                              });
                            },
                          ),
                          title: Text(course.name),
                          subtitle: Text(course.subjectID),
                        );
                      })
                ];
              } else {
                widgets = <Widget>[
                  const Icon(
                    Icons.error_outline,
                  ),
                  const Text("no data..."),
                ];
              }
              break;

            default:
              widgets = <Widget>[
                const CircularProgressIndicator(),
                Text(snapshot.connectionState.toString()),
              ];
              break;
          }
          return Column(
            children: widgets,
          );
        },
      ),
    );
  }
}
