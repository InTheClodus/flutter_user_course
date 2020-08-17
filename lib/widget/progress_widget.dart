import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//自定義進度條
//progress進度
class ProgressWidget extends StatelessWidget {
  int progress = 0;
  String title;
  bool dot;
  double height = 5;
  double radius = 5;
  num color;
  ProgressWidget({this.progress,this.title,this.dot=false,this.color=0xff93BB24});

  @override
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    double width = ScreenUtil().setWidth(200);
    return Column(
      crossAxisAlignment: dot==false?CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        dot!=true?Text(
          progress == 100 ? "已結課" : progress != 0 ? title : "未开始",
          style: TextStyle(
            color: progress == 0
                ? Color(0xffFFC82C)
                : progress == 100 ? Color(0xffE6E6E6) : Color(0xff93BB24),
            fontSize: ScreenUtil().setSp(25),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ):Container(),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        progress != 0 && progress != 100 || dot==true
            ? Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              margin: EdgeInsets.only(top: 3),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(color: Color(0xffE6E6E6)),
                      ),
                      Positioned(
                        left: 0,
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(radius)),
                          child: Container(
                            width: progress / 100 * width,
                            height: height,
                            decoration:
                            BoxDecoration(color: Color(color)),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            dot==true?Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(left: progress==100?107:0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(color)
              ),
            ):Container(),
          ],
        )
            : Container()
      ],
    );
  }
}
