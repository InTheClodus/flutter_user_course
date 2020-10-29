import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_user_course/widget/balance_item.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {

// 切換tab的標籤欄數據
  List<String>tabs=['紀錄','充值'];

  Map mapData;

  var _indexedStack = 0;

//  初始化数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapData = {
      "2020":[
        {"2月":[
          {
            'title': '二月份标题一',
            'time': '2020/4/30 8:50 PM',
            'price': '-\$1200.0'
          },
          {
            'title': '二月份标题二',
            'time': '2020/4/30 8:50 PM',
            'price': '-\$1200.0'
          },
        ]},
        {
          "3月":[
            {
              'title': '三月份标题1',
              'time': '2020/4/30 8:50 PM',
              'price': '-\$1200.0'
            },
            {
              'title': '三月份标题2',
              'time': '2020/4/30 8:50 PM',
              'price': '-\$1200.0'
            },
          ]
        }
      ]
    };
  }
  @override
  Widget build(BuildContext context) {

    TabController _tabController;
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: MyAppBar('我的课程詳情'),
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
                  indicatorPadding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  //底部指示器的Padding
                  labelColor: Color(0xff3d6fc1),
                  //选中label颜色
                  unselectedLabelColor: Color(0xffd9d9d9),
                  //未选中label颜色
                  labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(28)),
                  tabs: tabs
                      .map((f) => Tab(
                    child: Text(f,style: TextStyle(fontSize: ScreenUtil().setSp(16)),),
                  ))
                      .toList(),
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      BalanceItem(mapDta: mapData,),
                      Container(color: Colors.amberAccent,),
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

//  顶部AppBar
  Widget MyAppBar(String title){
    return PreferredSize(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            width: double.infinity,
            height:  ScreenUtil().setHeight(160),
            decoration: BoxDecoration(
                color: Color(0xffE5EEF6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: ScreenUtil().setHeight(155),
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
                               fontSize: ScreenUtil().setSp(15),
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

//  顶部余额显示组件
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
             fontSize: ScreenUtil().setSp(52.5),
             fontWeight: FontWeight.w500
           ),
         ),
          Container(
            padding: EdgeInsets.only(top: 30,left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('50',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(32.5)),),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '澳門幣 (MOP)',
                    style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(13)),
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
