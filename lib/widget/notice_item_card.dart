import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
/*
 *通知的子项Item
 */
class NoticeItemCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime dateTime;
  final bool isDay;
  final VoidCallback onPressed;

  const NoticeItemCard(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.dateTime,
      this.isDay = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    List<BoxShadow> list = [
      BoxShadow(color: Color(0xffe3e8ed), blurRadius: 5.0, spreadRadius: 2.0),
      BoxShadow(color: Color(0xffe7ebf0), blurRadius: 5.0, spreadRadius: 2.0),
      BoxShadow(color: Color(0xffebeef2), blurRadius: 5.0, spreadRadius: 2.0),
      BoxShadow(color: Color(0xffeff1f5), blurRadius: 5.0, spreadRadius: 2.0)
    ];
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: ScreenUtil().setWidth(375),
//        height: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isDay==true?Colors.white:Color(0xffF3F3F3),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: isDay==true?list:[]),
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(12),
              width: ScreenUtil().setWidth(12),
              decoration: BoxDecoration(
                  color: isDay==true?Color(0xffFFC82C):Color(0xff7897B2),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            rootContentWidget(),
          ],
        ),
      ),
    );
  }

//  內容加標題
  Widget rootContentWidget() {
    return Container(
      child: Column(
        children: <Widget>[titleWidget(), coutentWidget()],
      ),
    );
  }

//  標題部分
  Widget titleWidget() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xff93BB24), fontSize: ScreenUtil().setSp(15)),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(190),
            alignment: Alignment.centerRight,
            child: Text(
              dateTime.month.toString() + "月" + dateTime.day.toString() + "日",
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xff8c8c8c),fontSize: ScreenUtil().setSp(13)),
            ),
          )
        ],
      ),
    );
  }

//  內容部分
  Widget coutentWidget() {
    return Container(
      width: ScreenUtil().setWidth(281),
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color(0xff154D7C), fontSize: ScreenUtil().setSp(12)),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
