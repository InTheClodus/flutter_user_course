
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
  const MySelect({Key key, this.title,this.content, this.defalutContent,this.isArrow=true,this.selectedColor=0xff2dc27c,this.unselectedColor=0xff888da6, this.onPressed, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(title,style: TextStyle(color: Color(0xff154d7c),fontSize: 15,fontWeight: FontWeight.w400),),
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
                          child: content==""?Text(defalutContent,
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
