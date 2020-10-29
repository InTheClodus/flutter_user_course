import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_user_course/widget/create_my_input.dart';
import 'package:flutter_user_course/widget/my_select.dart';
import 'package:flutter_user_course/widget/progress_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
 *报名登记页面
 */

DateTime dateTime=DateTime.now();
// 最小的可选日期
 String MIN_DATETIME = '1980-01-01';
//最大可选日期
String MAX_DATETIME = formatDate(dateTime, [yyyy,'-',mm,'-',dd]);

class SignTutoria extends StatefulWidget {
  @override
  _SignTutoriaState createState() => _SignTutoriaState();
}

class _SignTutoriaState extends State<SignTutoria> {

  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  String _format = 'yyyy-MMMM-dd';
  bool _showTitle = true;

// 弹窗下标
  int selectedValue = 0;

//  登記進度
  var _indexStack = 0;

//  進度條
  var progre = 50;

//  表单验证
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//  姓名
  TextEditingController regName = new TextEditingController();

//  姓名输入错误提示
  String errName = '';

//  性别
  String regSex = '';

//  性别错误提示
  String errSex = '';

//  生日日期
  String regDateTime='';

//  生日日期填错提示
  String errRegDateTime = '';

//  联络电话
  TextEditingController regPhone = new TextEditingController();

//  联络电话填错提示
  String errPhone = '';

//  電子郵箱
  TextEditingController regEmail = new TextEditingController();

//  电子邮箱填错提示
  String errEmail = '';

//  報讀補習社
  String regTuition = '';

//  報讀補習社錯誤信息
  String errTuition = '';

//  就讀學校
  TextEditingController regSchool = new TextEditingController();

//  就读学校填错提示
  String errSchool = '';

//  就讀年級
  String regGrade = '';

//  就讀年級錯誤提示
  String errGrade = '';

//  性別的集合
  List<String> listSex = ['男', '女'];

//  補習社集合
  List<String> listTuition = ['xxx補習社', 'yyy補習社', 'ppp補習社', 'ooo補習社'];

//  年級的集合
  List<String> listGrade = ['初一', '初二', '初三'];


//验证表单输入
  bool _formVerification() {
//    使用正则是否为中文正則
    RegExp str = new RegExp(r"[\u4e00-\u9fa5]");
//  判断手机号码正則
    RegExp phone = RegExp(r'^(28\d{6}|6\d{7})');
//    判断电子邮箱正則
    RegExp email = RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$");
    bool name = str.hasMatch(regName.text);
    bool isEmail = email.hasMatch(regEmail.text);
    bool school = str.hasMatch(regSchool.text);
    bool isPhone=phone.hasMatch(regPhone.text);
    setState(() {
      name == false ? errName = "* 請填寫正確的姓名" : errName = '';
      isEmail == false ? errEmail = "* 請填寫正確的電子郵箱" : errEmail = '';
      school == false ? errSchool = '* 請填寫正確的學校名稱' : errSchool = '';
      isPhone==false?errPhone="* 請填寫正確的電話號碼" : errPhone='';
      regSex == '' ? errSex = '* 請選擇性別' : errSex = '';
      regTuition == '' ? errTuition = '* 請選擇報讀補習社' : errTuition = '';
      regGrade == '' ? errGrade = '* 請選擇就讀年級' : errGrade = '';
      regDateTime==''?errRegDateTime="* 請選擇出生日期":errRegDateTime='';
    });

    if (name &&
        isEmail &&
        school &&
        isPhone&&
        regSex != '' &&
        regTuition != '' &&
        regGrade != ''&&regDateTime!='') {
      return true;
    } else {
      return false;
    }
  }

// 日期选择
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text("確認", style: TextStyle(color: Colors.red)),
        cancel: Text("取消", style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      dateFormat: _format,
      locale: _locale,
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          regDateTime = formatDate(dateTime, [yyyy,'/',mm,'/',dd]);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
//          顶部的步骤条
          ArticleSteps(),
          IndexedStack(
            index: _indexStack,
            alignment: Alignment.topCenter,
            children: <Widget>[
//              填写资料
              Container(
                width: ScreenUtil().setWidth(375),
                height: ScreenUtil().setHeight(667),
                margin: EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: FillInDataWidget(),
                ),
              ),
//              注册成功
              Container(
                width: ScreenUtil().setWidth(750),
                child: RegSucceWidgetPage(),
              ),
            ],
          )
        ],
      ),
    ));
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
                  icon: 'image/ic-security-register.png',
                  title: '登記',
                  iconColor: progre > 50 ? 0xff2D7FC7 : 0xff9B9B9B,
                  color: progre > 50 ? 0xff2D7FC7 : 0xffF6F6F6),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(375),
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
      @required num color,
      VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            ImageIcon(
              AssetImage(icon),
              size: 35,
              color: Color(iconColor),
            ),
            SizedBox(
              height: 5,
              width: ScreenUtil().setWidth(80),
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(iconColor),
              ),
            )
          ],
        ),
      ),
    );
  }

