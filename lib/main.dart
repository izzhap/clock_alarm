import 'package:clock_alarm/provider/chart_provider.dart';
import 'package:clock_alarm/ui/pages/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:provider/provider.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ClockProvider()),
    ChangeNotifierProvider(create: (context) => ChartProvider()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analog Clock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
