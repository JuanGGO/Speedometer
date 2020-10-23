import 'package:flutter/material.dart';
import 'dart:io';

import 'bluetooth.dart';
import 'data_display.dart';


class HomeView extends StatefulWidget
{
  DataDisplay _dataDisplay;

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }

}

class _HomeViewState extends State<HomeView>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            child: Text('Speedometer'),
            alignment: Alignment.topLeft,
          ),
          backgroundColor: Colors.green,
          leading: Builder(
            builder: (BuildContext context)
            {
              return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {Scaffold.of(context).openDrawer();},
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip);
            },

          ),
        ),
        drawer: Drawer(
          child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  child: DrawerHeader(
                    child: Align(
                      child: Text(
                        "Options",
                        style: TextStyle(color: Colors.red) ,
                      ),
                      alignment: Alignment.center,
                    ),
                    padding: EdgeInsets.all(1),
                    margin: EdgeInsets.all(1),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.bluetooth),
                  title: Text('Search For Devices'),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>BluetoothView())
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Close'),
                  onTap: ()=>exit(0),
                )
              ]
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              DataDisplay(),
              Row(
                children: <Widget>[
                  Text("Extra Gadgets Region")
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        )
    );
  }
}