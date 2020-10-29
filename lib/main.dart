import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_user_course/balance/balance_page.dart';
import 'package:flutter_user_course/my_course.dart';
import 'package:flutter_user_course/tuition/sign_tutoria.dart';
import 'package:flutter_user_course/widget/user_course_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "测试",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('我的课程'),
                onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCourse())),
              ),
              FlatButton(
                child: Text('报名补习'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignTutoria())),
              ),
              FlatButton(
                child: Text('餘額'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BalancePage())),
              )
            ],
          ),
        ));
  }
}
