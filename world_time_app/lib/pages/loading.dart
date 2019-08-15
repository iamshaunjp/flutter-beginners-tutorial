import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}

