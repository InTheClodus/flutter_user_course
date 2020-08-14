import 'package:flutter/material.dart';
import 'calendar_page_viewModel.dart';
import 'time_utils.dart';

typedef void OnTapDayItem(int year, int month, int checkInTime);

class CalendarItem extends StatefulWidget {
  final CalendarItemViewModel itemModel;
  final OnTapDayItem dayItemOnTap;
  bool isZ;
  CalendarItem(this.dayItemOnTap, this.itemModel,this.isZ);

  @override
  _CalendarItemState createState() => _CalendarItemState();
}

class _CalendarItemState extends State<CalendarItem> {
  // 日历显示几行
  int _rows = 0;
  List<DayModel> _listModel = <DayModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listModel = widget.itemModel.list;
    widget.isZ=false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    // 显示几行
    _rows = TimeUtil.getRowsForMonthYear(widget.itemModel.year,
        widget.itemModel.month, MaterialLocalizations.of(context));

    return Container(
      width: screenWith,
      height: 25.0 + 24.0 + 17.0 + _rows * 52.0 + 32.0 + 13,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          _yearMonthItem(widget.itemModel.year, widget.itemModel.month),
          _monthAllDays(widget.itemModel.year, widget.itemModel.month, context),
        ],
      ),
    );
  }

  /*
  * 显示年月的组件，需要传入年月日期
  * */
  _yearMonthItem(int year, int month) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      child: Text(
        '$year年$month月',
        style: TextStyle(
          color: Color(0xff154D7C),
          fontSize: 18,
          fontFamily: 'Avenir-Heavy',
        ),
      ),
    );
  }





  _monthAllDays(int year, int month, BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;

    // 当前月前面空的天数
    int emptyDays = TimeUtil.numberOfHeadPlaceholderForMonth(
        year, month, MaterialLocalizations.of(context));

    List<Widget> _list = <Widget>[];

    for (int i = 1; i <= emptyDays; i++) {
      _list.add(_dayEmptyTitleItem(context));
    }

    for (int i = 1; i <= _listModel.length; i++) {
      _list.add(_dayTitleItem(_listModel[i - 1], context));
    }

    List<Row> _rowList = <Row>[
      Row(
        children: _list.sublist(0, 7),
      ),
      Row(
        children: _list.sublist(7, 14),
      ),
      Row(
        children: _list.sublist(14, 21),
      ),
    ];

    if (_rows == 4) {
      _rowList.add(
        Row(
          children: _list.sublist(21, _list.length),
        ),
      );
    } else if (_rows == 5) {
      _rowList.add(
        Row(
          children: _list.sublist(21, 28),
        ),
      );
      _rowList.add(
        Row(
          children: _list.sublist(28, _list.length),
        ),
      );
    } else if (_rows == 6) {
      _rowList.add(
        Row(
          children: _list.sublist(21, 28),
        ),
      );
      _rowList.add(
        Row(
          children: _list.sublist(28, 35),
        ),
      );
      _rowList.add(
        Row(
          children: _list.sublist(35, _list.length),
        ),
      );
    }

    return Container(
      width: screenWith - 40,
      color: Colors.white,
      height: 52.0 * _rows,
      child: Column(
        children: _rowList,
      ),
    );
  }

  /*
  * number 月的几号
  * isOverdue 是否过期
  * */
  _dayTitleItem(DayModel model, BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double singleW = (screenWith - 40) / 7;
    String dayTitle = model.day;
    return GestureDetector(
      onTap: () {
        _dayTitleItemTap(model);
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: singleW,
            height: 52,
            alignment: Alignment.center,
            child: Container(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: model.isSelect?Color(0xffFFC82C):Colors.transparent
              ),
              child: Text(
                dayTitle,
                style: TextStyle(
                  color:model.isSelect?Colors.white
                      :Color(0xff2D7FC7),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Avenir-Medium',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//
  _dayEmptyTitleItem(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double singleW = (screenWith - 40) / 7;
    return Container(
      width: singleW,
      height: 52,
    );
  }

  _dayTitleItemTap(DayModel model) {
    widget.dayItemOnTap(widget.itemModel.year, widget.itemModel.month, model.dayNum);
    setState(() {});
  }
}
