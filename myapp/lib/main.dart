import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('my first app'),
          centerTitle: true,
          backgroundColor: Colors.red[600]
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('hello, again')
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[600],
        child: Text('click'),
      ),
    );
  }
}

// snippets for padding & margin

//  Container(
//    margin: EdgeInsets.all(40.0),
//    padding: EdgeInsets.all(30.0),
//    color: Colors.grey[400],
//    child: Text('hey, ninjas!'),
//  ),