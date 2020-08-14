import 'package:flutter/material.dart';
import 'calendar_page_viewModel.dart';
import 'calendar_widget.dart';
import 'day.dart';

/*
* Location 标记当前选中日期和之前的日期相比，
* left： 是在之前日期之前
* mid：  和之前日期相等
* right：在之前日期之后
* */
enum Location{left,mid,right}

typedef void SelectDateOnTap(DayModel checkInTimeModel, DayModel leaveTimeModel);

class CalendarPage extends StatefulWidget {
  final DayModel startTimeModel;// 外部传入的之前选中的入住日期
  final DayModel endTimeModel;// 外部传入的之前选中的离开日期
  final SelectDateOnTap selectDateOnTap;// 确定按钮的callback 给外部传值
  CalendarPage({this.startTimeModel,this.endTimeModel,this.selectDateOnTap});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  String _selectCheckInTime = '';


  List<CalendarItemViewModel> _list = [];
  @override
  void initState() {
    super.initState();
    // 加载日历数据源
    _list = CalendarViewModel().getItemList();
    // 处理外部传入的选中日期
    if(widget.startTimeModel!=null && widget.endTimeModel!=null) {
      for(int i=0; i<_list.length; i++) {
        CalendarItemViewModel model = _list[i];
        if(model.month == widget.startTimeModel.month) {
          _updateDataSource(widget.startTimeModel.year, widget.startTimeModel.month, widget.startTimeModel.dayNum);
        }
        if (model.month == widget.endTimeModel.month) {
          _updateDataSource(widget.endTimeModel.year, widget.endTimeModel.month, widget.endTimeModel.dayNum);
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    // 屏幕宽高
    double screenWith = MediaQuery.of(context).size.width;
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        height: screenHeight,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _weekItem(screenWith),
                SizedBox(
                  width: 20,
                ),

                // 月日期的视图
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      CalendarItemViewModel itemModel = _list[index];
                      return CalendarItem((year, month, checkInTime)
                      {_updateCheckInLeaveTime(year, month, checkInTime);},
                          itemModel,
                          true
                      );
                    },
                    itemCount: _list.length,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).padding.bottom,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  /*
  * 比较后面的日期是比model日期小（left） 还是相等(mid) 还是大 (right)
  * */
  _comparerTime(DayModel model, int year, int month, int day){
    if(year > model.year) {
      return Location.right;
    } else if(year == model.year) {
      if(model.month < month) {
        return Location.right;
      } else if(model.month == month){
        if(model.dayNum < day){
          return Location.right;
        } else if(model.dayNum == day){
          return Location.mid;
        } else {
          return Location.left;
        }
      } else {
        return Location.right;
      }
    } else {
      return Location.left;
    }
  }

  _weekItem(double screenW) {
    List<String> _listS = <String>[
      '日',
      '一',
      '二',
      '三',
      '四',
      '五',
      '六',
    ];
    List<Widget> _listW = [];
    _listS.forEach((title) {
      _listW.add(_weekTitleItem(title, (screenW - 40) / 7));
    });
    return Container(
      width: screenW - 40,
      height: 17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _listW,
      ),
    );
  }
  /*
  * 周内对应的每天的组件
  * */
  _weekTitleItem(String title, double width) {
    return Container(
      alignment: Alignment.center,
      width: width,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xff2D7FC7),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: 'PingFangSC-Semibold',
        ),
      ),
    );
  }

  /*
  * 更新日历的数据源
  * */
  _updateDataSource(int year, int month, int checkInTime) {
    DayModel firstModel = null ;
    for(int i=0; i<_list.length; i++) {
      CalendarItemViewModel model = _list[i];
      if(model.firstSelectModel != null){
        firstModel = model.firstSelectModel;
      }
    }

    if (firstModel != null) {
      for(int i=0; i<_list.length; i++) {
        CalendarItemViewModel model = _list[i];
        model.firstSelectModel = null;
        model.lastSelectModel = null;
        firstModel = null;
        for(int i=0; i<model.list.length; i++) {
          DayModel dayModel = model.list[i];
          dayModel.isSelect = false;
          if(_comparerTime(dayModel, year, month, checkInTime) == Location.mid){
            dayModel.isSelect = true;
            model.firstSelectModel = dayModel;
            _selectCheckInTime = '$year-${Day.day(month)}-${Day.day(checkInTime)}';
          }
        }
      }
    } else if(firstModel != null) {
      if(_comparerTime(firstModel, year, month, checkInTime) == Location.left){
        for(int i=0; i<_list.length; i++) {
          CalendarItemViewModel model = _list[i];
          model.firstSelectModel = null;
          model.lastSelectModel = null;
          firstModel = null;
          for(int i=0; i<model.list.length; i++) {
            DayModel dayModel = model.list[i];
            dayModel.isSelect = false;
            if(_comparerTime(dayModel, year, month, checkInTime) == Location.mid){
              dayModel.isSelect = !dayModel.isSelect;
              model.firstSelectModel = dayModel;
              _selectCheckInTime = '$year-${Day.day(month)}-${Day.day(checkInTime)}';
            }
          }
        }
      } else if(_comparerTime(firstModel, year, month, checkInTime) == Location.mid){//点击了自己
        for(int i=0; i<_list.length; i++) {
          CalendarItemViewModel model = _list[i];
          model.lastSelectModel = null;
          if(model.month == month){
            for(int i=0; i<model.list.length; i++) {
              DayModel dayModel = model.list[i];
              if(_comparerTime(dayModel, year, month, checkInTime) == Location.mid){
                dayModel.isSelect = !dayModel.isSelect;
                model.firstSelectModel = dayModel.isSelect ? dayModel : null;
                _selectCheckInTime = dayModel.isSelect ? '$year-${Day.day(month)}-${Day.day(checkInTime)}' : '';
              }
            }
          }
        }
      }
    } else if(firstModel == null){
      for(int i=0; i<_list.length; i++) {
        CalendarItemViewModel model = _list[i];
        model.firstSelectModel = null;
        model.lastSelectModel = null;
        firstModel = null;
        for(int i=0; i<model.list.length; i++) {
          DayModel dayModel = model.list[i];
          dayModel.isSelect = false;
          if(_comparerTime(dayModel, year, month, checkInTime) == Location.mid){
            dayModel.isSelect = true;
            model.firstSelectModel = dayModel;
            _selectCheckInTime = '$year-${Day.day(month)}-${Day.day(checkInTime)}';
          }
        }
      }
    }
  }

  /*
  * 点击日期的回调事件
  * */
  _updateCheckInLeaveTime(int year, int month, int checkInTime) {
    // 更新数据源
    _updateDataSource(year, month, checkInTime);
    // 刷新UI
    setState(() {});
  }


}