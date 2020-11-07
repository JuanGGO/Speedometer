import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'main_screen.dart';


class HomeView extends StatefulWidget
{
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
        title: Text("Speedometer"),),
      body: HomeViewBody(),
      drawer: HomeViewDrawer(),
    );
  }
}


class HomeViewDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 80,
            child: DrawerHeader(
              child: Container(
                  child: Text("Options"),
                  alignment: Alignment.center,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3
                ),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),

          ListTile(
            title: Container(
                child: Text("Search Bluetooth Devices"),
                alignment: Alignment.center,
            ),
            leading: Icon(Icons.bluetooth),
            onTap: (){},
          ),

          ListTile(
            title: Container(
              child: Text("Quit"),
              alignment: Alignment.center,
            ),
            leading: Icon(Icons.close),
            onTap: () => exit(0),
          )
        ],
      ),
    );
  }
}


class HomeViewBody extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _HomeViewBodyState();
  }
}


class _HomeViewBodyState extends State<HomeViewBody> with SingleTickerProviderStateMixin
{

  double _currentSpeed;
  int _currentSelectedDistance;
  Timer _timer;
  TabController _controller;

  @override
  void initState() {
    _currentSpeed = 0;
    _currentSelectedDistance = 10;
    _controller = TabController(length: 2, vsync: this);
    //_timer = Timer.periodic(const Duration(milliseconds: 1000), (timer)
    //{
    //  setState(() {
    //    _currentSpeed = (Random().nextDouble()*30 + 40);
    //  });
    //});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                // Speedometer
                Flexible(
                  flex: 80,
                  child: Column(
                      children: <Widget>[
                        Speedometer(_currentSpeed)
                      ]
                  ),
                ),
                //Odometer
                Flexible(
                  flex: 20,
                  child: Column(
                    children: <Widget>[
                      OdometerSlider(0, 10)
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
                children: [
                  StartingOptions(_currentSelectedDistance)
                ],
              ),
            ),
          TabBar(
            controller: _controller,
            tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.black,),
              ),
              Tab(
                icon: Icon(Icons.bar_chart, color: Colors.black,),
              )
            ],
          )
        ],
    );
  }
}