//  填写资料
  Widget FillInDataWidget() {
    return Column(
      children: <Widget>[
        CreateMyInput(
          inputController: regName,
          borderColor: Color(0xff888DA6),
          title: '姓名',
          placeholder: "輸入您身份證上的中文或葡文姓名",
          information: errName,
//          inputFormatters: [WhitelistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
        ),
        MySelect(
          title: '性別',
          content: regSex,
          information: errSex,
          defalutContent: "選擇報讀學生的性別",
          onPressed: ()=>_didClickSelected('性別'),
        ),
        MySelect(
          title: '生日日期',
          content: regDateTime,
          defalutContent: "YYYY/MM/DD",
          information: errRegDateTime,
          onPressed: ()=>_showDatePicker(),
        ),
        CreateMyInput(
          inputController: regPhone,
          borderColor: Color(0xff888DA6),
          title: '聯絡電話',
          tel: '+853',
          placeholder: "輸入聯絡電話號碼",
          information: errPhone,
        ),
        CreateMyInput(
          inputController: regEmail,
          borderColor: Color(0xff888DA6),
          title: '電子郵箱',
          placeholder: "輸入電子郵箱",
          information: errEmail,
        ),
        MySelect(
          title: '報讀補習社',
          information: errTuition,
          content: regTuition,
          defalutContent: "選擇報讀的補習分社",
          onPressed: ()=>_didClickSelected('補習社'),
        ),
        CreateMyInput(
          inputController: regSchool,
          borderColor: Color(0xff888DA6),
          title: '就讀學校',
          placeholder: "輸入學生就讀的學校",
          information: errSchool,
        ),
        MySelect(
          title: '就讀年級',
          information: errGrade,
          content: regGrade,
          defalutContent: "選擇學生報讀的年級",
          onPressed: ()=>_didClickSelected('年級'),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            '* 學生如欲轉補習社，需親臨補習社辦理手續',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12), color: Color(0xff7B7B7B)),
          ),
        ),
        gradientButton()
      ],
    );
  }

//  登記按鈕
  Widget gradientButton() {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(50),
      margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff93bb25), Color(0xff2f80c4)]), // 渐变色
          borderRadius: BorderRadius.circular(50)),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.transparent,
        // 设为透明色
        elevation: 0,
        // 正常时阴影隐藏
        highlightElevation: 0,
        // 点击时阴影隐藏
        onPressed: () {
          if (_formVerification()) {
            setState(() {
              _indexStack++;
              progre += 50;
            });
          }
        },
        child: Container(
            alignment: Alignment.center,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                Text(
                  '登记',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ) //
            ),
      ),
    );
  }

