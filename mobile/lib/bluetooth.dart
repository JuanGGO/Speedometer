import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class BluetoothView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _BluetoothViewState();
  }
}

class _BluetoothViewState extends State<BluetoothView>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton.icon(
          label: Text("Back To Home"),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => HomeView())
            );
          },
          icon: Icon(Icons.arrow_back)
        ),
        alignment: Alignment.bottomRight,
      ),
    );
  }
}