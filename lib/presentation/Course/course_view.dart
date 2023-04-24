import 'package:flutter/material.dart';
import 'package:mvvm/ViewModels/CourseProvider.dart';
import 'package:mvvm/model/Course.dart';
import 'package:provider/provider.dart';

class ExpandedItem {
  Course course;
  bool isExpanded;
  ExpandedItem({required this.course, this.isExpanded = false});
}

// use future builder to get data from view model
class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<CourseModelProvider>(context, listen: false).getAllCourse();
    });
    // Provider.of<CourseModelProvider>(context, listen: false).getAllCourse();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<CourseModelProvider>(
      builder: (context, value, child) {
        final courseProvider = context.read<CourseModelProvider>();

        if (context.read<CourseModelProvider>().isLoading)
          return const Center(child: CircularProgressIndicator());
        else {
          final List courses =
              List.generate(courseProvider.courses.length, (index) {
            return ExpandedItem(course: courseProvider.courses[index]);
          });

          // return SingleChildScrollView(
          //   child: ExpansionPanelList(
          //     expansionCallback: (int index, bool isExpanded) {
          //       setState(() {
          //         courses[index].isExpanded = isExpanded;
          //       });
          //     },
          //     children: [

          //     ],
          //   ),

          // );
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final Course course = courses[index].course;
              return ExpansionTile(
                title: Text(course.name),
                leading: Checkbox(
                    value: course.selected,
                    onChanged: (value) {
                      setState(() {
                        course.selected = value!;
                      });
                    }),
                subtitle: Text(course.subjectID),
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.date_range),
                                Text("Date end")
                              ],
                            ),
                            Text(
                                "${course.endDate.day}/${course.endDate.month}/${course.endDate.year}")
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.people),
                                Text("slot")
                              ],
                            ),
                            Text("${course.slot}")
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );

              // ListTile(
              //   leading: Checkbox(
              //     value: course.selected,
              //     onChanged: (value) {
              //       setState(() {
              //         course.selected = value!;
              //       });
              //     },
              //   ),
              //   title: Text(course.name),
              //   subtitle: Text(course.subjectID),
              // );
            },
          );
        }
      },
    ));
  }
}