//登記成功頁面
  Widget RegSucceWidgetPage() {
    return Column(
      children: <Widget>[
        RegSucceWidget(),
        Container(
          color: Colors.amberAccent,
          height: 1,
          width: ScreenUtil().setWidth(750),
          margin: EdgeInsets.all(40),
        ),
        Text(
          '* 請耐心等待補習社聯絡，謝謝登記。',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Color(0xff7B7B7B),
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }

//  登记成功组件
  Widget RegSucceWidget() {
    return Container(
      margin: EdgeInsets.only(top: 100, left: 30, right: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SvgImg(),
            flex: 1,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '登記成功',
                  textAlign: TextAlign.left,
                ),
                Text(
                  '可於我的訂單查看登記記錄',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  /// 登記成功的圖標
  Widget SvgImg() {
    return SvgPicture.string(
      svgImg,
      height: ScreenUtil().setWidth(320),
      width: ScreenUtil().setWidth(320),
    );
  }


  //  弹窗选择的item
  Widget _buildApplyHolidayPicker(String type) {
    return CupertinoPicker(
      backgroundColor: Color(0xffffffff),
      itemExtent: 40,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      children: type == "性別"
          ? listSex.map((type) => Text(type)).toList()
          : type == '補習社'
              ? listTuition.map((f) => Text(f)).toList()
              : listGrade.map((f) => Text(f)).toList(),
    );
  }

// 弹窗
  void _didClickSelected(String type) {
    selectedValue = 0;
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Color(0xffffffff),
            height: 250,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(color: Color(0xff3c61ff)),
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          if (type == "性別") {
                            regSex = listSex[selectedValue];
                          } else if (type == "補習社") {
                            regTuition = listTuition[selectedValue];
                          } else {
                            regGrade=listGrade[selectedValue];
                          }
                        });
                      },
                      child: Text(
                        "完成",
                        style: TextStyle(color: Color(0xff3c61ff)),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    child: _buildApplyHolidayPicker(type),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

const String svgImg =
    '<?xml version="1.0" encoding="UTF-8"?> <svg width="114px" height="114px" viewBox="0 0 114 114" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <title>编组</title> <g id="app" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="scholar/join-flow-3" transform="translate(-58.000000, -202.000000)"> <g id="编组" transform="translate(58.625358, 202.868119)"> <path d="M40.4721084,100.162847 C38.6575688,99.4965718 37.7267164,97.4854744 38.3929913,95.6709349 C39.0592662,93.8563953 41.0703636,92.9255429 42.8849031,93.5918178 C47.2052592,95.1781953 51.7936317,96 56.5,96 C78.3152476,96 96,78.3152476 96,56.5 C96,34.6847524 78.3152476,17 56.5,17 C54.5670034,17 53,15.4329966 53,13.5 C53,11.5670034 54.5670034,10 56.5,10 C82.1812409,10 103,30.8187591 103,56.5 C103,82.1812409 82.1812409,103 56.5,103 C50.967356,103 45.5624317,102.031946 40.4721084,100.162847 Z M56.5,10 C58.4329966,10 60,11.5670034 60,13.5 C60,15.4329966 58.4329966,17 56.5,17 C34.6847524,17 17,34.6847524 17,56.5 C17,64.7501324 19.5310975,72.6113345 24.1772791,79.2107202 C25.2900534,80.7912927 24.9108281,82.9746816 23.3302556,84.0874559 C21.7496831,85.2002302 19.5662942,84.8210049 18.4535199,83.2404324 C12.9834611,75.4708205 10,66.2046463 10,56.5 C10,30.8187591 30.8187591,10 56.5,10 Z" id="Oval" fill="#93BB24" fill-rule="nonzero" transform="translate(56.500000, 56.500000) scale(-1, -1) rotate(14.000000) translate(-56.500000, -56.500000) "></path> <path d="M45.7852796,20.5 C47.8958557,20.5 49.6068156,22.2109599 49.6068156,24.3215359 L49.6061256,24.3941489 L49.6061256,24.3941489 L49.261814,42.5387407 C49.5006508,42.4872611 49.7485509,42.4601551 50.002782,42.4601551 L95.002782,42.4601551 C96.9357786,42.4601551 98.502782,44.0271585 98.502782,45.9601551 C98.502782,47.8931517 96.9357786,49.4601551 95.002782,49.4601551 L50.002782,49.4601551 C49.6881751,49.4601551 49.3832632,49.4186459 49.0932242,49.3408055 L45.8789361,49.2196486 C43.436464,49.1278007 41.5138967,47.1030956 41.5484876,44.6591419 L41.8353067,24.394462 C41.8658745,22.2347518 43.6253531,20.5 45.7852796,20.5 Z" id="Combined-Shape" stroke="#FFC82C" fill="#FFC82C" transform="translate(70.001391, 34.980078) rotate(-45.000000) translate(-70.001391, -34.980078) "></path></g></g></g></svg>';
