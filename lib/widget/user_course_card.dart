import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'progress_widget.dart';
/*
 *课程卡片组件
 */
class UserCourseCard extends StatelessWidget {
  final Map map;
  final VoidCallback onPressed;

  const UserCourseCard({Key key, @required this.map, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //默认 width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: ScreenUtil().setWidth(750),
//        height: ScreenUtil().setWidth(370),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffe3e8ed), blurRadius: 5.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffe7ebf0), blurRadius: 5.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffebeef2), blurRadius: 5.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffeff1f5), blurRadius: 5.0, spreadRadius: 2.0)
            ]),
        child: Row(
          children: <Widget>[
            CourseImage(image: map['image'], teaching: map['teaching']),
            CurseInfo()
          ],
        ),
      ),
    );
  }

//  图片
  Widget CourseImage({@required String image, bool teaching = false}) {
    return Stack(
      children: <Widget>[
        Container(
            width: ScreenUtil().setWidth(250),
            height: ScreenUtil().setHeight(280),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover))),
        teaching == true
            ? Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff93BB24),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                height: 24,
                width: 71,
                child: Text(
                  "持教課程",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(),
      ],
    );
  }

//  文字详情
  Widget CurseInfo() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            map['title'],
            style: TextStyle(
                color: Color(0xff154D7C),
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w500),
          ),
          CurseInfoItem(
              icon: "image/location.png",
              chid: ItemText(title: map['datetime'])),
          CurseInfoItem(
              icon: "image/phone.png", chid: ItemText(title: map['address'])),
          CurseInfoItem(
              icon: "image/process.png",
              chid: ProgressWidget(
                progress: map['process'],
                title: "已完成 ${map['process']}%",
              )),
        ],
      ),
    );
  }

//  帶圖標的文字
  Widget CurseInfoItem({@required String icon, @required Widget chid}) {
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Row(
        children: <Widget>[
          ImageIcon(
            AssetImage(icon),
            size: 22,
            color: Color(0xffB9BDC5),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          chid
        ],
      ),
    );
  }

  Widget ItemText({@required String title}) {
    return Container(
      width: ScreenUtil().setWidth(300),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color(0xffB9BDC5), fontSize: ScreenUtil().setSp(25)),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
