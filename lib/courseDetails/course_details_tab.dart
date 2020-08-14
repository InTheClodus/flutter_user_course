import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_user_course/courseDetails/course_details.dart';
import 'package:flutter_user_course/courseDetails/notice_page.dart';
import 'package:flutter_user_course/courseDetails/schedule_page.dart';
/*
 * 课程详情tab
 */
class CourseDetailsTab extends StatefulWidget {
  @override
  _CourseDetailsTabState createState() => _CourseDetailsTabState();
}

class _CourseDetailsTabState extends State<CourseDetailsTab> {
  var _indexedStack = 0;
  List<dynamic> tabs = [
    {'title': '課程詳情', 'notice': false},
    {'title': '時間表', 'notice': false},
    {'title': '通知', 'notice': true}
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController;
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: MyAppBar('我的课程詳情'),
        body: IndexedStack(
          index: _indexedStack,
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.yellow,
                  //指示器颜色
                  indicatorWeight: 5,
                  //指示器高度
                  indicatorPadding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  //底部指示器的Padding
                  labelColor: Color(0xff3d6fc1),
                  //选中label颜色
                  unselectedLabelColor: Color(0xffd9d9d9),
                  //未选中label颜色
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(28)),
                  tabs: tabs
                      .map((f) => Tab(
                            child: TabWidget(
                                text: f['title'], notice: f['notice']),
                          ))
                      .toList(),
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      CourseDetails(),
                      SchedulePage(),
                      NoticePage(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget TabWidget({@required String text, bool notice = false}) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        notice == true
            ? Container(
                height: 5,
                width: 5,
                margin: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    color: Color(0xffFFC82C),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
            : Container(
                height: 5,
                width: 5,
              ),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Text(text)
      ],
    );
  }

  Widget MyAppBar(String title) {
    return PreferredSize(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
                color: Color(0xffE5EEF6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xff2D7FC7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: SafeArea(
                child: Stack(
              children: <Widget>[
                IconButton(
                  color: Color(0xffffffff),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 30,
                ),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
          ),
        ],
      ),
      preferredSize: Size(double.infinity, 90),
    );
  }
}
