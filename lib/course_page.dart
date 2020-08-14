import 'package:flutter/material.dart';
import 'package:flutter_user_course/courseDetails/course_details_tab.dart';
import 'package:flutter_user_course/widget/user_course_card.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<dynamic> listCourse = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listCourse = [
      {
        "teaching": true,
        "image": "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
        "title": "麵粉花絲帶花綜合課程",
        "datetime": "2020年2月10日-4月7日(逢星期日 17：30-19：30)",
        "address": "澳門水坑尾街78號中建商業大廈13樓B座",
        "process": 60,
      },
      {
        "teaching": false,
        "image": "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
        "title": "麵粉花絲帶花綜合課程",
        "datetime": "2020年2月10日-4月7日(逢星期日 17：30-19：30)",
        "address": "澳門水坑尾街78號中建商業大廈13樓B座",
        "process": 0,
      },
      {
        "teaching": true,
        "image": "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
        "title": "麵粉花絲帶花綜合課程",
        "datetime": "2020年2月10日-4月7日(逢星期日 17：30-19：30)",
        "address": "澳門水坑尾街78號中建商業大廈13樓B座",
        "process": 100,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: listCourse.map((f)=>UserCourseCard(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailsTab())),
          map: f,
        )).toList(),
      ),
    );
  }
}
