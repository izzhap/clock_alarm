import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:provider/provider.dart';
import 'analogic_circle.dart';
import 'hour_pointer.dart';
import 'minute_pointer.dart';

class ClockAlarmView extends StatelessWidget {
  const ClockAlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockProvider>(
      builder: (context, ClockProvider data, child) {
        return StreamBuilder(
          stream: Stream.periodic(
            Duration(seconds: 1),
          ),
          builder: (context, snapshot) {
            data.updateAlarmDateTime(DateTime.now());
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnalogicCircle(),
                      MinutePointer(),
                      HourPointer(),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(DateFormat('hh:mm a').format(data.currentDateTime),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Visibility(
                          visible: getDiffDate(data.alarmDateTime) > 0,
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.8,
                            ),
                            onPressed: () {
                              data.updateMinuteDiff(-5);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('-5 Minute',
                                      style: TextStyle(
                                          color: Color(0xff000000), fontSize: 19)),
                                ],
                              ),
                            ),
                            color: Color(0xffa3a3a3),
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                          ),
                        ),
                        OutlineButton(
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.8,
                          ),
                          onPressed: () {
                            data.updateMinuteDiff(5);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('+5 Minute',
                                    style: TextStyle(
                                        color: Color(0xff000000), fontSize: 19)),
                              ],
                            ),
                          ),
                          color: Color(0xffa3a3a3),
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }
  int getDiffDate(DateTime alarm){
    final current = DateTime.now();
    final difference = alarm.difference(current).inMinutes;
    return difference;
  }
}
