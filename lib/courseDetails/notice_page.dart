import 'package:flutter/material.dart';
import 'package:flutter_user_course/widget/notice_item_card.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  List<dynamic>list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list=[
      {"title":"調課通知","contetn":"各位學員請注意，由於導師因病無法上課，本週上課（2月17日）暫停上課。調課的安排會再作通知及安排。","date":DateTime.parse('2020-12-01'),'isDay':true},
      {"title":"調課通知","contetn":"各位學員請注意，由於導師因病無法上課，本週上課（2月17日）暫停上課。調課的安排會再作通知及安排。","date":DateTime.parse('2020-12-01'),'isDay':false},
      {"title":"調課通知","contetn":"各位學員請注意，由於導師因病無法上課，本週上課（2月17日）暫停上課。調課的安排會再作通知及安排。","date":DateTime.parse('2020-12-01'),'isDay':false},
    ];
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list.map((f)=>NoticeItemCard(title: f['title'],content: f['contetn'],dateTime: f['date'],isDay: f['isDay'],)).toList(),
      ),
    );
  }
}
