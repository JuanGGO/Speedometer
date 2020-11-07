import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mobile/external/my_flutter_app_icons.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:numberpicker/numberpicker.dart';


class Speedometer extends StatelessWidget
{

  Speedometer(double this.mSpeed);

  final double mSpeed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 80,
            labelOffset: 30,
            axisLineStyle: AxisLineStyle(
              thicknessUnit: GaugeSizeUnit.factor,
              thickness: 0.03,
            ),
            majorTickStyle: MajorTickStyle(
                length: 6,
                thickness: 4,
                color: Colors.black
            ),
            minorTickStyle: MinorTickStyle(
                length: 3,
                thickness: 3,
                color: Colors.black),
            axisLabelStyle: GaugeTextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14),
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 80,
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.03,
                endWidth: 0.03,
                gradient: SweepGradient(
                  colors: const<Color>[Colors.green, Colors.yellow, Colors.red],
                  stops: const<double>[0.0, 0.5, 1]
                )
              )
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: mSpeed,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 1.5,
                needleEndWidth: 6,
                needleColor: Colors.red,
                knobStyle: KnobStyle(
                  knobRadius: 0.09
                )
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          mSpeed.toStringAsFixed(1),
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        Text('kmh',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                angle: 90,
                positionFactor: 1.65
              )
            ],
          )
        ],
      ),
    );
  }
}


class OdometerSlider extends StatelessWidget
{

  OdometerSlider(double this.mDistance, double this.mMaxDistance);

  final double mDistance;
  final double mMaxDistance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              flex: 10,
              child: Container(
                child: Center(
                  child: Text(
                    "Goal: $mMaxDistance Km",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 80,
              child: Stack(
                children: <Widget>[
                  Center(
                  child: Image.asset('assets/images/road.png',
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Icon(CustomIcon.biking, color: Colors.green, size: 20),
                  ),
                  bottom: 30 + mDistance, //TODO: do the right math  to make the bike cover max distance
                  left: 25,
                ),
               ]
              ),
            ),
            Flexible(
                flex: 10,
                child: Container(
                  child: Center(
                    child: Text("Dist: $mDistance Km",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      )
                  ,),
                  ),
                ))
          ]
          )
      )
    );
  }
}


class StartingOptions extends StatelessWidget
{

  StartingOptions(int this._currentValue);

  NumberPicker _distancePicker;
  int _currentValue;

  void _InitializedDistancePicker()
  {
    _distancePicker = new NumberPicker.integer(
        initialValue: 10,
        minValue: 0,
        maxValue: 999,
        onChanged: (value) {
            _currentValue = value;
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    _InitializedDistancePicker();
      return _distancePicker;
  }
}


//class StartingOptions extends StatefulWidget
//{
//  @override
//  State<StatefulWidget> createState() {
//    return _StartingOptionState();
//  }
//}
//
//class _StartingOptionState extends State<StartingOptions>
//{
//  NumberPicker _distancePicker;
//  int _currentValue = 10;
//
//  void _InitializedDistancePicker()
//  {
//    _distancePicker = new NumberPicker.integer(
//        initialValue: 10,
//        minValue: 0,
//        maxValue: 999,
//        onChanged: (value) {
//          setState(() {
//            _currentValue = value;
//          });
//        }
//    );
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    _InitializedDistancePicker();
//      return _distancePicker;
//  }
//}