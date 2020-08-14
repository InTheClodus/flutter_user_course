import 'package:flutter/material.dart';
import 'package:flutter_user_course/course_page.dart';

// 我的课程
// 主tab
class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  var _indexedStack = 0;
  List<String> tabs=['课程','已完成'];
  @override
  Widget build(BuildContext context) {
    TabController _tabController;
      return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: MyAppBar('我的课程'),
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
                    indicatorPadding:
                    EdgeInsets.fromLTRB(35, 0, 35, 0),
                    //底部指示器的Padding
                    labelColor: Color(0xff3d6fc1),
                    //选中label颜色
                    unselectedLabelColor:
                    Color(0xffd9d9d9),
                    //未选中label颜色
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                    tabs: tabs.map((f)=>Tab(text: f,)).toList(),
                    controller: _tabController,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        CoursePage(),
                        CoursePage(),
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

  Widget MyAppBar(String title){
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
