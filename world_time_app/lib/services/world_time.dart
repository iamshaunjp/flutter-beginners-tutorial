import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to asset flag icon
  String url; // location url for API endpoint
  bool isDayTime; // true or false / day or night

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(data);


      //get properties from data
      String datetime = data['datetime'];
      int offsetHours = int.parse(data['utc_offset'].substring(1,3));
      int offsetMinutes = int.parse(data['utc_offset'].substring(4,6));

      if (data['utc_offset'].substring(0, 1) == "-") {
        offsetHours = -offsetHours;
        offsetMinutes = -offsetMinutes;
      }

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offsetHours, minutes: offsetMinutes));

      // set time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'Could not get the requested time, sorry!';
    }


  }

}