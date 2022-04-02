import 'package:flutter/material.dart';
import 'dart:math';

import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:provider/provider.dart';

class SecondPointer extends StatelessWidget {
  const SecondPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockProvider>(
        builder: (context, ClockProvider data, child) {
          final height = MediaQuery.of(context).size.height;
          final second = data.currentDateTime.second.toDouble();
          final angleSecond = (-pi * (second / -60)) * 2;
          final width = MediaQuery.of(context).size.width;
          bool isPortait = height > width;
      return RotatedBox(
        quarterTurns: 2,
        child: Transform.rotate(
          angle: angleSecond,
          child: Transform.translate(
            offset: Offset(0, 34),
            child: Center(
              child: Container(
                height: isPortait ? height * 0.15 : width * 0.10,
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
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
