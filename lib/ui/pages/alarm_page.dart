import 'dart:isolate';

import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:clock_alarm/ui/clock/clock_alarm_view.dart';
import 'package:clock_alarm/ui/pages/chart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Alarm',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: ClockAlarmView()),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child:
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child:
              TextButton(
                onPressed: () {
                  DateTime alarm = Provider.of<ClockProvider>(context, listen: false).alarmDateTime;
                  showNotification(alarm);
                  showInSnackBar("ALARM SET");
                },
                child: Text(
                  'SET ALARM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.25,
                      fontStyle: FontStyle.normal,),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.blue)),
              )
          ),
        )
    );
  }

  // show notification schedule
   void showNotification(DateTime alarm){
    var hour = alarm.hour;
    var minute = alarm.minute;
    var second = alarm.second;
    var androidNoti=new AndroidNotificationDetails('channel_id', 'channel_name',
        channelDescription: 'channel_desc',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    var iosNoti=new IOSNotificationDetails();
    var notiSetting= new NotificationDetails(android: androidNoti, iOS: iosNoti);
    flutterLocalNotificationsPlugin.showDailyAtTime(0, "ALARM RINGING", "TIME TO WAKE UP",new Time(hour,minute,second), notiSetting,payload: "msg");

  }

  // callback when notification click
  void callbackNotification(String? payload) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChartPage(),
      ),
    );
  }

  // initialization for local notification
  void init(){
    flutterLocalNotificationsPlugin=new FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings android=new AndroidInitializationSettings("@mipmap/ic_launcher");
    IOSInitializationSettings ios=new IOSInitializationSettings();
    var initSetting=new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initSetting,onSelectNotification: callbackNotification);
  }

  // showing snackbar message
  void showInSnackBar(String value) {
    _scaffoldKey.currentState?.showSnackBar(new SnackBar(content: new Text(value)));
  }

}
