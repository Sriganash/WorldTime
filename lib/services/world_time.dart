import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location="";  //location name
  String time="";  //time in that location

  String flag=""; //URL to a flag
  String url="";   //location url for api
  bool isDaytime=false;

  WorldTime({required this.location,required this.flag,required this.url});

  Future <void> getTime () async
  {
    Response response=await(get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')));
    Map data=jsonDecode(response.body);
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);

    // print(datetime);
    //print(offset);
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    isDaytime= now.hour>6 && now.hour<18 ? true:false;
    time=DateFormat.jm().format(now);

  }


}

