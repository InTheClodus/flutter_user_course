
import 'package:flutter/material.dart';

class MySelect extends StatelessWidget {

  final String title;
  final String content;
  final bool isArrow;
  final String defalutContent;
  final num selectedColor;
  final num unselectedColor;
  final VoidCallback onPressed;
  final double width;
  final String information;
  const MySelect({Key key, this.title,this.content, this.defalutContent,this.isArrow=true,this.selectedColor=0xff2dc27c,this.unselectedColor=0xff888da6, this.onPressed, this.width,this.information}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                child: title == null
                    ? Container(
                  width: 0,
                  height: 0,
                )
                    :         Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(title,style: TextStyle(color: Color(0xff154d7c),fontSize: 15,fontWeight: FontWeight.w400),),
                ),
                flex: 1,
              ),
              new Expanded(
                child: information == null
                    ? Container(
                  width: 0,
                  height: 0,
                )
                    : Text(
                  information,
                  style: TextStyle(color: Color(0xfff25265)),
                  textAlign: TextAlign.end,
                ),
                flex: 1,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xff888da6),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: width,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Container(
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                          child: content==""||content==null?Text(defalutContent,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4b5461),
                                fontFamily: "PingFangHKRegular"
                            ),):Text(
                            content,
                            style: TextStyle(
//                            fontWeight: FontWeight.w300,
                                color: Color(0xff3E4A59),
                                fontFamily: "PingFangHKMedium",
                                fontSize: 16),
                          ),
                          flex: 9,
                        ),
                        new Expanded(
                            flex: 1,
                            child: isArrow == true
                                ? Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff2E344D),
                            )
                                : Container(
                              height: 0.0,
                              width: 0.0,
                            ))
                      ],
                    )),
              ),
            ),
          ),
        ],
      )
    );
  }
}
