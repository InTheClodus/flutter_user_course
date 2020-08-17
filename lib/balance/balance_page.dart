import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: MyAppBar('餘額'),
      body: Container(
        child: _balanceWidget(),
      ),
    );
  }

//  顶部AppBar
  Widget MyAppBar(String title){
    return PreferredSize(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
                color: Color(0xffE5EEF6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 200,
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
                   Container(
                     padding: EdgeInsets.only(top: 20),
                     width: MediaQuery.of(context).size.width,
                     child:  Column(

                       children: <Widget>[
                         Text(
                           title,
                           style: TextStyle(
                               color: Color(0xffffffff),
                               fontSize: ScreenUtil().setSp(30),
                               fontWeight: FontWeight.w500),
                           textAlign: TextAlign.center,
                         ),
                         Expanded(
                           child: _balanceWidget(),
                         )
                       ],
                     ),
                   )
                  ],
                )),
          ),
        ],
      ),
      preferredSize: Size(double.infinity, 190),
    );
  }

  Widget _balanceWidget(){
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Text(
           "\$768",
           style: TextStyle(
             color: Colors.white,
             fontSize: ScreenUtil().setSp(100)
           ),
         ),
          Container(
            padding: EdgeInsets.only(top: 30,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('50',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(60)),),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '澳門幣 (MOP)',
                    style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(25)),
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
