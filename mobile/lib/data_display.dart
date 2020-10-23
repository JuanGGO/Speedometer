import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Layout for digits

class SingleDigit extends StatefulWidget
{
  final TextStyle mTextStyle;
  final BoxDecoration mBoxDecoration;
  final int initialValue;

  _SingleDigitState _state;

  SingleDigit({
    this.mBoxDecoration: const BoxDecoration(color: Colors.black),
    this.mTextStyle: const TextStyle(color: Colors.red, fontSize: 30),
    this.initialValue: 0
  });


  @override
  State<StatefulWidget> createState() {
    _state = _SingleDigitState(mTextStyle, mBoxDecoration, 0, this.initialValue);
    return _state;
  }

  void setValue(newValue)
  {
    if(_state != null)
      _state._setValue(newValue);
  }
}


class _SingleDigitState extends State<SingleDigit>
{

  _SingleDigitState(this._textStyle, this._boxDecoration, this._previousValue,
      this._currentValue);

  final double _distance = 0;
  final TextStyle _textStyle;
  final BoxDecoration _boxDecoration;

  int _previousValue;
  int _currentValue;

  void _setValue(int newValue)
  {
    this._previousValue = this._currentValue;
    this._currentValue = newValue;
    setState(() {

    });
  }

  Size _GetSingleDigitSize()
  {
    final painter = TextPainter();
    painter.text = TextSpan(style: _textStyle, text: '0');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = 1.0;
    painter.layout();
    return painter.size;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size digitSize = _GetSingleDigitSize();
    final value = 2;

    return Container(
        decoration: _boxDecoration,
        child: SizedOverflowBox(
          alignment: Alignment.topCenter,
          size: digitSize,
          child: ClipRect(
          clipper: CustomDigitClipper(digitSize),
          child: Transform.translate(
          offset: Offset(0, -this._currentValue * digitSize.height),
          child: Column(
            children: <Widget>[
            for(int i = 0; i < 10; i++)
                Text(i.toString(), style: _textStyle)
            ],
          ),
        ),
        )
      )
    );
  }
}

class CustomDigitClipper extends CustomClipper<Rect>
{
  CustomDigitClipper(this.mDigitSize);
  final Size mDigitSize;

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(Offset.zero,
        Offset(mDigitSize.width, mDigitSize.height));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

/////////////////////// Code to Display ///////////////////////////////////

class DataDisplay extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => _DataDisplayState();
}


class _DataDisplayState extends State<DataDisplay>
{

  SingleDigit _distance = new SingleDigit();

  Widget _SpeedDisplay()
  {
    return Text("Your speed is: ");
  }

  Widget _DistanceDisplay()
  {
    return _distance;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
              Center(
                child:_DistanceDisplay()
              )
            ],
          ),
    );
  }
}

