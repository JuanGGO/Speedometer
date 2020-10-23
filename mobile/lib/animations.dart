import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_display.dart';


class DigitDisplayDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final singleDigitWidget = SingleDigit();    // SingleDigit instance defined here
    return ChangeNotifierProvider(              // Wrap everything in a ChangeNotifierProvider
      create: (_) => SliderValueProvider(),    // Which provides a SliderValueProvider
      child: Scaffold(
          appBar: AppBar(title: Text('Digit Display Demo')),
          body: Center(
              child: Column(
                children: <Widget>[
                  singleDigitWidget,
                  Consumer<SliderValueProvider>(    // Consume the SliderValueProvider
                    builder: (BuildContext _, SliderValueProvider sliderValueProvider, Widget __) {
                      return Slider(
                          value: sliderValueProvider.value.toDouble(),    // set value of the provider
                          min: 0,
                          max: 9,
                          onChanged: (newValue) {
                            if (newValue.toInt() != sliderValueProvider.value.toInt()) {
                              sliderValueProvider.setValue(newValue.toInt());
                              singleDigitWidget.setValue(newValue.toInt());
                            }
                          });
                    },
                  )
                ],
              ))),
    );
  }
}

class SliderValueProvider with ChangeNotifier
{
  int _value = 0;
  int get value => _value;

  void setValue(int newValue)
  {
    _value = newValue;
    notifyListeners();
  }
}
