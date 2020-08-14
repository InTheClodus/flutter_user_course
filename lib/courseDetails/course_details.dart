import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CourseDetails extends StatefulWidget {
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Container(
      margin: EdgeInsets.all(25),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleWidget(),
            ContentWidget(),
            IntroductionWidget(title: '導師', content: '王子文'),
            IntroductionWidget(
                title: '簡介',
                content: '想要製作出一份令自己感到自豪的作品，請勿錯失良機。立即報讀我們的麵粉花絲帶花課程吧！'),
          ],
        ),
      ),
    );
  }

//  頂部標題
  Widget titleWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 10),
            height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setWidth(170),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xff93BB24),
            ),
            child: Text(
              "持教課程",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(25)),
            ),
          ),
          Text(
            '麵粉花絲帶花綜合課程',
            style: TextStyle(
                color: Color(0xff154D7C),
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CurseInfoItem(
              icon: "image/location.png",
              text: '2020年2月10日-4月7日(逢星期日 17:30-19:30)'),
          CurseInfoItem(icon: "image/phone.png", text: '澳門水坑尾街78號中建商業大廈13樓B座'),
          CurseInfoItem(icon: "image/payment.png", text: '\$2,800 (包括雜費及材料費)'),
        ],
      ),
    );
  }

  //  帶圖標的文字
  Widget CurseInfoItem({@required String icon, @required String text}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage(icon),
            size: 22,
            color: Color(0xffFFC82C),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            width: ScreenUtil().setWidth(500),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff9C9C9C), fontSize: ScreenUtil().setSp(30)),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

//  导师和简介
  Widget IntroductionWidget(
      {@required String title, @required String content}) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Divider(
              color: Color(0xffD8D8D8),
              height: 0.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff93BB24),
                  fontSize: ScreenUtil().setSp(30),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            content,
            maxLines: 3,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff9C9C9C),
              fontSize: ScreenUtil().setSp(23)
            ),
          )
        ],
      ),
    );
  }
}
