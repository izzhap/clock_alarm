import 'package:clock_alarm/ui/clock/second_pointer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:provider/provider.dart';

import 'analogic_circle.dart';
import 'hour_pointer.dart';
import 'minute_pointer.dart';

class ClockView extends StatelessWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockProvider>(
      builder: (context, ClockProvider data, child) {
        return StreamBuilder(
          stream: Stream.periodic(
            Duration(seconds: 1),
          ),
          builder: (context, snapshot) {
            data.updateDateTime(DateTime.now());
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnalogicCircle(),
                      SecondPointer(),
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
                  Text(DateFormat('hh:mm:ss a').format(data.currentDateTime),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(data.currentDateTime),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
