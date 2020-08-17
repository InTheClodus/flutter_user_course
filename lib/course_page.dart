import 'package:flutter/material.dart';
import 'package:flutter_user_course/courseDetails/course_details_tab.dart';
import 'package:flutter_user_course/widget/user_course_card.dart';

class CoursePage extends StatefulWidget {
  final List<dynamic>listCourse;

  const CoursePage({Key key, this.listCourse}) : super(key: key);
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.listCourse.map((f)=>UserCourseCard(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailsTab())),
          map: f,
        )).toList(),
      ),
    );
  }
}
