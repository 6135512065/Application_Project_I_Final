/*
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  final String titleString = "เสร็จสิ้นการลงทะเบียนน";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: new ListView(children: <Widget> [
          new Image.asset('images/logo_ung.PNG', fit: BoxFit.cover,),
        ],)
        
        /*Center(
            child: RaisedButton(
              onPressed: () => {},
              color: Colors.blue,
              child: Text(
                'Raised Button',
                style: TextStyle(color: Colors.white),
              ),
            )
        ),*/
        
      ),
    );
  }

  /*Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(titleString),),
      body: new Container(
        child: new Center(
          child: new Image.asset('images/logo_ung.PNG'),
        ),

      ),
    );
  }*/

}
*/

import 'package:flutter/material.dart';
import 'package:projectflutter/screens/login_page.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  final String titleString = "เสร็จสิ้นการลงทะเบียน";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('เสร็จสิ้นการลงทะเบียนข้อมูล'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              new Image.asset('images/logo_I.PNG'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    var rount = new MaterialPageRoute(
                        builder: (BuildContext contex) => new LoginPage());
                    Navigator.of(context).push(rount);
                  },
                  child: new Text(
                    "ออกจากระบบ",
                    style: new TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
