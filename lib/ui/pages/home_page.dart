import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:clock_alarm/ui/clock/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Live Clock',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: ClockView()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<ClockProvider>(context, listen: false).resetAlarm();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlarmPage(),
            ),
          );
        },
        label: const Text('SET ALARM'),
        icon: const Icon(Icons.alarm),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
