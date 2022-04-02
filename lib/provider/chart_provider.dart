import 'package:flutter/material.dart';


class ChartProvider extends ChangeNotifier {

  int _timeRinging = 0;
  int _timeSet = 0;

  get timeRinging => _timeRinging;
  get timeAlarmSet => _timeSet;

  void updateTimeRinging(int value){
    this._timeRinging += value;
  }

  void updateTimeAlarmSet(int value){
    this._timeSet += value;
  }

}