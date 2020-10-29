import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CreateMyInput extends StatefulWidget {
  final iconString;
  final placeholder;
  final isPassword;
  final inputController;
  final borderColor;
  final title;
  final String information;
  final String tel;
  final Function(String value)validator;
  final IconData msuffixIcon;
  final Color msuffixIconColor;
  final bool isWhethercount;
  final Function(String value) onChange;
  final List<WhitelistingTextInputFormatter> inputFormatters;
//  final Function(String value)validator;
  const CreateMyInput(
      {Key key,
      this.iconString,
      this.placeholder,
      this.isPassword=false,
      this.inputController,
      this.borderColor,
      this.title,
      this.information,
      this.tel,
      this.validator,
      this.msuffixIcon,
      this.msuffixIconColor,
      this.isWhethercount=false,
      this.onChange,this.inputFormatters})
      : super(key: key);

  @override
  _CreateMyInputState createState() => _CreateMyInputState();
}

class _CreateMyInputState extends State<CreateMyInput> {
  FocusNode focusNode = new FocusNode();
  var color = Color(0xffB5C9C3);
  String errorText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      print(focusNode.hasFocus);
      if (focusNode.hasFocus == true) {
        setState(() {
          color = Color(0xffF89777);
        });
      } else if (focusNode.hasFocus == false)
        setState(() {
          color = Color(0xffB5C9C3);
        });
    });
  }

  // 输入框onChange
  void _onChange(String value) {
    if (widget.onChange is Function) {
      widget.onChange(value);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
//    void _validate() {
//      if (widget.information != null) errorText = widget.information('ccc');
//      print('222');
//    }
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: true);
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 15, 0.0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: widget.borderColor == null
                              ? color
                              : widget.borderColor)), //底部border
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Expanded(
                          child: widget.title == null
                                 ? Container(
                                  width: 0,
                                  height: 0,
                                )
                              : Container(
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color(0xff154d7c),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "PingFangHKMedium"),
                            ),
                          ),
                          flex: 1,
                        ),
                        new Expanded(
                          child: widget.information == null
                              ? Container(
                            width: 0,
                            height: 0,
                          )
                              : Text(
                            widget.information,
                            style: TextStyle(color: Color(0xfff25265),
                              fontSize: ScreenUtil().setSp(12),),
                            textAlign: TextAlign.end,
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    TextFormField(
                      controller: widget.inputController,
                      focusNode: focusNode,
                      onChanged: _onChange,
                      inputFormatters: widget.inputFormatters == null
                          ? null
                          : widget.inputFormatters,
                      cursorColor: Colors.amberAccent,
                      decoration: InputDecoration(
                          hintText: widget.placeholder,
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(13), fontFamily: "PingFangHKRegular",),
                          contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //输入框内容部分设置padding，跳转跟icon的对其位置
                          border: InputBorder.none,
                          prefix: widget.tel == null ? null : Text(widget.tel, style: TextStyle(color: Color(0xff4273c3)),),
                          suffixIcon: widget.msuffixIcon == null ? Icon(Icons.star_border, color: Colors.transparent,)
                              : Icon(widget.msuffixIcon, color: widget.msuffixIconColor == null ? color : widget.msuffixIconColor, size: 20,)),
                      obscureText: widget.isPassword,
                      //是否是以星号*显示密码
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
