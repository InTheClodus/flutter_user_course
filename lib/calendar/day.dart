
class Day{
//  因為在日期選擇那裡，如果小於10，而前面沒有0容易報錯，所有才有了這個方法
  static String day(day){
    if(day<10){
      return "0"+day.toString();
    }
    return day.toString();
  }
//  這是因為一個日期計算的方法只返回英文的週，手動將其轉換為中文
  static String week(week){
    if(week=='Sun'){
      return "日";
    }else if(week=='Mon'){
      return "一";
    }else if(week=='Tue'){
      return "二";
    }else if(week=='Wed'){
      return "三";
    }else if(week=='Thu'){
      return "四";
    }else if(week=='Fri'){
      return "五";
    }else{
      return "六";
    }
  }
}