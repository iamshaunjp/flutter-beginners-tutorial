import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void getData() async {

    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    // print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text(
                'Edit Location'
              )
            )
          ],
        ),
      ),
    );
  }
}
