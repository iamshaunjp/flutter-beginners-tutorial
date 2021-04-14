import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      
      //decoding offset sign, hours and minutes
      String offset_sign = data['utc_offset'].substring(0,1);
      String offset_hours = data['utc_offset'].substring(1,3);
      String offset_minutes = data['utc_offset'].substring(4,);
      
      //parsing DateTime
      DateTime now = DateTime.parse(datetime);
      
      //adding or subtracting hours and minutes offset depending on  +/- sign of offset respectively
    if(offset_sign=='+')
      {
        now = now.add(Duration(hours: int.parse(offset_hours),minutes: int.parse(offset_minutes)));
      }
    else if(offset_sign=="-")
      {
        now = now.subtract(Duration(hours: int.parse(offset_hours),minutes: int.parse(offset_minutes)));
      }

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print(e);
      time = 'could not get time';
    }

  }

}
