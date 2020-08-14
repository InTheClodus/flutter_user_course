import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_user_course/widget/create_my_input.dart';
import 'package:flutter_user_course/widget/my_select.dart';
import 'package:flutter_user_course/widget/progress_widget.dart';

class SignTutoria extends StatefulWidget {
  @override
  _SignTutoriaState createState() => _SignTutoriaState();
}

class _SignTutoriaState extends State<SignTutoria> {
//  登記進度
  var _indexStack = 0;

//  進度條
  var progre = 50;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ArticleSteps(),
            IndexedStack(
              index: _indexStack,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(1134),
//                  color: Colors.tealAccent,
                  child: SingleChildScrollView(
                    child: FillInDataWidget(),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(750),
                  color: Colors.amberAccent,
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        child: Text('切換'),
                        onPressed: () {
                          setState(() {
                            _indexStack--;
                            progre -= 50;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }

//  步骤条
  Widget ArticleSteps() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleIcon(
                  icon: 'image/ic-actions-fill.png',
                  title: '填寫學生資料',
                  iconColor: progre <= 100 ? 0xff2D7FC7 : 0xff9B9B9B,
                  color: progre <= 50 ? 0xff2D7FC7 : 0xffF6F6F6),
              TitleIcon(
                  icon: 'image/ic-actions-fill.png',
                  title: '登記',
                  iconColor: progre > 50 ? 0xff2D7FC7 : 0xff9B9B9B,
                  color: progre > 50 ? 0xff2D7FC7 : 0xffF6F6F6),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(750),
            child: ProgressWidget(
              color: 0xff2D7FC7,
              progress: progre,
              dot: true,
            ),
          )
        ],
      ),
    );
  }
// 带 Icon的标题
  Widget TitleIcon(
      {@required String icon,
      @required String title,
      @required num iconColor,
      @required num color}) {
    return Container(
      child: Column(
        children: <Widget>[
          ImageIcon(
            AssetImage(icon),
            size: 35,
            color: Color(iconColor),
          ),
          SizedBox(
            height: 5,
            width: ScreenUtil().setWidth(200),
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(iconColor),
            ),
          )
        ],
      ),
    );
  }

//  填写资料
  Widget  FillInDataWidget(){
    return Column(
      children: <Widget>[
        CreateMyInput(
          borderColor: Color(0xff888DA6),
          title: '姓名',
          placeholder: "輸入您身份證上的中文或葡文姓名",
        ),
        MySelect(
          title: '性別',
          content: '',
          defalutContent: "選擇報讀學生的性別",
        )
        ],
    );
  }

}
