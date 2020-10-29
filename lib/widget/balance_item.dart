import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BalanceItem extends StatelessWidget {
  Map mapDta;
  final VoidCallback onPressed;
  BalanceItem({this.mapDta, this.onPressed});

  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    return Container(
      width: ScreenUtil().setWidth(375),
      child: SingleChildScrollView(
        child: Column(
          children: _listBalance(),
        ),
      ),
    );
  }

//  整合
  List<Widget> _listBalance(){
    List<Widget>listWidget=[];
    mapDta.forEach((k1,v1){
      listWidget.add(YearWidget(k1));
      print(v1);
      v1.map((f1)=>f1.forEach((k2,v2){
        listWidget.add(MonthWidget(k2));
        print(v2);
        v2.map((m2)=>listWidget.add(ContetnItem(title: m2['title'],date: m2['time'],price: m2['price']))).toList();
      })).toList();
    });
    return listWidget;
  }

// 年份Widget组件
  Widget YearWidget(String year){
    return Container(
      padding: EdgeInsets.only(left: 15,top: 15),
      alignment: Alignment.centerLeft,
      child:Text(year,textAlign: TextAlign.left,style: TextStyle(
        color: Color(0xff7B7B7B),
        fontSize: ScreenUtil().setSp(18),
        fontWeight: FontWeight.w500
      ),),
    );
  }

//  月份组件
  Widget MonthWidget(String month){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Row(
        children: <Widget>[
          Expanded(flex: 1,child: Divider(height: 1,color: Color(0xff7B7B7B),),),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Text(month,style: TextStyle(fontSize: ScreenUtil().setSp(12)),),
          ),
          Expanded(flex: 1,child: Divider(height: 1,color: Color(0xff7B7B7B),),),
        ],
      ),
    );
  }

//  显示收支详情的ItemCard
  Widget ContetnItem({String title,String date,String price}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xffdee4eb), blurRadius: 5.0, spreadRadius: 2.0),
            BoxShadow(
                color: Color(0xffe4e9ee), blurRadius: 5.0, spreadRadius: 2.0),
            BoxShadow(
                color: Color(0xffe9edf2), blurRadius: 5.0, spreadRadius: 2.0),
            BoxShadow(
                color: Color(0xffedf0f4), blurRadius: 5.0, spreadRadius: 2.0)
          ]),
      child: Row(
        children: <Widget>[IconWidget(), ContentWidget(title: title,date: date,price: price)],
      ),
    );
  }

//  图标
  Widget IconWidget() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Image.asset(
            'image/Group3.png',
            height: ScreenUtil().setHeight(26),
            width: ScreenUtil().setWidth(21),
          ),
          Text('课程',style: TextStyle(
            color: Color(0xff2D7FC7),
            fontSize: ScreenUtil().setSp(11)
          ),)
        ],
      ),
    );
  }

  Widget ContentWidget({String title,String date,String price}) {
    return Container(
//      color: Colors.tealAccent,
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Color(0xff154d7c), fontSize: ScreenUtil().setSp(15)),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  date,
                  style: TextStyle(color: Color(0xff8C8C8C),fontSize: ScreenUtil().setSp(12)),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                  child: Text(
                    price,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color(0xffFF0033)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
