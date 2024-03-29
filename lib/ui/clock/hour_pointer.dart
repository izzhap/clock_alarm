import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:provider/provider.dart';

class HourPointer extends StatelessWidget {
  const HourPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockProvider>(
        builder: (context, ClockProvider data, child) {
      final height = MediaQuery.of(context).size.height;
      final hour =
          double.parse((DateFormat('hh').format(data.currentDateTime)));
      final angle = (-pi * (hour / -12)) * 2;
      final width = MediaQuery.of(context).size.width;
      bool isPortait = height > width;
      return RotatedBox(
        quarterTurns: 2,
        child: Transform.rotate(
          angle: angle,
          child: Transform.translate(
            offset: Offset(0, 20),
            child: Center(
              child: Container(
                height: isPortait ? height * 0.06 : width * 0.06,
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
