import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PM25 extends StatefulWidget {
  const PM25({Key? key}) : super(key: key);

  @override
  _PM25State createState() => _PM25State();
}

class _PM25State extends State<PM25> {
  List<DataPoint> chartData = [];
  Timer? _timer;
  double globalCurrentSensorValue = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 2), _generateTrace);
  }

  _generateTrace(Timer t) {
    if (mounted) {
      setState(() {
        chartData.add(DataPoint(DateTime.now(), globalCurrentSensorValue));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      body: Container(
        alignment: Alignment.topCenter,
        height: 600,
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        child: buildStreamBuilder(),
      ),
    );
  }

  Widget buildStreamBuilder() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('EspData').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else {
          var documents = snapshot.data?.docs ?? [];
          for (var f in documents) {
            if (f.id == 'DHT11') {
              print('current value = ${f['PM25']}');
              globalCurrentSensorValue = double.parse(f['PM25']);
            }
          }

          return Center(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              primaryYAxis:
                  NumericAxis(minimum: 0, maximum: 260, opposedPosition: true),
              series: <ChartSeries>[
                LineSeries<DataPoint, DateTime>(
                  dataSource: chartData,
                  xValueMapper: (DataPoint data, _) => data.time,
                  yValueMapper: (DataPoint data, _) => data.value,
                  width: 5,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class DataPoint {
  final DateTime time;
  final double value;

  DataPoint(this.time, this.value);
}
