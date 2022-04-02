import 'dart:async';

import 'package:clock_alarm/models/chart_model.dart';
import 'package:clock_alarm/provider/chart_provider.dart';
import 'package:clock_alarm/provider/clock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';

import 'alarm_page.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  late List<ChartModel> chartData = getChartData();
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Alarm Chart',
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
      body: Consumer<ChartProvider>(
        builder: (context, ChartProvider data, child) {
          return StreamBuilder(
              stream: Stream.periodic(
                Duration(seconds: 1),
              ),
            builder: (context, snapshot) {
                data.updateTimeAlarmSet(1);
                data.updateTimeRinging(1);
                int alarmSet = data.timeAlarmSet;
                int alarmRinging = data.timeRinging;
                Timer(Duration(seconds: 1), () {
                  updateDataSource(ChartModel(alarmSet, alarmRinging));
                });
              return SfCartesianChart(
                  series: <LineSeries<ChartModel, int>>[
                    LineSeries<ChartModel, int>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartData,
                      color: Colors.blue,
                      xValueMapper: (ChartModel chart, _) => chart.time,
                      yValueMapper: (ChartModel chart, _) => chart.alarm,
                    )
                  ],
                  primaryXAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      interval: 3,
                      title: AxisTitle(text: 'Time (seconds)')),
                  primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),
                      title: AxisTitle(text: 'Time Alarm Ringing (seconds)')));
            }
          );
        }
      ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child:
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child:
              TextButton(
                onPressed: () {
                  Provider.of<ChartProvider>(context, listen: false).updateTimeAlarmSet(0);
                  Provider.of<ChartProvider>(context, listen: false).updateTimeRinging(0);
                  Navigator.pop(context);
                },
                child: Text(
                  'STOP ALARM',
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

  // update data list chart
  void updateDataSource(ChartModel chartModel) {
    chartData.add(chartModel);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  // initial data chart
  List<ChartModel> getChartData() {
    return <ChartModel>[
      ChartModel(0, 0),
    ];
  }

}
