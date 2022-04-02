import 'package:flutter/material.dart';


class ClockProvider extends ChangeNotifier {

  DateTime _currentDateTime = DateTime.now();
  DateTime _alarmDateTime = DateTime.now();
  int _minuteDiff = 0;

  get currentDateTime => _currentDateTime;
  get alarmDateTime => _alarmDateTime;
  get diffMinute => _minuteDiff;

  // update date now clock
  void updateDateTime(DateTime dateTime) {
    this._currentDateTime = dateTime;
  }

  // update date alarm
  void updateAlarmDateTime(DateTime dateTime) {
    this._currentDateTime = dateTime.add(Duration(minutes: _minuteDiff));
  }

  // change difference minute for alarm
  void updateMinuteDiff(int minute){
    this._minuteDiff += minute;
    this._alarmDateTime = this.alarmDateTime.add(Duration(minutes: minute));
  }

  // reset alarm when alarm page open
  void resetAlarm(){
    this._alarmDateTime = DateTime.now();
    this._minuteDiff = 0;
  }
}