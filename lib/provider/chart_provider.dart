import 'package:flutter/material.dart';


class ChartProvider extends ChangeNotifier {

  int _timeRinging = 0;
  int _timeSet = 0;

  get timeRinging => _timeRinging;
  get timeAlarmSet => _timeSet;

  // update data chart x-axis
  void updateTimeRinging(int value){
    this._timeRinging += value;
  }

  // update data chart y-axis
  void updateTimeAlarmSet(int value){
    this._timeSet += value;
  }

}